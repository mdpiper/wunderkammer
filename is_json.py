#!/usr/bin/env python
"""A function and script for determining whether a file contains valid JSON."""
import json


def is_json(json_file):
    """Returns True if a file is valid JSON."""
    try:
        with open(json_file, 'r') as fp:
            json.load(fp)
    except ValueError:
        return False
    except IOError as e:
        print e
        return False
    else:
        return True


def main():
    """Handle arguments to the `is_json` console script."""
    import argparse

    parser = argparse.ArgumentParser(
        description="Checks whether a file contains valid JSON.")
    parser.add_argument("json_file",
                        help="A file containing JSON")
    parser.add_argument('--version', action='version',
                        version='is_json 0.1')
    args = parser.parse_args()

    r = is_json(args.json_file)
    print '{} : {}'.format(r, args.json_file)


if __name__ == '__main__':
    main()
