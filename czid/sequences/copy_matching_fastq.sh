#!/bin/bash

# Copy all fastq.gz files that contain the remaining_files 'Sample Name' in their filename

for line in $(tail -n +2 czid_upload_metadata_clean_dates_subset.csv);
do
    FASTQ=$(echo $line | cut -d, -f1)
    FASTQ1="${FASTQ}_R1.fastq.gz"
    FASTQ2="${FASTQ}_R2.fastq.gz"
    if [ -f $FASTQ1 ]; then
        echo "Copying $FASTQ1"

        cp -v /nobackup1/slgrimm/metagenomics_classifier_pilot/czid/sequences/$FASTQ1 /nobackup1/slgrimm/DELETE_finish_upload/sequences/
            else echo "not needed"
    fi
    if [ -f $FASTQ2 ]; then
        echo "Copying $FASTQ2"

        cp -v /nobackup1/slgrimm/metagenomics_classifier_pilot/czid/sequences/$FASTQ2 /nobackup1/slgrimm/DELETE_finish_upload/sequences/
            else echo "not needed"
    fi

done


