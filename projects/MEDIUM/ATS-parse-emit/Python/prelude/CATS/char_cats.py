######
#
# HX-2014-08:
# for Python code translated from ATS
#
######

###### beg of [char_cats.py] ######

############################################
#
def ats2pypre_print_char(c):
  out = sys.__stdout__
  ats2pypre_fprint_char(out, c); return
def ats2pypre_prerr_char(c):
  out = sys.__stderr__
  ats2pypre_fprint_char(out, c); return
#
def ats2pypre_fprint_char(out, c): ats2pypre_fprint_obj(out, c); return
#
############################################

###### end of [char_cats.py] ######
