#!/usr/bin/python

import time
import datetime
from datetime import datetime

print "Today is day", time.localtime()[7], "of the current year" 
# Today is day 218 of the current year

today = datetime.date.today()
print "Today is day", today.timetuple()[7], "of ", today.year
# Today is day 218 of 2003

print "Today is day", today.strftime("%j"), "of the current year" 
# Today is day 218 of the current year
