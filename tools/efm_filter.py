#!/usr/bin/env python

import sys
import string

errors = sys.stdin.readlines()

message = errors.pop()[:-1]
errors.reverse()

for error in errors:
    if string.find(error, '  File') == 0:
        print error[:-1] + ", " + message
        message = "Traceback"
