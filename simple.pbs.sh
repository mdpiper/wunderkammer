#!/usr/bin/env bash
# A simple PBS script. Submit this script to the queue manager with:
#
#  $ qsub simple.pbs.sh

cd $PBS_O_WORKDIR
echo "$PBS_JOBID" >> simple.out
echo "$PBS_O_LOGNAME@$PBS_O_HOST" >> simple.out
echo "" >> simple.out
