#!/usr/bin/python
from db import *

def song_time(tuneid):
    cursor.execute("Select time from tunes where ID=%s",tuneid)
    row =cursor.fetchone()
    return row["time"]

def check_songs():
    cursor.execute("Select tuneid from producer where showid=-1 and curstatus=1");
    result_set = cursor.fetchall()
    time_queued =0
    for row in result_set:
        time_queued = time_queued + song_time(row["tuneid"])

    print 'The time left is...'
    print time_queued
    

check_songs()
