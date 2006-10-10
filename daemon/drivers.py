#!/usr/bin/python
from db import *
from time import sleep
import random
import time

def check_fill_schedule():
    cursor.execute("SELECT COUNT(*) FROM actualsched")    
    row = cursor.fetchone()
    if row["COUNT(*)"] == 0:
        fill_schedule()
    else:
        return 1

def start_producer():
    "The main driver script looks at the schedule and chooses songs accordingly"
    
    now = time.localtime(time.time())
    #http://docs.python.org/lib/module-time.html: for time tuple information
    hour =  now[3]
    minute =  now[4]
    if schedule_older_than_day():
        empty_schedule()
        fill_schedule()
    else:
        
    
def start_icecast():
    pass

def insert_into_schedule(showno,starttime):
    print 'Inserting show,startime'
    print showno,starttime
    print type(starttime),type(showno)
    cursor.execute("INSERT into actualsched (showid,starttime) values (%s,%s)", (showno, starttime))
    

def pick_random_show():
    cursor.execute("SELECT ID FROM shows")
    result_set = cursor.fetchall()
    guess = random.randrange(cursor.rowcount)
    i=0
    for row in result_set:        
        if i==guess:
            showid = row['ID']
            break
        i = i+1

    return showid        

def fill_schedule():
    print 'Filling schedule'
    cursor.execute("SELECT showid,starttime from masterschedule")
    result_set = cursor.fetchall()
    for row in result_set:
        if row["showid"]==-1:
            showno = pick_random_show()
        else:
            showno = row["showid"]
        
        insert_into_schedule(showno,row["starttime"])
        

