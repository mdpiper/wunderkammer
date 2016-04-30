# Code to poll a PBS job and wait until it's finished.

from subprocess import call, check_output
import time

def job_is_running(job_id):
  """Returns True if the PBS job with the given id is running."""
  return call(['qstat', job_id]) == 0

# Setup happens here...

# Call Delft3D, using the updated input file. 
# Note that `qsub` returns immediately with the PBS job id.
r = check_output(['qsub', 'run_delft3d_wave.sh'])
job_id = r.rstrip('\n')

# Poll the Delft3D job every 10 min. Proceed when it's finished.
while job_is_running(job_id):
  time.sleep(600)

# Process result of job...
