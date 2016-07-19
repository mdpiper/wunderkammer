#!/usr/bin/env python
"""An example of appropriating attributes from another class."""

import importlib
import inspect


class Bird(object):

    def __init__(self):
        self.name = 'bird'
        self.beak = 'hooked'

    def fly(self):
        print 'I can fly!'


class Rodent(object):

    def __init__(self):
        self.name = 'rodent'
        self.teeth = 'sharp'

    def scamper(self):
        print 'I can scamper!'


class Appropriate(object):

    def __init__(self, animal_type='Bird'):
        _class = getattr(importlib.import_module(self.__module__), animal_type)
        for name, value in inspect.getmembers(_class()):
            if not name.startswith('__'):
                setattr(self, name, value)


if __name__ == '__main__':
    a = Appropriate()
    print a.__dict__
    b = Appropriate(animal_type='Rodent')
    print b.__dict__
