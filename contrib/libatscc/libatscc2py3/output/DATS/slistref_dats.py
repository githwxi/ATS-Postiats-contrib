######
##
## The Python3 code
## is generated from ATS source by atscc2py3
## The starting compilation time is: 2016-12-25: 17h:42m
##
######

#ATSassume(_057_Users_057_RyanKing_057_ATS2_055_contrib_057_contrib_057_libatscc_057_libatscc2py3_057_SATS_057_slistref_056_sats__slistref_type)

def slistref_make_nil():
  tmpret0 = None
  tmp1 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_slistref_make_nil
  tmp1 = None
  tmpret0 = ats2pypre_ref(tmp1)
  return tmpret0


def slistref_length(arg0):
  tmpret2 = None
  tmp3 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_slistref_length
  tmp3 = ats2pypre_ref_get_elt(arg0)
  tmpret2 = ats2pypre_list_length(tmp3)
  return tmpret2


def slistref_push(arg0, arg1):
  tmp5 = None
  tmp6 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_slistref_push
  tmp6 = ats2pypre_ref_get_elt(arg0)
  tmp5 = (arg1, tmp6)
  ats2pypre_ref_set_elt(arg0, tmp5)
  return#_void


def slistref_pop_opt(arg0):
  tmpret7 = None
  tmp8 = None
  tmp9 = None
  tmp10 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab0():
    nonlocal arg0
    nonlocal tmpret7, tmp8, tmp9, tmp10
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(tmp8)): tmplab_py = 4 ; return#__atstmplab3
    __atstmplab1()
    return
  def __atstmplab1():
    nonlocal arg0
    nonlocal tmpret7, tmp8, tmp9, tmp10
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret7 = None
    return
  def __atstmplab2():
    nonlocal arg0
    nonlocal tmpret7, tmp8, tmp9, tmp10
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab3()
    return
  def __atstmplab3():
    nonlocal arg0
    nonlocal tmpret7, tmp8, tmp9, tmp10
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp9 = tmp8[0]
    tmp10 = tmp8[1]
    ats2pypre_ref_set_elt(arg0, tmp10)
    tmpret7 = (tmp9, )
    return
  mbranch_1 = { 1: __atstmplab0, 2: __atstmplab1, 3: __atstmplab2, 4: __atstmplab3 }
  #__patsflab_slistref_pop_opt
  tmp8 = ats2pypre_ref_get_elt(arg0)
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret7


def slistref_foldleft(arg0, arg1, arg2):
  tmpret12 = None
  tmp13 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_slistref_foldleft
  tmp13 = ats2pypre_ref_get_elt(arg0)
  tmpret12 = ats2pypre_list_foldleft(tmp13, arg1, arg2)
  return tmpret12


def slistref_foldright(arg0, arg1, arg2):
  tmpret14 = None
  tmp15 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_slistref_foldright
  tmp15 = ats2pypre_ref_get_elt(arg0)
  tmpret14 = ats2pypre_list_foldright(tmp15, arg1, arg2)
  return tmpret14

######
##
## end-of-compilation-unit
##
######
