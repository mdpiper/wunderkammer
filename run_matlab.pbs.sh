#! /usr/bin/env bash
#PBS -m ae
#PBS -M mark.piper@colorado.edu

# Noninteractively run a MATLAB script through torque on beach.
#
# Workflow:
# 1. Login to beach
# 2. Change to directory that contains script
# 3. Submit job through this script
#
#    $ qsub run_matlab.pbs.sh

cd $PBS_O_WORKDIR
export PATH=/usr/local/bin:$PATH
matlab -nojvm -nodisplay -nosplash -r "foo; exit"
