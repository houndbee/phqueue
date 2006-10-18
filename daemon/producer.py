#!/usr/bin/python
# The producer class which populates the producer database

import threading
import random
import time
import pdb
from datetime import datetime
from datetime import date
from datetime import timedelta
from time import sleep
from db import *

#curstatus understanding
# 1: Queued to play
# 0: Playing
# -1: Played, remove and archive
#Type for a tune
# 0: Its a song
# 1: Its a promo

#Global count which indicates what songs are gonna be played
# if count%3 then a song will be played
# else a promo will be played
# This also can be used to play exclusives and contest etc in the future
count = 0

class SongPicker ( threading.Thread ):

    def run ( self ):
	global count
        cursor.execute("SELECT COUNT(*) FROM producer where curstatus = 1")
        row = cursor.fetchone()
        if row:
            i = 4 - row["COUNT(*)"]
        else:
            i =4
            
        for j in range(0,i):
            showid = self.schedule_is_show()
            if (showid):
                print 'Inserting show!'
                self.preload_show(showid)
                break
            else:
                count = count +1
                if count%3:
                    print 'Playing song for randomizer'
                    print count                    
                    self.pick_song()
                else:
                    print 'Playing tunes for randomizer'
                    print count
                    self.pick_promo()                    

    def schedule_is_show(self):
        #ToDo: Make it IST and not UTC
        #http://docs.python.org/lib/module-time.html: for time tuple information

        now = time.localtime(time.time())
        hour =  now[3]
        
        cursor.execute("SELECT * FROM actualsched where starttime = %s",hour+1)
        result_set = cursor.fetchall()
        for row in result_set:
            starttime = row['starttime']
            showid = row['showid']
            if self.show_twenty_minutes(starttime):
                print 'Show found'
                print showid
                return showid
        print 'No show mate'
        return 0


    def show_twenty_minutes(self,starttime):
        now = time.localtime(time.time())
        hour =  now[3]
        minute =  now[4]
        print 'Show within twenty minutes?'
        print minute;
        new_hour = hour + (minute+30)/60
        if new_hour == hour + 1:
            return 1
        return 0

    def preload_show(self,showid):
        self.fill_time_lag()
        cursor.execute("SELECT * FROM tunes where showid = %s order by pos",showid)
        result_set = cursor.fetchall()
        for row in result_set:
            print 'Preload Show with showid'
            print showid
            tuneid = row['ID']
            curstatus = 1
            cursor.execute("INSERT into producer (tuneid,showid,curstatus) values (%s,%s,%s)",(tuneid,showid,curstatus))
        return 1


    def songtime(self,tuneid):
        cursor.execute("Select time from tunes where ID=%s",tuneid)
        row = cursor.fetchone()
        if row:
            return row['time']
    
    def current_queued_time(self):
        cursor.execute("SELECT starttime FROM producer where curstatus=0")
        row = cursor.fetchone()
        now = datetime.now()
        sec_queued = 0
        if row:
            print 'Does this ever work...'
            time_left = now - row['starttime']
            sec_queued = time_left.seconds
            
        cursor.execute("SELECT tuneid FROM producer where curstatus=1")
        result_set = cursor.fetchall()
        for row1 in result_set:
            sec_queued = sec_queued + self.songtime(row1["tuneid"])

        return sec_queued
            

    def fill_time_lag(self):
        now = time.localtime(time.time())
        hour =  now[3]
        minute =  now[4]

        num_min = 60 - minute        
	
	num_sec = 60*num_min - self.current_queued_time()
        
        left_time = 0
	i=0
	print 'Filling time lag...'
        print num_sec
        
        while left_time< num_sec:
		if i%3:
	            left_time = left_time + self.pick_song(num_sec - left_time)
		else:			
	            left_time = left_time + self.pick_promo(num_sec - left_time)
                i = i + 1
                print '****'
                print 'Time left is...'
		print num_sec-left_time
                print '****'
        
    def pick_song(self,max_time=10000):
        '''For now this is random, need to make this match tags'''
        # The maximum length of the song is assumed to be 100 because every song will be less than 100 minutes
        return self.pick_random_tune(0,max_time)

    def pick_promo(self,max_time=10000):
        '''Pick a random promo'''
        return self.pick_random_tune(1,max_time)

    
    def pick_random_tune(self,type,max_time):
        # Slower implementation, lets hope this works.
        cursor.execute("SELECT * FROM `tunes` where showid=-1 and type=%s and time<%s ORDER BY RAND() LIMIT 0,1",(type,max_time));
        row1 = cursor.fetchone()
        if row1:
            now = datetime.now()
            cursor.execute("INSERT into producer (tuneid,showid,curstatus) values (%s,%s,%s)",(row1['ID'],-1,1))
            cursor.execute ("update tunes set lastplayed=%s where ID=%s",(now,row1['ID']))
            print 'Song selected is...'
            print row1["fullpath"],row1["time"],row1["ID"]
            return row1["time"]
        else:
            print 'Fuck shit,we a need panic song and a mail that shreyas sucks at designing algorithms'
            # This is not necessary but somehow the select seems to fail sometimes!! weird shit
            if max_time < 30:
                return max_time
            else:
                return 0
            
# FASTER IMPLEMENTATION OF pick_random_tune does not work very well :(
#    def pick_random_tune(self,type,max_time):
#        cursor.execute("SELECT MAX(`id`) AS max_id , MIN(`id`) AS min_id FROM `tunes` ");
#        row = cursor.fetchone()
#        while(1):
#            ran = random.randrange(row["min_id"],row["max_id"])
#            cursor.execute(" SELECT * FROM `tunes` WHERE showid=-1 and `id` = %s and type=%s and time < %s LIMIT 0,1",(ran,type,max_time))        
#            row1 = cursor.fetchone()
#
#  
#            if row1:
#                if type:
#                    print 'Insert into producer song at random'
#                else:
#                    print 'Insert into producer promo at random'
#
#                diff = datetime.now() - row1['lastplayed']
#                print 'Last Played'
#                print diff
#                now = datetime.now()
#                print row1['ID'],-1,now
#                cursor.execute("INSERT into producer (tuneid,showid,curstatus) values (%s,%s,%s)",(row1['ID'],-1,1))
#                cursor.execute ("update tunes set lastplayed=%s where ID=%s",(now,row1['ID']))
#                break
#        return row1["time"]
                
class Producer ( threading.Thread ):

   def run ( self ):

      print 'Producer starting up...'
      self.purge_producer()
      while 1:
          cursor.execute("SELECT COUNT(*) FROM producer where curstatus = 1")
          row = cursor.fetchone()
          if row:
              if row["COUNT(*)"] < 4:          
                  song_picker1 = SongPicker()
                  song_picker1.start()
                  song_picker1.join()
          else:
                  song_picker1 = SongPicker()
                  song_picker1.start()
                  song_picker1.join()
          sleep(60)

   def purge_producer(self):
       cursor.execute("DELETE from producer")
