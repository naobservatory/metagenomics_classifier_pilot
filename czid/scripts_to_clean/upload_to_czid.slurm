#!/bin/bash
#SBATCH -n 1 #Request 10 tasks (cores)
#SBATCH -t 12:00:00 #Request runtime of 12 hours (maximum run time)
#SBATCH -p sched_mit_hill #Run on sched_engaging_default partition
#SBATCH --mem-per-cpu=4000 #Request 4G of memory per CPU
#SBATCH -o /nobackup1/slgrimm/slurm/czid/output_czid_upload%j.txt #redirect output to output_JOBID.txt
#SBATCH -e /nobackup1/slgrimm/slurm/czid/error_czid_upload%j.txt #redirect errors to error_JOBID.txt
#SBATCH --mail-type=BEGIN,END #Mail when job starts and ends
#SBATCH --mail-user=slgrimm@mit.edu #email recipient

#Script to upload files to CZID


cd ..
WORKDIR=$(pwd)
DATAPATH=$WORKDIR/sequences
METADATAPATH=$WORKDIR/data_to_clean/czid_upload_metadata_clean_dates.csv


czid short-read-mngs upload-samples \
  -p 'Rothman_all_data' \
  --metadata-csv $METADATAPATH \
  -m 'Metadata Name=Metadata Value' \
  $DATAPATH

