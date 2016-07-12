#!/usr/bin/env bash
#PBS -l nodes=compute-2-0:ppn=1 # Specify which node to use
#PBS -N specify-node              # Job name
#PBS -o $PBS_JOBNAME.out          # File name for standard output
#PBS -e $PBS_JOBNAME.err          # File name for standard error
#
# A PBS script that specifies which node a job should be run on.
# Submit this script to the queue manager with:
#
#  $ qsub specify-node.pbs.sh

cd $PBS_O_WORKDIR
output_file=$PBS_JOBNAME.txt
echo "$PBS_JOBID" >> $output_file
echo "$PBS_O_LOGNAME@$PBS_O_HOST" >> $output_file
echo `hostname` >> $output_file
