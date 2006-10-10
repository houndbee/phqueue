#!/usr/bin/python
# The scheduler is a strange beast. It needs to see if the current schedule
# expires in a day and then fill in the schedule for the next day. If the
# schedule table is empty (running first time) then it fills the schedule
# table

import threading
import time
import datetime
import random
from db import *
from datetime import datetime
from datetime import date
from datetime import timedelta
from time import sleep

class Scheduler ( threading.Thread ):

    def __init__ ( self, daemon ):
        
        self.daemon = daemon
        threading.Thread.__init__ ( self )
        
    def run ( self):
        while 1:
            if self.schedule_older_than_day_or_empty():
                today = date.today()
                self.fill_schedule(today)
                if self.daemon:
                    # Pray to god why 60*60, make this 60*60*23= 23 hours of sleep later?
                    sleep(60*60)
            else:
                if self.daemon:
                    seconds = self.get_time_to_sleep()
                    sleep(seconds)
                    today = date.today()
                    interval = timedelta(seconds=0, minutes=0, hours=24, days=0)
                    tomm = today + interval
                    self.fill_schedule(tomm)
                    sleep(23*60*60)
            if self.daemon==0:
                print 'so the non daemon mode works eh'
                break

    def fill_schedule(self,day):
        print 'Filling schedule'
        if self.date_has_no_show(day):
            cursor.execute("SELECT showid,starttime from masterschedule")
            result_set = cursor.fetchall()
            for row in result_set:
                if row["showid"]==-1:
                    showno = self.pick_random_show()                    
                else:
                    showno = row["showid"]

                if showno == -1:
                    return 0
                
                self.insert_into_schedule(showno,row["starttime"],day)
        return 0
            
        
    def pick_random_show(self):
        cursor.execute("SELECT ID FROM shows")
        result_set = cursor.fetchall()
        if cursor.rowcount!=0:
            guess = random.randrange(cursor.rowcount)
            i=0
            for row in result_set:        
                if i==guess:
                    showid = row['ID']
                    break
                i = i+1
            return showid
        else:
            print 'Show database empty...'
            return -1

    def insert_into_schedule(self,showno,starttime,day):
        print 'Inserting into todays schedule'
        print showno,starttime,day
        print type(starttime),type(showno)
        cursor.execute("INSERT into actualsched (showid,starttime,scheddate) values (%s,%s,%s)", (showno, starttime,day))
        
    def schedule_older_than_day_or_empty(self):
        "Make everything UTC later"
        # check if the latest date in the table is todays date, if no then its older than a day
        # This is panic state it shouldnt happen, This function is a design flaw. Ideally
        # the scheduler should wake up a 11:30PM everyday and fill out the schedule for the next
        
        today = date.today()
        cursor.execute("SELECT scheddate FROM actualsched where scheddate=%s",today)
        row = cursor.fetchone()
        if row==None:
            return 1
        else:            
            cursor.execute("SELECT * FROM actualsched")
            row = cursor.fetchone()
            if row==None:
                return 1
            else:
                return 0        

    def get_time_to_sleep(self):
        now = time.localtime(time.time())
        hour =  now[3]
        minute =  now[4]
        print 'Hour and minute is'
        print hour,minute
        print 'time to sleep'
        print (23-hour)*60*60
    
        if hour==23:
            return 0;
        else:
            return (23-hour)*60*60

        
    def date_has_no_show(self,day):
        cursor.execute("SELECT scheddate FROM actualsched where scheddate=%s",day)
        row = cursor.fetchone()
        if row != None:
            return 0
        return 1
