#!/bin/bash

WORKDIR=$(pwd)
CZIDPATH=$WORKDIR/CZID_UPLOAD
RUNDIR=$CZIDPATH/RothmanAll
RUNINFO=$RUNDIR/rothman_all_data.csv

czid short-read-mngs upload-samples \
  -p 'Rothman_all_data' \
  --metadata-csv czid_upload_metadata_clean_dates.csv \
  -m 'Metadata Name=Metadata Value' \
  $RUNDIR

