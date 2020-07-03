#!/usr/bin/env python

import time

count = 0

while True:
    count = count + 1
    print(str(count) + ". This prints once every 5secs.")
    time.sleep(5)