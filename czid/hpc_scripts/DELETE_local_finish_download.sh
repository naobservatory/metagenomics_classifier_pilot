#!/bin/bash

cd ..
WORKDIR=$(pwd)
DATAPATH=$WORKDIR/data
SEQUENCPATH=$WORKDIR/sequences
RUNINFO=$DATAPATH/parsed_metadata_with_ftp.csv

echo "Downloading non downloaded files"

# Download FASTQs
for RUN in $(tail -n +2 $RUNINFO);
do
    SRAID=$(echo $RUN | cut -d, -f1)
    FASTQ=$(echo $RUN | cut -d, -f3)
    if [ ! -f $SEQUENCPATH/$(basename $FASTQ) ]; then #checks if the file is not present
        echo "Downloading $RUNDIR/$(basename $FASTQ) with the url $FASTQ"
        #curl -o $RUNDIR/$(basename $FASTQ) $FASTQ #REENABLE!
        else echo "$RUNDIR/$(basename $FASTQ) already downloaded. Would have downloaded with the url $FASTQ1"
    fi
done