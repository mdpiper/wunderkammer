#! /usr/bin/env python
"""This module converts variable names in a TopoFlow .cfg.tmpl file."""
import os


component_metadata_dir = os.path.join(os.path.expanduser('~'),
                                      'projects', 'component_metadata')


def list_files(input_directory):
    """Build list of all the .cfg.tmpl files in the input directory."""
    for root, folders, files in os.walk(input_directory):
        for filename in folders + files:
            head, sep, tail = filename.partition('.')
            if head.istitle() and tail == 'cfg.tmpl':
                yield os.path.join(root, filename)


def convert_types(file_name):
    """Convert parameter and data types in a .cfg.tmpl file."""
    with open(file_name, 'r') as fp:
        cfg = fp.readlines()

    pass1 = []
    for line in cfg:
        ptype = line.replace('_type}', '_ptype}')
        pass1.append(ptype)

    pass2 = []
    for line in pass1:
        var_name, sep, the_rest = line.partition(' ')
        dtype = line.replace('typeof_' + var_name, var_name + '_dtype')
        pass2.append(dtype)

    with open(file_name, 'w') as fp:
        for line in pass2:
            fp.write(str(line))


if __name__ == '__main__':
    cfg_tmpl_files = list_files(component_metadata_dir)
    for cfg_tmpl_file in cfg_tmpl_files:
        convert_types(cfg_tmpl_file)
