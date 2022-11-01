#!/bin/bash

ENDPOINT="https://www.ebi.ac.uk/ena/portal/api/filereport"
ACCESSION="PRJNA729801"
FIELDS="fastq_ftp,sample_alias"
PARAMS="?accession=${ACCESSION}&fields=${FIELDS}&format=tsv"
PARAMS="${PARAMS}&result=read_run&download=true&limit=0"

cd ..
RAW_METADATA=data/raw_metadata.tsv
PARSED_METADATA=data/parsed_metadata_with_ftp.csv

if [[ ! -e $RAW_METADATA ]]; then
    wget "${ENDPOINT}${PARAMS}" -O $RAW_METADATA
fi

if [[ ! -e "$PARSED_METADATA" ]]; then
    ./local_scripts/parse_metadata_with_ftp.py $RAW_METADATA $PARSED_METADATA
fi

#
echo "Parsed output in $PARSED_METADATA"

