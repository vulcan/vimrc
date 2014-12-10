#!/usr/bin/env python

import sys
import string
import re

errors = sys.stdin.readlines()

#find current filename, only errors
#in current file will consider as true errors
current_file = None

for error in errors:
    sys.stdout.write(error) #redirect stdin to stdout
    m = re.search("""^\s+File\s+"([^"]+)".+""", error)
    if m is not None and current_file is None:
        current_file = m.group(1)
        # print current_file #for testing
        #break #don't stop when redirect stdin to stdout

if len(errors) > 0:
    message = errors.pop()[:-1]
errors.reverse()

if len(sys.argv) < 1:
    exit(0)
fsock = open(sys.argv[1], 'w')
for error in errors:
    if string.find(error, '  File \"%s\"' % current_file) == 0:
        fsock.write( error[:-1] + ", " + message )
        message = "Traceback"
fsock.flush()
fsock.close()

