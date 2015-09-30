#!/usr/bin/env python

import sys
import string
import re

errors = sys.stdin.readlines()

#find current filename, only errors
#in current file will consider as true errors
current_file = None

for error in errors:
    m = re.search("""^\s+File\s+"([^"]+)".+""", error)
    if m is not None:
        current_file = m.group(1)
        # print current_file #for testing
        break

if len(errors) > 0:
    message = errors.pop()[:-1]
errors.reverse()

for error in errors:
    if string.find(error, '  File \"%s\"' % current_file) == 0:
        print error[:-1] + ", " + message
        message = "Traceback"

