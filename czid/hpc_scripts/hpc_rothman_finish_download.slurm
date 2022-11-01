#!/bin/bash
#SBATCH -n 10 #Request 1 tasks (cores)
#SBATCH -t 12:00:00 #Request runtime of 12 hours (maximum run time)
#SBATCH -p sched_mit_hill #Run on sched_engaging_default partition
#SBATCH --mem-per-cpu=4000 #Request 4G of memory per CPU
#SBATCH -o /nobackup1/slgrimm/slurm/czid/output_finish_download%j.txt #redirect output to output_JOBID.txt
#SBATCH -e /nobackup1/slgrimm/slurm/czid/error_finish_download%j.txt #redirect errors to error_JOBID.txt
#SBATCH --mail-type=BEGIN,END #Mail when job starts and ends
#SBATCH --mail-user=slgrimm@mit.edu #email recipient

cd ..
WORKDIR=$(pwd)
DATAPATH=$WORKDIR/data
SEQUENCPATH=$WORKDIR/sequences
RUNINFO=$DATAPATH/parsed_metadata.csv

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