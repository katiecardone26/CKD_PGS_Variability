FROM continuumio/miniconda3
WORKDIR /app

# copy local SNP maps (match SNPs in LD panels) into docker image 
COPY snpinfo_mult_1kg_hm3_map_b37_b38 /app/snpinfo_mult_1kg_hm3_map_b37_b38
COPY snpinfo_mult_ukbb_hm3_map_b37_b38 /app/snpinfo_mult_ukbb_hm3_map_b37_b38

# give SNP maps read permissions
RUN chmod +r /app/snpinfo_mult_1kg_hm3_map_b37_b38 \
    && chmod +r /app/snpinfo_mult_ukbb_hm3_map_b37_b38 \    
    # install tools needed to install PRScsx
    && apt-get update \
    && apt-get install -y --no-install-recommends git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    # download PRScsx
    && git clone --depth 1 -b master https://github.com/getian107/PRScsx.git \
    # install python packages needed for pipeline
    && conda install -y -n base -c conda-forge -c bioconda scipy=1.11.4 h5py pandas seaborn matplotlib pathlib python=3.11 \
    && conda clean --all --yes

USER root
