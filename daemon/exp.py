#!/usr/bin/python
from db import *
import random

def does_this_work():
    cursor.execute("SELECT MAX(`id`) AS max_id , MIN(`id`) AS min_id FROM `tunes` ");
    row = cursor.fetchone()
    while(1):
        ran = random.randrange(row["min_id"],row["max_id"])
        cursor.execute(" SELECT * FROM `tunes` WHERE `id` = %s LIMIT 0,1 ",ran)        
        row1 = cursor.fetchone()
        if row1:
            break
    print row1["ID"]

while(1):
    does_this_work()
    
