######
##
## The Python3 code
## is generated from ATS source by atscc2py3
## The starting compilation time is: 2016-12-25: 17h:42m
##
######

def ats2pypre_string_fset_at(arg0, arg1, arg2):
  tmpret0 = None
  tmp1 = None
  tmp2 = None
  tmp3 = None
  tmp4 = None
  tmp5 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_string_fset_at
  tmp1 = ats2pypre_string_length(arg0)
  tmp2 = ats2pypre_string_substring_beg_end(arg0, 0, arg1)
  tmp4 = ats2pypre_add_int1_int1(arg1, 1)
  tmp3 = ats2pypre_string_substring_beg_end(arg0, tmp4, tmp1)
  tmp5 = ats2pypre_string_append_3(tmp2, arg2, tmp3)
  tmpret0 = tmp5
  return tmpret0

######
##
## end-of-compilation-unit
##
######
