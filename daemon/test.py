#!/usr/bin/python
from time import sleep
from db import *
while(1):
    cursor.execute("SELECT COUNT(*) FROM actualsched")    
    row = cursor.fetchone()
    if row["COUNT(*)"] == 0:
        print 'Hello'
    else:
        print 'argh'
    sleep(60)
