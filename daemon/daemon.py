#!/usr/bin/python

# 1) Check if master schedule is empty or older than 24 hours
#    If yes fill it up.
#    else move on
# 2) Pick the corresponding show to the time.
#    If its a show which should have started at the hour, then play a randomizer instead.
#    If nothing is scheduled then play a random song
#    If the show starts in less than 10 mins then choose songs which fill up the time
# 3) If the producer table does not have 3 entries then fill it immediately.
# 4) When starting flush everything out in the producer table.
# 5) Start filling in the db.
# 6) Move to ready phase and then start icecast.
# 7) Monitor
#    i) Producer db: Should have minimum 3 entries
#    ii) Icecast: Is it running ?

from producer import *
from scheduler import *

class Daemon ( threading.Thread ):

    def run ( self ):
        #run it first as not a daemom, because we dont want threading issues and the producer not having a schedule
        scheduler = Scheduler(0)
        scheduler.start()
        scheduler.join()        
        scheduler = Scheduler(1)
        scheduler.start()
        producer = Producer()
        producer.start()
        producer.join()
        
print 'Hala heouya, is that how its spelled?'
print 'Starting...'
daemon = Daemon()
daemon.start()


