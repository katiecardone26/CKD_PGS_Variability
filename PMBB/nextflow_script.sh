# load modules
module purge
module load nextflow/24.04.3 singularity jdk/11.0.5

# test pipeline
nextflow run pgscatalog/pgsc_calc -profile test,singularity -c lpc_nextflow.config

# run pipeline with v2 data
nextflow run pgscatalog/pgsc_calc -profile singularity -c lpc_nextflow.config \
--input input/PMBB_v2.CKD.PGSC_CALC.samplesheet.csv \
--scorefile "input/pgs_weights/*" \
--target_build GRCh38 \
--outdir output/ \
--max_cpus 32 \
--max_memory 208.GB \
--min_overlap 0.0 \
--max_time 240.h \
--run_ancestry scripts/pgsc_HGDP+1kGP_v1.tar.zst \
--keep_multiallelic True \
--hwe_ref 0 \
--pca_maf_target 0.05

# run pipeline with v3 data
nextflow run pgscatalog/pgsc_calc -profile singularity -c lpc_nextflow.config \
--input input/PMBB_v3.CKD.PGSC_CALC.samplesheet.csv \
--scorefile "input/pgs_weights/*" \
--target_build GRCh38 \
--outdir output/ \
--max_cpus 32 \
--max_memory 208.GB \
--min_overlap 0.0 \
--max_time 240.h \
--run_ancestry scripts/pgsc_HGDP+1kGP_v1.tar.zst \
--keep_multiallelic True \
--hwe_ref 0 \
--pca_maf_target 0.05

# AFR eGFR PRScs iterations
nextflow run pgscatalog/pgsc_calc -profile singularity -c lpc_nextflow.config --with-trace \
--input input/PMBB_v2.CKD.PRScs_iterations.PGSC_CALC.samplesheet.csv \
--scorefile "PRScs/reformatted_outputs/AFR_eGFR/*" \
--target_build GRCh38 \
--outdir output/AFR.eGFR/ \
--max_cpus 32 \
--max_memory 208.GB \
--min_overlap 0.0 \
--max_time 240.h \
--run_ancestry scripts/pgsc_HGDP+1kGP_v1.tar.zst \
--keep_multiallelic True \
--hwe_ref 0 \
--pca_maf_target 0.05

# AFR eGFR flip PRScs iterations
nextflow run pgscatalog/pgsc_calc -profile singularity -c lpc_nextflow.config \
--input input/PMBB_v2.CKD.PRScs_iterations.PGSC_CALC.samplesheet.csv \
--scorefile "PRScs/reformatted_outputs/AFR_eGFR_flip/*" \
--target_build GRCh38 \
--outdir output/AFR.eGFR.flip/ \
--max_cpus 32 \
--max_memory 208.GB \
--min_overlap 0.0 \
--max_time 240.h \
--run_ancestry scripts/pgsc_HGDP+1kGP_v1.tar.zst \
--keep_multiallelic True \
--hwe_ref 0 \
--pca_maf_target 0.05

# AFR Phe PRScs iterations
nextflow run pgscatalog/pgsc_calc -profile singularity -c lpc_nextflow.config \
--input input/PMBB_v2.CKD.PRScs_iterations.PGSC_CALC.samplesheet.csv \
--scorefile "PRScs/reformatted_outputs/AFR_Phe_585.3/*" \
--target_build GRCh38 \
--outdir output/AFR.Phe_585.3/ \
--max_cpus 32 \
--max_memory 208.GB \
--min_overlap 0.0 \
--max_time 240.h \
--run_ancestry scripts/pgsc_HGDP+1kGP_v1.tar.zst \
--keep_multiallelic True \
--hwe_ref 0 \
--pca_maf_target 0.05

# AMR eGFR PRScs iterations
nextflow run pgscatalog/pgsc_calc -profile singularity -c lpc_nextflow.config \
--input input/PMBB_v2.CKD.PRScs_iterations.PGSC_CALC.samplesheet.csv \
--scorefile "PRScs/reformatted_outputs/AMR_eGFR/*" \
--target_build GRCh38 \
--outdir output/AMR.eGFR/ \
--max_cpus 32 \
--max_memory 208.GB \
--min_overlap 0.0 \
--max_time 240.h \
--run_ancestry scripts/pgsc_HGDP+1kGP_v1.tar.zst \
--keep_multiallelic True \
--hwe_ref 0 \
--pca_maf_target 0.05

# AMR eGFR flip PRScs iterations
nextflow run pgscatalog/pgsc_calc -profile singularity -c lpc_nextflow.config \
--input input/PMBB_v2.CKD.PRScs_iterations.PGSC_CALC.samplesheet.csv \
--scorefile "PRScs/reformatted_outputs/AMR_eGFR_flip/*" \
--target_build GRCh38 \
--outdir output/AMR.eGFR.flip/ \
--max_cpus 32 \
--max_memory 208.GB \
--min_overlap 0.0 \
--max_time 240.h \
--run_ancestry scripts/pgsc_HGDP+1kGP_v1.tar.zst \
--keep_multiallelic True \
--hwe_ref 0 \
--pca_maf_target 0.05

# EAS eGFR PRScs iterations
nextflow run pgscatalog/pgsc_calc -profile singularity -c lpc_nextflow.config \
--input input/PMBB_v2.CKD.PRScs_iterations.PGSC_CALC.samplesheet.csv \
--scorefile "PRScs/reformatted_outputs/EAS_eGFR/*" \
--target_build GRCh38 \
--outdir output/EAS.eGFR/ \
--max_cpus 32 \
--max_memory 208.GB \
--min_overlap 0.0 \
--max_time 240.h \
--run_ancestry scripts/pgsc_HGDP+1kGP_v1.tar.zst \
--keep_multiallelic True \
--hwe_ref 0 \
--pca_maf_target 0.05

# EAS eGFR flip PRScs iterations
nextflow run pgscatalog/pgsc_calc -profile singularity -c lpc_nextflow.config \
--input input/PMBB_v2.CKD.PRScs_iterations.PGSC_CALC.samplesheet.csv \
--scorefile "PRScs/reformatted_outputs/EAS_eGFR_flip/*" \
--target_build GRCh38 \
--outdir output/EAS.eGFR.flip/ \
--max_cpus 32 \
--max_memory 208.GB \
--min_overlap 0.0 \
--max_time 240.h \
--run_ancestry scripts/pgsc_HGDP+1kGP_v1.tar.zst \
--keep_multiallelic True \
--hwe_ref 0 \
--pca_maf_target 0.05

# EAS Phe PRScs iterations
nextflow run pgscatalog/pgsc_calc -profile singularity -c lpc_nextflow.config \
--input input/PMBB_v2.CKD.PRScs_iterations.PGSC_CALC.samplesheet.csv \
--scorefile "PRScs/reformatted_outputs/EAS_Phe_585.3/*" \
--target_build GRCh38 \
--outdir output/EAS.Phe_585.3/ \
--max_cpus 32 \
--max_memory 208.GB \
--min_overlap 0.0 \
--max_time 240.h \
--run_ancestry scripts/pgsc_HGDP+1kGP_v1.tar.zst \
--keep_multiallelic True \
--hwe_ref 0 \
--pca_maf_target 0.05

# EUR eGFR PRScs iterations
nextflow run pgscatalog/pgsc_calc -profile singularity -c lpc_nextflow.config \
--input input/PMBB_v2.CKD.PRScs_iterations.PGSC_CALC.samplesheet.csv \
--scorefile "PRScs/reformatted_outputs/EUR_eGFR/*" \
--target_build GRCh38 \
--outdir output/EUR.eGFR/ \
--max_cpus 32 \
--max_memory 208.GB \
--min_overlap 0.0 \
--max_time 240.h \
--run_ancestry scripts/pgsc_HGDP+1kGP_v1.tar.zst \
--keep_multiallelic True \
--hwe_ref 0 \
--pca_maf_target 0.05

# EUR eGFR flip PRScs iterations
nextflow run pgscatalog/pgsc_calc -profile singularity -c lpc_nextflow.config \
--input input/PMBB_v2.CKD.PRScs_iterations.PGSC_CALC.samplesheet.csv \
--scorefile "PRScs/reformatted_outputs/EUR_eGFR_flip/*" \
--target_build GRCh38 \
--outdir output/EUR.eGFR.flip/ \
--max_cpus 32 \
--max_memory 208.GB \
--min_overlap 0.0 \
--max_time 240.h \
--run_ancestry scripts/pgsc_HGDP+1kGP_v1.tar.zst \
--keep_multiallelic True \
--hwe_ref 0 \
--pca_maf_target 0.05

# EUR Phe PRScs iterations
nextflow run pgscatalog/pgsc_calc -profile singularity -c lpc_nextflow.config --with-trace \
--input input/PMBB_v2.CKD.PRScs_iterations.PGSC_CALC.samplesheet.csv \
--scorefile "PRScs/reformatted_outputs/EUR_Phe_585.3/*" \
--target_build GRCh38 \
--outdir output/EUR.Phe_585.3/ \
--max_cpus 32 \
--max_memory 208.GB \
--min_overlap 0.0 \
--max_time 240.h \
--run_ancestry scripts/pgsc_HGDP+1kGP_v1.tar.zst \
--keep_multiallelic True \
--hwe_ref 0 \
--pca_maf_target 0.05

# META eGFR PRScsx iterations - first 200
nextflow run pgscatalog/pgsc_calc -profile singularity -c lpc_nextflow.config \
--input input/PMBB_v2.CKD.PRScs_iterations.PGSC_CALC.samplesheet.csv \
--scorefile "PRScsx/reformatted_outputs/META_eGFR/*" \
--target_build GRCh38 \
--outdir output/META.eGFR/one/ \
--max_cpus 32 \
--max_memory 208.GB \
--min_overlap 0.0 \
--max_time 240.h \
--run_ancestry scripts/pgsc_HGDP+1kGP_v1.tar.zst \
--keep_multiallelic True \
--hwe_ref 0 \
--pca_maf_target 0.05

# META eGFR PRScsx iterations - second 200
nextflow run pgscatalog/pgsc_calc -profile singularity -c lpc_nextflow.config \
--input input/PMBB_v2.CKD.PRScs_iterations.PGSC_CALC.samplesheet.csv \
--scorefile "PRScsx/reformatted_outputs/META_eGFR_2/*" \
--target_build GRCh38 \
--outdir output/META.eGFR/two/ \
--max_cpus 32 \
--max_memory 208.GB \
--min_overlap 0.0 \
--max_time 240.h \
--run_ancestry scripts/pgsc_HGDP+1kGP_v1.tar.zst \
--keep_multiallelic True \
--hwe_ref 0 \
--pca_maf_target 0.05

# META eGFR flip PRScsx iterations- first 200
nextflow run pgscatalog/pgsc_calc -profile singularity -c lpc_nextflow.config \
--input input/PMBB_v2.CKD.PRScs_iterations.PGSC_CALC.samplesheet.csv \
--scorefile "PRScsx/reformatted_outputs/META_eGFR_flip/*" \
--target_build GRCh38 \
--outdir output/META.eGFR.flip/one/ \
--max_cpus 32 \
--max_memory 208.GB \
--min_overlap 0.0 \
--max_time 240.h \
--run_ancestry scripts/pgsc_HGDP+1kGP_v1.tar.zst \
--keep_multiallelic True \
--hwe_ref 0 \
--pca_maf_target 0.05

# META eGFR flip PRScsx iterations- second 200
nextflow run pgscatalog/pgsc_calc -profile singularity -c lpc_nextflow.config \
--input input/PMBB_v2.CKD.PRScs_iterations.PGSC_CALC.samplesheet.csv \
--scorefile "PRScsx/reformatted_outputs/META_eGFR_flip_2/*" \
--target_build GRCh38 \
--outdir output/META.eGFR.flip/two/ \
--max_cpus 32 \
--max_memory 208.GB \
--min_overlap 0.0 \
--max_time 240.h \
--run_ancestry scripts/pgsc_HGDP+1kGP_v1.tar.zst \
--keep_multiallelic True \
--hwe_ref 0 \
--pca_maf_target 0.05

# META Phe PRScsx iterations- first 200
nextflow run pgscatalog/pgsc_calc -profile singularity -c lpc_nextflow.config \
--input input/PMBB_v2.CKD.PRScs_iterations.PGSC_CALC.samplesheet.csv \
--scorefile "PRScsx/reformatted_outputs/META_Phe_585.3/*" \
--target_build GRCh38 \
--outdir output/META.Phe_585.3/one/ \
--max_cpus 32 \
--max_memory 208.GB \
--min_overlap 0.0 \
--max_time 240.h \
--run_ancestry scripts/pgsc_HGDP+1kGP_v1.tar.zst \
--keep_multiallelic True \
--hwe_ref 0 \
--pca_maf_target 0.05

# META Phe PRScsx iterations- second 200
nextflow run pgscatalog/pgsc_calc -profile singularity -c lpc_nextflow.config \
--input input/PMBB_v2.CKD.PRScs_iterations.PGSC_CALC.samplesheet.csv \
--scorefile "PRScsx/reformatted_outputs/META_Phe_585.3_2/*" \
--target_build GRCh38 \
--outdir output/META.Phe_585.3/two/ \
--max_cpus 32 \
--max_memory 208.GB \
--min_overlap 0.0 \
--max_time 240.h \
--run_ancestry scripts/pgsc_HGDP+1kGP_v1.tar.zst \
--keep_multiallelic True \
--hwe_ref 0 \
--pca_maf_target 0.05

# AFR eGFR PRScs iterations- PMBBv3
nextflow run pgscatalog/pgsc_calc -profile singularity -c lpc_nextflow.config --with-trace \
--input input/PMBB_v3.CKD.PRScs_iterations.PGSC_CALC.samplesheet.csv \
--scorefile "PRScs/reformatted_outputs/AFR_eGFR/*" \
--target_build GRCh38 \
--outdir output/AFR.eGFR.PMBBv3/ \
--max_cpus 32 \
--max_memory 208.GB \
--min_overlap 0.0 \
--max_time 240.h \
--run_ancestry scripts/pgsc_HGDP+1kGP_v1.tar.zst \
--keep_multiallelic True \
--hwe_ref 0 \
--pca_maf_target 0.05

# AFR eGFR flip PRScs iterations- PMBBv3
nextflow run pgscatalog/pgsc_calc -profile singularity -c lpc_nextflow.config \
--input input/PMBB_v3.CKD.PRScs_iterations.PGSC_CALC.samplesheet.csv \
--scorefile "PRScs/reformatted_outputs/AFR_eGFR_flip/*" \
--target_build GRCh38 \
--outdir output/AFR.eGFR.flip/ \
--max_cpus 32 \
--max_memory 208.GB \
--min_overlap 0.0 \
--max_time 240.h \
--run_ancestry scripts/pgsc_HGDP+1kGP_v1.tar.zst \
--keep_multiallelic True \
--hwe_ref 0 \
--pca_maf_target 0.05

# AFR Phe PRScs iterations- PMBBv3
nextflow run pgscatalog/pgsc_calc -profile singularity -c lpc_nextflow.config \
--input input/PMBB_v3.CKD.PRScs_iterations.PGSC_CALC.samplesheet.csv \
--scorefile "PRScs/reformatted_outputs/AFR_Phe_585.3/*" \
--target_build GRCh38 \
--outdir output/AFR.Phe_585.3/ \
--max_cpus 32 \
--max_memory 208.GB \
--min_overlap 0.0 \
--max_time 240.h \
--run_ancestry scripts/pgsc_HGDP+1kGP_v1.tar.zst \
--keep_multiallelic True \
--hwe_ref 0 \
--pca_maf_target 0.05

# AMR eGFR PRScs iterations- PMBBv3
nextflow run pgscatalog/pgsc_calc -profile singularity -c lpc_nextflow.config \
--input input/PMBB_v3.CKD.PRScs_iterations.PGSC_CALC.samplesheet.csv \
--scorefile "PRScs/reformatted_outputs/AMR_eGFR/*" \
--target_build GRCh38 \
--outdir output/AMR.eGFR/ \
--max_cpus 32 \
--max_memory 208.GB \
--min_overlap 0.0 \
--max_time 240.h \
--run_ancestry scripts/pgsc_HGDP+1kGP_v1.tar.zst \
--keep_multiallelic True \
--hwe_ref 0 \
--pca_maf_target 0.05

# AMR eGFR flip PRScs iterations- PMBBv3
nextflow run pgscatalog/pgsc_calc -profile singularity -c lpc_nextflow.config \
--input input/PMBB_v3.CKD.PRScs_iterations.PGSC_CALC.samplesheet.csv \
--scorefile "PRScs/reformatted_outputs/AMR_eGFR_flip/*" \
--target_build GRCh38 \
--outdir output/AMR.eGFR.flip/ \
--max_cpus 32 \
--max_memory 208.GB \
--min_overlap 0.0 \
--max_time 240.h \
--run_ancestry scripts/pgsc_HGDP+1kGP_v1.tar.zst \
--keep_multiallelic True \
--hwe_ref 0 \
--pca_maf_target 0.05

# EAS eGFR PRScs iterations- PMBBv3
nextflow run pgscatalog/pgsc_calc -profile singularity -c lpc_nextflow.config \
--input input/PMBB_v3.CKD.PRScs_iterations.PGSC_CALC.samplesheet.csv \
--scorefile "PRScs/reformatted_outputs/EAS_eGFR/*" \
--target_build GRCh38 \
--outdir output/EAS.eGFR/ \
--max_cpus 32 \
--max_memory 208.GB \
--min_overlap 0.0 \
--max_time 240.h \
--run_ancestry scripts/pgsc_HGDP+1kGP_v1.tar.zst \
--keep_multiallelic True \
--hwe_ref 0 \
--pca_maf_target 0.05

# EAS eGFR flip PRScs iterations- PMBBv3
nextflow run pgscatalog/pgsc_calc -profile singularity -c lpc_nextflow.config \
--input input/PMBB_v3.CKD.PRScs_iterations.PGSC_CALC.samplesheet.csv \
--scorefile "PRScs/reformatted_outputs/EAS_eGFR_flip/*" \
--target_build GRCh38 \
--outdir output/EAS.eGFR.flip/ \
--max_cpus 32 \
--max_memory 208.GB \
--min_overlap 0.0 \
--max_time 240.h \
--run_ancestry scripts/pgsc_HGDP+1kGP_v1.tar.zst \
--keep_multiallelic True \
--hwe_ref 0 \
--pca_maf_target 0.05

# EAS Phe PRScs iterations- PMBBv3
nextflow run pgscatalog/pgsc_calc -profile singularity -c lpc_nextflow.config \
--input input/PMBB_v3.CKD.PRScs_iterations.PGSC_CALC.samplesheet.csv \
--scorefile "PRScs/reformatted_outputs/EAS_Phe_585.3/*" \
--target_build GRCh38 \
--outdir output/EAS.Phe_585.3/ \
--max_cpus 32 \
--max_memory 208.GB \
--min_overlap 0.0 \
--max_time 240.h \
--run_ancestry scripts/pgsc_HGDP+1kGP_v1.tar.zst \
--keep_multiallelic True \
--hwe_ref 0 \
--pca_maf_target 0.05

# EUR eGFR PRScs iterations- PMBBv3
nextflow run pgscatalog/pgsc_calc -profile singularity -c lpc_nextflow.config \
--input input/PMBB_v3.CKD.PRScs_iterations.PGSC_CALC.samplesheet.csv \
--scorefile "PRScs/reformatted_outputs/EUR_eGFR/*" \
--target_build GRCh38 \
--outdir output/EUR.eGFR/ \
--max_cpus 32 \
--max_memory 208.GB \
--min_overlap 0.0 \
--max_time 240.h \
--run_ancestry scripts/pgsc_HGDP+1kGP_v1.tar.zst \
--keep_multiallelic True \
--hwe_ref 0 \
--pca_maf_target 0.05

# EUR eGFR flip PRScs iterations- PMBBv3
nextflow run pgscatalog/pgsc_calc -profile singularity -c lpc_nextflow.config \
--input input/PMBB_v3.CKD.PRScs_iterations.PGSC_CALC.samplesheet.csv \
--scorefile "PRScs/reformatted_outputs/EUR_eGFR_flip/*" \
--target_build GRCh38 \
--outdir output/EUR.eGFR.flip/ \
--max_cpus 32 \
--max_memory 208.GB \
--min_overlap 0.0 \
--max_time 240.h \
--run_ancestry scripts/pgsc_HGDP+1kGP_v1.tar.zst \
--keep_multiallelic True \
--hwe_ref 0 \
--pca_maf_target 0.05

# EUR Phe PRScs iterations- PMBBv3
nextflow run pgscatalog/pgsc_calc -profile singularity -c lpc_nextflow.config --with-trace \
--input input/PMBB_v3.CKD.PRScs_iterations.PGSC_CALC.samplesheet.csv \
--scorefile "PRScs/reformatted_outputs/EUR_Phe_585.3/*" \
--target_build GRCh38 \
--outdir output/EUR.Phe_585.3/ \
--max_cpus 32 \
--max_memory 208.GB \
--min_overlap 0.0 \
--max_time 240.h \
--run_ancestry scripts/pgsc_HGDP+1kGP_v1.tar.zst \
--keep_multiallelic True \
--hwe_ref 0 \
--pca_maf_target 0.05

# META eGFR PRScsx iterations - first 200- PMBBv3
nextflow run pgscatalog/pgsc_calc -profile singularity -c lpc_nextflow.config \
--input input/PMBB_v3.CKD.PRScs_iterations.PGSC_CALC.samplesheet.csv \
--scorefile "PRScsx/reformatted_outputs/META_eGFR/*" \
--target_build GRCh38 \
--outdir output/META.eGFR/one/ \
--max_cpus 32 \
--max_memory 208.GB \
--min_overlap 0.0 \
--max_time 240.h \
--run_ancestry scripts/pgsc_HGDP+1kGP_v1.tar.zst \
--keep_multiallelic True \
--hwe_ref 0 \
--pca_maf_target 0.05

# META eGFR PRScsx iterations - second 200- PMBBv3
nextflow run pgscatalog/pgsc_calc -profile singularity -c lpc_nextflow.config \
--input input/PMBB_v3.CKD.PRScs_iterations.PGSC_CALC.samplesheet.csv \
--scorefile "PRScsx/reformatted_outputs/META_eGFR_2/*" \
--target_build GRCh38 \
--outdir output/META.eGFR/two/ \
--max_cpus 32 \
--max_memory 208.GB \
--min_overlap 0.0 \
--max_time 240.h \
--run_ancestry scripts/pgsc_HGDP+1kGP_v1.tar.zst \
--keep_multiallelic True \
--hwe_ref 0 \
--pca_maf_target 0.05

# META eGFR flip PRScsx iterations- first 200- PMBB v3
nextflow run pgscatalog/pgsc_calc -profile singularity -c lpc_nextflow.config \
--input input/PMBB_v3.CKD.PRScs_iterations.PGSC_CALC.samplesheet.csv \
--scorefile "PRScsx/reformatted_outputs/META_eGFR_flip/*" \
--target_build GRCh38 \
--outdir output/META.eGFR.flip/one/ \
--max_cpus 32 \
--max_memory 208.GB \
--min_overlap 0.0 \
--max_time 240.h \
--run_ancestry scripts/pgsc_HGDP+1kGP_v1.tar.zst \
--keep_multiallelic True \
--hwe_ref 0 \
--pca_maf_target 0.05

# META eGFR flip PRScsx iterations- second 200- PMBBv3
nextflow run pgscatalog/pgsc_calc -profile singularity -c lpc_nextflow.config \
--input input/PMBB_v3.CKD.PRScs_iterations.PGSC_CALC.samplesheet.csv \
--scorefile "PRScsx/reformatted_outputs/META_eGFR_flip_2/*" \
--target_build GRCh38 \
--outdir output/META.eGFR.flip/two/ \
--max_cpus 32 \
--max_memory 208.GB \
--min_overlap 0.0 \
--max_time 240.h \
--run_ancestry scripts/pgsc_HGDP+1kGP_v1.tar.zst \
--keep_multiallelic True \
--hwe_ref 0 \
--pca_maf_target 0.05

# META Phe PRScsx iterations- first 200- PMBBv3
nextflow run pgscatalog/pgsc_calc -profile singularity -c lpc_nextflow.config \
--input input/PMBB_v3.CKD.PRScs_iterations.PGSC_CALC.samplesheet.csv \
--scorefile "PRScsx/reformatted_outputs/META_Phe_585.3/*" \
--target_build GRCh38 \
--outdir output/META.Phe_585.3/one/ \
--max_cpus 32 \
--max_memory 208.GB \
--min_overlap 0.0 \
--max_time 240.h \
--run_ancestry scripts/pgsc_HGDP+1kGP_v1.tar.zst \
--keep_multiallelic True \
--hwe_ref 0 \
--pca_maf_target 0.05

# META Phe PRScsx iterations- second 200- PMBB v3
nextflow run pgscatalog/pgsc_calc -profile singularity -c lpc_nextflow.config \
--input input/PMBB_v3.CKD.PRScs_iterations.PGSC_CALC.samplesheet.csv \
--scorefile "PRScsx/reformatted_outputs/META_Phe_585.3_2/*" \
--target_build GRCh38 \
--outdir output/META.Phe_585.3/two/ \
--max_cpus 32 \
--max_memory 208.GB \
--min_overlap 0.0 \
--max_time 240.h \
--run_ancestry scripts/pgsc_HGDP+1kGP_v1.tar.zst \
--keep_multiallelic True \
--hwe_ref 0 \
--pca_maf_target 0.05
