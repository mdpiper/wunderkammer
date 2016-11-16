#!/usr/bin/env python
"""An example of sorting file names that include numbers.

This is Eric Hutton's solution.
"""

import re


list_of_files = ['file1.shp', 'file10.shp', 'file100.shp',
                 'file2.shp', 'file20.shp', 'file200.shp',
                 'file3.shp', 'file30.shp', 'file300.shp']

file_parts = [re.split('(\d+)', fname) for fname in list_of_files]
file_parts.sort(cmp=lambda x, y: cmp(int(x[1]), int(y[1])))
sorted_files = [''.join(parts) for parts in file_parts]

print 'Unsorted:'
for f in list_of_files:
    print f

print '\nSorted:'
for f in sorted_files:
    print f
