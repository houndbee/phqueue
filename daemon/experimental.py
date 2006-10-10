#!/usr/bin/python
import time
import datetime
import threading
from db import *
from datetime import datetime
from datetime import date
from datetime import timedelta
from time import sleep

class SongPicker ( threading.Thread ):

    def hello(self):
        print 'sigh'

    def run ( self ):
        self.hello()

now = time.localtime(time.time())
hour =  now[3]
minute =  now[4]

new_hour = hour + (minute+10)/60
print new_hour;

if new_hour == hour + 1:
    print 'Break open the champagne'

d = datetime.now()
cursor.execute("SELECT timest FROM actualsched")
result_set = cursor.fetchall()
for row in result_set:
    d1 =d - row['timest']
    print d1
    if d1.days >= 1:
        print 'Buggy shit...Fix this moron'
        
    hours = d1.seconds/3600
    rem_seconds = d1.seconds - hours*3600
    minutes = rem_seconds/60

    print hours,minutes

print 'Experiment continues...'
today = date.today()
print today

interval = timedelta(seconds=0, minutes=0, hours=24, days=0)
tomm = today + interval
print tomm
#cursor.execute("INSERT into actualsched (showid,starttime,scheddate) values (%s,%s,%s)",(-1,14,today))

cursor.execute("Select * from actualsched where scheddate=%s",today)
row = cursor.fetchone()

print row

