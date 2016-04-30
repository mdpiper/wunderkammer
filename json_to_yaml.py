# JSON is a subset of YAML, so it's easy to convert.
# Be sure to set default_flow_style=False.

import yaml

with open('parameters.json', 'r') as ifp:
  params = yaml.safe_load(ifp)

with open('parameters.yaml', 'w') as ofp:
  yaml.dump(params, ofp, default_flow_style=False)
