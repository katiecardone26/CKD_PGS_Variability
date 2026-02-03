#!/bin/bash
# BSUB parameters
######################################################################
#BSUB -J merge_chunks[1-23]
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
#BSUB -o logs/merge_chunks.%J.%I.out 
# Filename to append the job's stdout; change to -oo to overwrite.
#'%J' becomes the job ID number, '%I' becomes the array index.
#BSUB -e logs/merge_chunks.%J.%I.err
# Filename to append the job's stderr; change to -eo to overwrite. 
# If omitted, stderr is combined with stdout. 
# '%J' becomes the job ID number, '%I' becomes the array index.
#BSUB -R "span[hosts=1]"
# Require all cores to be on the same host (for multi-threaded, non-MPI).
#-#BSUB -B
# Send email notification when the job starts
#-#BSUB -N
# Send email notification when the job finishes; otherwise, summary is written to the output file
#BSUB -R "rusage[mem=25000]"
# Per-process memory reservation, in MB.
# (Ensures the job will have this minimum memory.)
#BSUB -M 25000
# Per-process memory limit, in MB.
# (Ensures the job will not exceed this maximum memory.)
#BSUB -v 25000
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
# make merge list
input_manifest="imputed_variant_chunked_input_manifest.tsv"
if [ "$LSB_JOBINDEX" -eq 23 ]; then
    chr_num="chrX"
else
    chr_num=chr${LSB_JOBINDEX}
fi
awk -v i="${chr_num}" '$2 == i {print $2, $3, $4, $5}' "$input_manifest" > merge_lists/file_components/${chr_num}.file_components.txt
awk '{print "input/PMBB_v3_extract/chunked_files/PMBB-Release-2024-3.0_genetic_imputed."$1"_chunk"$2"_"$3"_"$4".ckd_pgs_weights_vars"}' merge_lists/file_components/${chr_num}.file_components.txt > merge_lists/original/${chr_num}.merge_list.txt
grep -vFf none_remaining_plink.txt scripts/merge_lists/original/${chr_num}.merge_list.txt > merge_lists/filtered/${chr_num}.merge_list.txt
wc -l  merge_lists/original/${chr_num}.merge_list.txt
wc -l merge_lists/filtered/${chr_num}.merge_list.txt
# plink command
plink2 --pmerge-list merge_lists/filtered/${chr_num}.merge_list.txt \
--make-pgen \
--out input/PMBB_v3_extract/chr_separated_files/PMBB-Release-2024-3.0_genetic_imputed.ckd_pgs_weights_vars.${chr_num}
--out input/PMBB_v3_extract/chr_separated_files/PMBB-Release-2024-3.0_genetic_imputed.ckd_pgs_weights_vars.${chr_num}
