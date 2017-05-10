######
##
## The Python3 code
## is generated from ATS source by atscc2py3
## The starting compilation time is: 2016-12-25: 17h:42m
##
######

def ats2pypre_option_some(arg0):
  tmpret0 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_option_some
  tmpret0 = (arg0, )
  return tmpret0


def ats2pypre_option_none():
  tmpret1 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_option_none
  tmpret1 = None
  return tmpret1


def ats2pypre_option_unsome(arg0):
  tmpret2 = None
  tmp3 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_option_unsome
  tmp3 = arg0[0]
  tmpret2 = tmp3
  return tmpret2


def ats2pypre_option_is_some(arg0):
  tmpret4 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab0():
    nonlocal arg0
    nonlocal tmpret4
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptrisnull(arg0)): tmplab_py = 4 ; return#__atstmplab3
    __atstmplab1()
    return
  def __atstmplab1():
    nonlocal arg0
    nonlocal tmpret4
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret4 = True
    return
  def __atstmplab2():
    nonlocal arg0
    nonlocal tmpret4
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab3()
    return
  def __atstmplab3():
    nonlocal arg0
    nonlocal tmpret4
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret4 = False
    return
  mbranch_1 = { 1: __atstmplab0, 2: __atstmplab1, 3: __atstmplab2, 4: __atstmplab3 }
  #__patsflab_option_is_some
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret4


def ats2pypre_option_is_none(arg0):
  tmpret5 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab4():
    nonlocal arg0
    nonlocal tmpret5
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab7
    __atstmplab5()
    return
  def __atstmplab5():
    nonlocal arg0
    nonlocal tmpret5
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret5 = True
    return
  def __atstmplab6():
    nonlocal arg0
    nonlocal tmpret5
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab7()
    return
  def __atstmplab7():
    nonlocal arg0
    nonlocal tmpret5
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret5 = False
    return
  mbranch_1 = { 1: __atstmplab4, 2: __atstmplab5, 3: __atstmplab6, 4: __atstmplab7 }
  #__patsflab_option_is_none
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret5

######
##
## end-of-compilation-unit
##
######
