from string import *
import sys
import MySQLdb
from datetime import datetime

db = MySQLdb.connect(host="localhost", user="root", passwd="wtfc",db="tunequeue")
cursor = db.cursor(MySQLdb.cursors.DictCursor)

# This is just a skeleton, something for you to start with.

songnumber = -1

# Function called to initialize your python environment.
# Should return 1 if ok, and 0 if something went wrong.
def ices_init ():
	print 'Executing initialize() function..'
	return 1

# Function called to shutdown your python enviroment.
# Return 1 if ok, 0 if something went wrong.
def ices_shutdown ():
	print 'Executing shutdown() function...'
	return 1

def get_file_name(id):
	cursor.execute("select fullpath from tunes where ID='%s'",id)
	row = cursor.fetchone()
	if row:
		return row['fullpath']
	else:
		print 'Huge shit happened wtf...'
		return '/usr/local/phwqueue/panic.mp3'

# Function called to get the next filename to stream. 
# Should return a string.
def ices_get_next ():
	print 'Executing get_next() function...'
	cursor.execute("SELECT * FROM producer where curstatus = 0")
	row = cursor.fetchone()
	now = datetime.now()
	print now
	
	if row:
		print row
                cursor.execute("Update producer set curstatus=-1 where ID=%s",row['ID'])
                
	cursor.execute("SELECT * FROM producer where curstatus=1")
	row1 = cursor.fetchone()

	if row1:
		cursor.execute("Update producer set curstatus=0,starttime=%s where ID=%s",(now,row1['ID']))
		file_name = get_file_name (row1['tuneid'])
		print 'Playing next'
		print file_name
		return file_name
	else:
		print 'Playing next'
		print '/usr/local/phwqueue/panic.mp3'
		return '/usr/local/phwqueue/panic.mp3'


# This function, if defined, returns the string you'd like used
# as metadata (ie for title streaming) for the current song. You may
# return null to indicate that the file comment should be used.
def ices_get_metadata ():
        return 'Artist - Title (Label, Year)'

# Function used to put the current line number of
# the playlist in the cue file. If you don't care about this number
# don't use it.
def ices_get_lineno ():
	global songnumber
	print 'Executing get_lineno() function...'
	songnumber = songnumber + 1
	return songnumber
