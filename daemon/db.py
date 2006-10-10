#!/usr/bin/python
# One single db include for all of the app
import MySQLdb

db = MySQLdb.connect(host="localhost", user="root", passwd="",db="tunequeue")
cursor = db.cursor(MySQLdb.cursors.DictCursor)
