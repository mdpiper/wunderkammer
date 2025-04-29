"""Find and remove the intersection between two email lists."""

import numpy as np

FILE1 = "espin.txt"
FILE2 = "csdms.txt"
OUTFILE = "emails.txt"


emails1 = np.loadtxt(FILE1, dtype=str)
emails2 = np.loadtxt(FILE2, dtype=str)

emails1_lower = list(map(str.lower, emails1))
emails2_lower = list(map(str.lower, emails2))

intersect = set(emails1_lower) & set(emails2_lower)

new = set(emails2_lower) - set(emails1_lower)

with open(OUTFILE, 'w') as fp:
    fp.write('\n'.join(i for i in new))
