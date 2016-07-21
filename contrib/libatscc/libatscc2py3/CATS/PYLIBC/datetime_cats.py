######
#
# HX-2016-06:
# for Python code translated from ATS
#
######

######
# beg of [datetime_cats.py]
######

######
import datetime
######

############################################

def ats2pylibc_datetime_date_ctime(dt): return dt.ctime()

############################################

def ats2pylibc_datetime_date_today(): return datetime.date.today()
def ats2pylibc_datetime_date_make_ymd(y, m, d): return datetime.date(y, m, d)

############################################

###### end of [datetime_cats.py] ######
