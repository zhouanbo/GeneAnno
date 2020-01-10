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
wget http://www.informatics.jax.org/downloads/reports/HOM_MouseHumanSequence.rpt


# RefSeq
# wget ftp://ftp.ncbi.nlm.nih.gov/refseq/H_sapiens/annotation/GRCh38_latest/refseq_identifiers/GRCh38_latest_genomic.gff.gz
# gunzip RCh38_latest_genomic.gff.gz

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

node disease-import.js

#rm *tsv
#rm *csv