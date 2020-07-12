#!/bin/env python3

from Xlib import X, display
import time

d = display.Display()
s = d.screen()
root = s.root
while True:
    root.warp_pointer(300,300)
    d.sync()
    time.sleep(100)
    root.warp_pointer(200,300)
    d.sync()
    time.sleep(100)
