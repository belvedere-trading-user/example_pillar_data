# -*- coding: utf-8 -*-
'''
Renderer that takes yaml delimeted by '========'
and loads each section as a python input_dictect and merges them
into a single dictionary that is returned to Salt.

Intended to be used in conjunction with the built in
Jinja renderer; i.e.

#!jinja|deepmerge
test:
  test1: one
  test2: nottwo
========
test:
  test2: two

will result in:
test:
  test1: one
  test2: two

This allows for using Jinja imports as a default and then
overriding the default.

IMPORTANT NOTE:
No attempt is made to merge/add/subtract from lists within
dictionaries.  A list will be replaced by the downstream list
if it is present.
'''
import copy
import yaml
import logging
from salt.ext.six import string_types

log = logging.getLogger(__name__)

DELIMITER = '========'

def _deep_merge(target, input_dict):
    if not isinstance(input_dict, dict):
        return input_dict
    for key, val in input_dict.iteritems():
        if key in target and isinstance(target[key], dict):
            _deep_merge(target[key], val)
        else:
            target[key] = copy.deepcopy(val)
    return target

def render(yaml_data, saltenv='base', sls='', **kwargs): # pylint: disable=unused-argument
    output = {}
    if not isinstance(yaml_data, string_types):
        yaml_data = yaml_data.read()
    split_yaml = yaml_data.split(DELIMITER)
    for item in split_yaml:
        _deep_merge(output, yaml.load(item))
    return output
