#!/usr/bin/env bash
#PBS -l nodes=1:ppn=1       # Number of nodes and processors per node
#PBS -l walltime=1:00:00    # Maximum wall time (hh:mm:ss)
#PBS -N simple              # Job name
#PBS -o simple.out          # File name for standard output
#PBS -e simple.err          # File name for standard error
#
# A simple PBS script. Submit this script to the queue manager with:
#
#  $ qsub simple.pbs.sh
#
# Other PBS commands (ignored because they're not at the top of the file):
#PBS -q debug               # Queue name
#PBS -M <email address>     # Send mail to this address
#PBS -m e                   # Send mail when job ends
#PBS -A <allocation_name>   # Allocation name

cd $PBS_O_WORKDIR
output_file=$PBS_JOBNAME.txt
echo "$PBS_JOBID" >> $output_file
echo "$PBS_O_LOGNAME@$PBS_O_HOST" >> $output_file
echo "" >> $output_file
