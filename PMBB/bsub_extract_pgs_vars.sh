#!/bin/bash

# BSUB parameters
######################################################################

#BSUB -J extract_pgs_vars[1-980]
# Job name and (optional) job array properties, in the format
#   "jobname"
# for a simple job, or
#   "jobname[min-max:step]%limit"
# for an array job, where
#   'jobname' is the label shown in job status and summary displays
#   'min' is the first array index
#   'max' is the last array index
#   'step' is the step value between array indecies
#   'limit' is the number of array sub-jobs that can run at once
# In an array job, the variable $LSB_JOBINDEX will contain the index
# of the current sub-job

#BSUB -o logs/extract_pgs_vars.%J.%I.out 
# Filename to append the job's stdout; change to -oo to overwrite.
#'%J' becomes the job ID number, '%I' becomes the array index.

#BSUB -e logs/extract_pgs_vars.%J.%I.err
# Filename to append the job's stderr; change to -eo to overwrite. 
# If omitted, stderr is combined with stdout. 
# '%J' becomes the job ID number, '%I' becomes the array index.

#BSUB -R "span[hosts=1]"
# Require all cores to be on the same host (for multi-threaded, non-MPI).

#-#BSUB -B
# Send email notification when the job starts

#-#BSUB -N
# Send email notification when the job finishes; otherwise, summary is written to the output file

#-#BSUB -R "rusage[mem=200000]"
# Per-process memory reservation, in MB.
# (Ensures the job will have this minimum memory.)

#-#BSUB -M 200000
# Per-process memory limit, in MB.
# (Ensures the job will not exceed this maximum memory.)

#-#BSUB -v 200000
# Total process virtual (swap) memory limit, in MB.

#-#BSUB -W 24:00
# Wall time limit, in the format "hours:minutes".
#-#BSUB -n 1
# Number of cores to reserve (on one or more hosts: ; see below).
# The variable $LSB_HOSTS lists allocated hosts like "hostA hostA hostB";
# the variable $LSB_MCPU_HOSTS lists allocated hosts like "hostA 2 hostB 1")

#-#BSUB -R "span[ptile=1]"
# Maximum number of cores to reserve on each host (for MPI).

#BSUB -R "select[ostype>=CENT7]"
# Require that the job runs on CentOS 7 host(s).

######################################################################
# load required modules
module load plink/2.0-20240804

# optionally set working directory and data directory
IMPUTED_DATA_DIR="/static/PMBB/PMBB-Release-2024-3.0/Imputed"

# get variables from input manifest file and LSB_JOBINDEX
input_manifest="${IMPUTED_DATA_DIR}/imputed_variant_chunked_input_manifest.tsv"
read chrid chunk start_pos stop_pos < <(awk -v i="$LSB_JOBINDEX" '$1 == i {print $2, $3, $4, $5}' "$input_manifest")plink1_prefix="${IMPUTED_DATA_DIR}/chunked_bed_files/PMBB-Release-2024-3.0_genetic_imputed.${chrid}_chunk${chunk}_${start_pos}_${stop_pos}"
plink2_prefix="${IMPUTED_DATA_DIR}/chunked_pgen_files/PMBB-Release-2024-3.0_genetic_imputed.${chrid}_chunk${chunk}_${start_pos}_${stop_pos}"

# plink command
plink2 --pfile ${plink2_prefix} \
--extract range pgs_weights/var_list/all_weights.var_list.txt \
--set-all-var-ids @:#:\$r:\$a \
--new-id-max-allele-len 1000 \
--make-pgen \
--out input/PMBB_v3_extract/chunked_files/PMBB-Release-2024-3.0_genetic_imputed.${chrid}_chunk${chunk}_${start_pos}_${stop_pos}.ckd_pgs_weights_vars
