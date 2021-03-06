#!/bin/bash

# Accessed Jan 10, 2020
# brew install csvkit


# HGNC
# wget ftp://ftp.ebi.ac.uk/pub/databases/genenames/new/json/hgnc_complete_set.json
# sed -i '' 's/docs/hgnc/' hgnc_complete_set.json
# node hgnc-import.js


# IMPC
# wget ftp://ftp.ebi.ac.uk/pub/databases/impc/release-10.1/csv/ALL_genotype_phenotype.csv.gz
# gunzip ALL_genotype_phenotype.csv.gz
# csvjson ALL_genotype_phenotype.csv > ALL_genotype_phenotype.json
# node impc-import.js


# HOM
# wget http://www.informatics.jax.org/downloads/reports/HOM_MouseHumanSequence.rpt
# awk '$2=="mouse, laboratory" || $2=="human"{print}' FS="\t" HOM_AllOrganism.rpt > HOM_AllOrganism.filter.rpt
# awk 'BEGIN{print("let hom_convert={")}{a[$1]=$4;if($1 in a){print("\""$4"\":\""a[$1]"\",")}}END{print("}")}' FS="\t" HOM_AllOrganism.filter.rpt > HOM_AllOrganism.js


# RefSeq
# wget ftp://ftp.ncbi.nlm.nih.gov/refseq/H_sapiens/annotation/GRCh38_latest/refseq_identifiers/GRCh38_latest_genomic.gff.gz
# gunzip GRCh38_latest_genomic.gff.gz
# awk 'BEGIN{print("name\tcontig\tstart\tend\tstrand\tdescription\tsynonym\tbiotype")}$0!~/^#/&&$3=="gene"{split($9,a1,"Name=");split(a1[2],a2,";");split($9,b1,"description=");split(b1[2],b2,";");split($9,c1,"gene_synonym=");split(c1[2],c2,";");split($9,d1,"gene_biotype=");split(d1[2],d2,";");print(a2[1]"\t"$1"\t"$4"\t"$5"\t"$7"\t"b2[1]"\t"c2[1]"\t"d2[1])}' FS="\t" OFS="\t" GRCh38_latest_genomic.gff | sed "s/\'//g" > GRCh38_latest.tsv
# csvjson GRCh38_latest.tsv > GRCh38_latest.json
# node refseq-import.js
# awk '{print $1"\t"$7}' FS="\t" GRCh38_latest.tsv > synonym.txt
# awk '{b[$1]=$2}END{for(i in b){split(b[i],a,",");for(j=1;j<=length(a);j++){print("\""a[j]"\":\""i"\",")}}}' synonym.txt > synonym_conversion.js


# DISEASE
# wget http://download.jensenlab.org/human_disease_textmining_filtered.tsv
# wget http://download.jensenlab.org/human_disease_knowledge_filtered.tsv
# wget http://download.jensenlab.org/human_disease_experiments_filtered.tsv

# echo "ID	SYMBOL	DOID	NAME	ZSCORE	Confidence	LINK" | cat - human_disease_textmining_filtered.tsv > human_disease_textmining_filtered.header.tsv
# csvjson human_disease_textmining_filtered.header.tsv > human_disease_textmining_filtered.json

# echo "ID	SYMBOL	DOID	NAME	SOURCE	Evidence	Confidence" | cat - human_disease_knowledge_filtered.tsv > human_disease_knowledge_filtered.header.tsv
# csvjson human_disease_knowledge_filtered.header.tsv > human_disease_knowledge_filtered.json

# echo "ID	SYMBOL	DOID	NAME	SOURCE	Evidence	Confidence" | cat - human_disease_experiments_filtered.tsv > human_disease_experiments_filtered.header.tsv
# csvjson human_disease_experiments_filtered.header.tsv > human_disease_experiments_filtered.json

# node disease-import.js


# ExAC
# wget ftp://ftp.broadinstitute.org/pub/ExAC_release/release1/manuscript_data/forweb_cleaned_exac_r03_march16_z_data_pLI.txt.gz
# gunzip forweb_cleaned_exac_r03_march16_z_data_pLI.txt.gz
# csvjson forweb_cleaned_exac_r03_march16_z_data_pLI.txt > exac_r03.json
# node exac-import.js


# GTEx
# wget https://storage.googleapis.com/gtex_analysis_v8/rna_seq_data/GTEx_Analysis_2017-06-05_v8_RNASeQCv1.1.9_gene_median_tpm.gct.gz
# gunzip GTEx_Analysis_2017-06-05_v8_RNASeQCv1.1.9_gene_median_tpm.gct.gz
# csvjson GTEx_Analysis_2017-06-05_v8_RNASeQCv1.1.9_gene_median_tpm.gct > GTEx_Analysis_2017-06-05_v8_RNASeQCv1.1.9_gene_median_tpm.json
# node gtex-import.js


# Allen
# wget -O genes_martix_csv.zip http://www.brainspan.org/api/v2/well_known_file_download/267666525
# unzip genes_martix_csv.zip
# cp allen_convert.js genes_martix_csv/
# cd genes_martix_csv
# npm i csv-parse mathjs
# node allen-convert.js
# mv allen.json ../
# cd ..
# node allen-import.js


# rm *tsv
# rm *csv