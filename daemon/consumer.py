#!/usr/bin/python
# The consumer script which is executed by icecast to ask for a new
# song
import threading
from db import *
from time import sleep
import random

class Consumer ( threading.Thread ):

    def run (self):
        while 1:
            #Make the now playing song as played
            cursor.execute("SELECT * FROM producer where curstatus = 0")
            row = cursor.fetchone()
            
            if row:
                cursor.execute("Update producer set curstatus=-1 where ID='%s'",row['ID'])
                
            cursor.execute("SELECT * FROM producer where curstatus = 1")
            row1 = cursor.fetchone()
            if row1:
                cursor.execute("Update producer set curstatus=0 where ID='%s'",row1['ID'])
                print row1['ID'],row1['tuneid'],row1['showid']

            print 'Song consumed'
            sleep(2*60)

consumer = Consumer()
consumer.start()
