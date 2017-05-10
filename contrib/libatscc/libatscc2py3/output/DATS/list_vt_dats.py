######
##
## The Python3 code
## is generated from ATS source by atscc2py3
## The starting compilation time is: 2016-12-25: 17h:42m
##
######

def ats2pypre_list_vt_length(arg0):
  tmpret2 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_vt_length
  tmpret2 = _ats2pypre_list_loop_3(arg0, 0)
  return tmpret2


def _ats2pypre_list_loop_3(arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret3 = None
  tmp5 = None
  tmp6 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab8():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret3, tmp5, tmp6
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab11
    __atstmplab9()
    return
  def __atstmplab9():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret3, tmp5, tmp6
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret3 = arg1
    return
  def __atstmplab10():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret3, tmp5, tmp6
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab11()
    return
  def __atstmplab11():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret3, tmp5, tmp6
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp5 = arg0[1]
    tmp6 = ats2pypre_add_int1_int1(arg1, 1)
    #ATStailcalseq_beg
    apy0 = tmp5
    apy1 = tmp6
    arg0 = apy0
    arg1 = apy1
    funlab_py = 1 #__patsflab__ats2pypre_list_loop_3
    #ATStailcalseq_end
    return
  mbranch_1 = { 1: __atstmplab8, 2: __atstmplab9, 3: __atstmplab10, 4: __atstmplab11 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_list_loop_3
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret3


def ats2pypre_list_vt_snoc(arg0, arg1):
  tmpret7 = None
  tmp8 = None
  tmp9 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_vt_snoc
  tmp9 = None
  tmp8 = (arg1, tmp9)
  tmpret7 = ats2pypre_list_vt_append(arg0, tmp8)
  return tmpret7


def ats2pypre_list_vt_extend(arg0, arg1):
  tmpret10 = None
  tmp11 = None
  tmp12 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_vt_extend
  tmp12 = None
  tmp11 = (arg1, tmp12)
  tmpret10 = ats2pypre_list_vt_append(arg0, tmp11)
  return tmpret10


def ats2pypre_list_vt_append(arg0, arg1):
  tmpret13 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_vt_append
  tmpret13 = _ats2pypre_list_aux_7(arg0, arg1)
  return tmpret13


def _ats2pypre_list_aux_7(arg0, arg1):
  tmpret14 = None
  tmp15 = None
  tmp16 = None
  tmp17 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab12():
    nonlocal arg0, arg1
    nonlocal tmpret14, tmp15, tmp16, tmp17
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab15
    __atstmplab13()
    return
  def __atstmplab13():
    nonlocal arg0, arg1
    nonlocal tmpret14, tmp15, tmp16, tmp17
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret14 = arg1
    return
  def __atstmplab14():
    nonlocal arg0, arg1
    nonlocal tmpret14, tmp15, tmp16, tmp17
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab15()
    return
  def __atstmplab15():
    nonlocal arg0, arg1
    nonlocal tmpret14, tmp15, tmp16, tmp17
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp15 = arg0[0]
    tmp16 = arg0[1]
    #ATSINSfreecon(arg0);
    tmp17 = _ats2pypre_list_aux_7(tmp16, arg1)
    tmpret14 = (tmp15, tmp17)
    return
  mbranch_1 = { 1: __atstmplab12, 2: __atstmplab13, 3: __atstmplab14, 4: __atstmplab15 }
  #__patsflab__ats2pypre_list_aux_7
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret14


def ats2pypre_list_vt_reverse(arg0):
  tmpret18 = None
  tmp19 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_vt_reverse
  tmp19 = None
  tmpret18 = ats2pypre_list_vt_reverse_append(arg0, tmp19)
  return tmpret18


def ats2pypre_list_vt_reverse_append(arg0, arg1):
  tmpret20 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_vt_reverse_append
  tmpret20 = _ats2pypre_list_loop_10(arg0, arg1)
  return tmpret20


def _ats2pypre_list_loop_10(arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret21 = None
  tmp22 = None
  tmp23 = None
  tmp24 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab16():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret21, tmp22, tmp23, tmp24
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab19
    __atstmplab17()
    return
  def __atstmplab17():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret21, tmp22, tmp23, tmp24
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret21 = arg1
    return
  def __atstmplab18():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret21, tmp22, tmp23, tmp24
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab19()
    return
  def __atstmplab19():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret21, tmp22, tmp23, tmp24
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp22 = arg0[0]
    tmp23 = arg0[1]
    #ATSINSfreecon(arg0);
    tmp24 = (tmp22, arg1)
    #ATStailcalseq_beg
    apy0 = tmp23
    apy1 = tmp24
    arg0 = apy0
    arg1 = apy1
    funlab_py = 1 #__patsflab__ats2pypre_list_loop_10
    #ATStailcalseq_end
    return
  mbranch_1 = { 1: __atstmplab16, 2: __atstmplab17, 3: __atstmplab18, 4: __atstmplab19 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_list_loop_10
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret21

######
##
## end-of-compilation-unit
##
######
