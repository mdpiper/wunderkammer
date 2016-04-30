from subprocess import check_output

def matlab_is_running():
  """Returns True if an instance of MATLAB is currently running."""
  cmd = 'ps -u $USER | grep -i MATLAB | wc -l'
  r = check_output(cmd, shell=True)
  return int(r) > 0
