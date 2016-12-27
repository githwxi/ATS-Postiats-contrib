######
##
## The Python3 code
## is generated from ATS source by atscc2py3
## The starting compilation time is: 2016-12-25: 17h:42m
##
######

#ATSassume(_057_Users_057_RyanKing_057_ATS2_055_contrib_057_contrib_057_libatscc_057_libatscc2py3_057_SATS_057_qlistref_056_sats__qlistref_type)

def ats2pypre_qlistref_make_nil():
  tmpret0 = None
  tmp1 = None
  tmp2 = None
  tmp3 = None
  tmp4 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_qlistref_make_nil
  tmp2 = None
  tmp1 = ats2pypre_ref(tmp2)
  tmp4 = None
  tmp3 = ats2pypre_ref(tmp4)
  tmpret0 = (tmp1, tmp3)
  return tmpret0


def ats2pypre_qlistref_length(arg0):
  tmpret5 = None
  tmp6 = None
  tmp7 = None
  tmp8 = None
  tmp9 = None
  tmp10 = None
  tmp11 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_qlistref_length
  tmp6 = arg0[0]
  tmp7 = arg0[1]
  tmp9 = ats2pypre_ref_get_elt(tmp6)
  tmp8 = ats2pypre_list_length(tmp9)
  tmp11 = ats2pypre_ref_get_elt(tmp7)
  tmp10 = ats2pypre_list_length(tmp11)
  tmpret5 = ats2pypre_add_int1_int1(tmp8, tmp10)
  return tmpret5


def ats2pypre_qlistref_enqueue(arg0, arg1):
  tmp13 = None
  tmp14 = None
  tmp15 = None
  tmp16 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_qlistref_enqueue
  tmp13 = arg0[0]
  tmp14 = arg0[1]
  tmp16 = ats2pypre_ref_get_elt(tmp13)
  tmp15 = (arg1, tmp16)
  ats2pypre_ref_set_elt(tmp13, tmp15)
  return#_void


def ats2pypre_qlistref_dequeue_opt(arg0):
  tmpret17 = None
  tmp18 = None
  tmp19 = None
  tmp20 = None
  tmp21 = None
  tmp22 = None
  tmp23 = None
  tmp25 = None
  tmp26 = None
  tmp27 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  mbranch_2 = None
  def __atstmplab0():
    nonlocal arg0
    nonlocal tmpret17, tmp18, tmp19, tmp20, tmp21, tmp22, tmp23, tmp25, tmp26, tmp27
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    if(ATSCKptriscons(tmp20)): tmplab_py = 4 ; return#__atstmplab3
    __atstmplab1()
    return
  def __atstmplab1():
    nonlocal arg0
    nonlocal tmpret17, tmp18, tmp19, tmp20, tmp21, tmp22, tmp23, tmp25, tmp26, tmp27
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    tmp23 = ats2pypre_ref_get_elt(tmp18)
    tmp25 = None
    ats2pypre_ref_set_elt(tmp18, tmp25)
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_2.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    return
  def __atstmplab2():
    nonlocal arg0
    nonlocal tmpret17, tmp18, tmp19, tmp20, tmp21, tmp22, tmp23, tmp25, tmp26, tmp27
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    __atstmplab3()
    return
  def __atstmplab3():
    nonlocal arg0
    nonlocal tmpret17, tmp18, tmp19, tmp20, tmp21, tmp22, tmp23, tmp25, tmp26, tmp27
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    tmp21 = tmp20[0]
    tmp22 = tmp20[1]
    ats2pypre_ref_set_elt(tmp19, tmp22)
    tmpret17 = (tmp21, )
    return
  def __atstmplab4():
    nonlocal arg0
    nonlocal tmpret17, tmp18, tmp19, tmp20, tmp21, tmp22, tmp23, tmp25, tmp26, tmp27
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    if(ATSCKptriscons(tmp23)): tmplab_py = 4 ; return#__atstmplab7
    __atstmplab5()
    return
  def __atstmplab5():
    nonlocal arg0
    nonlocal tmpret17, tmp18, tmp19, tmp20, tmp21, tmp22, tmp23, tmp25, tmp26, tmp27
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    tmpret17 = None
    return
  def __atstmplab6():
    nonlocal arg0
    nonlocal tmpret17, tmp18, tmp19, tmp20, tmp21, tmp22, tmp23, tmp25, tmp26, tmp27
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    __atstmplab7()
    return
  def __atstmplab7():
    nonlocal arg0
    nonlocal tmpret17, tmp18, tmp19, tmp20, tmp21, tmp22, tmp23, tmp25, tmp26, tmp27
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    tmp26 = tmp23[0]
    tmp27 = tmp23[1]
    ats2pypre_ref_set_elt(tmp19, tmp27)
    tmpret17 = (tmp26, )
    return
  mbranch_1 = { 1: __atstmplab0, 2: __atstmplab1, 3: __atstmplab2, 4: __atstmplab3 }
  mbranch_2 = { 1: __atstmplab4, 2: __atstmplab5, 3: __atstmplab6, 4: __atstmplab7 }
  #__patsflab_qlistref_dequeue_opt
  tmp18 = arg0[0]
  tmp19 = arg0[1]
  tmp20 = ats2pypre_ref_get_elt(tmp19)
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret17


def ats2pypre_qlistref_foldleft(arg0, arg1, arg2):
  tmpret30 = None
  tmp31 = None
  tmp32 = None
  tmp41 = None
  tmp42 = None
  tmp43 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_qlistref_foldleft
  tmp31 = arg0[0]
  tmp32 = arg0[1]
  tmp41 = ats2pypre_ref_get_elt(tmp31)
  tmp43 = ats2pypre_ref_get_elt(tmp32)
  tmp42 = _ats2pypre_qlistref_auxl_5(arg2, arg1, tmp43)
  tmpret30 = _ats2pypre_qlistref_auxr_6(arg2, tmp41, tmp42)
  return tmpret30


def _ats2pypre_qlistref_auxl_5(env0, arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret33 = None
  tmp34 = None
  tmp35 = None
  tmp36 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab8():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret33, tmp34, tmp35, tmp36
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg1)): tmplab_py = 4 ; return#__atstmplab11
    __atstmplab9()
    return
  def __atstmplab9():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret33, tmp34, tmp35, tmp36
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret33 = arg0
    return
  def __atstmplab10():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret33, tmp34, tmp35, tmp36
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab11()
    return
  def __atstmplab11():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret33, tmp34, tmp35, tmp36
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp34 = arg1[0]
    tmp35 = arg1[1]
    tmp36 = env0[0](env0, arg0, tmp34)
    #ATStailcalseq_beg
    apy0 = tmp36
    apy1 = tmp35
    arg0 = apy0
    arg1 = apy1
    funlab_py = 1 #__patsflab__ats2pypre_qlistref_auxl_5
    #ATStailcalseq_end
    return
  mbranch_1 = { 1: __atstmplab8, 2: __atstmplab9, 3: __atstmplab10, 4: __atstmplab11 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_qlistref_auxl_5
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret33


def _ats2pypre_qlistref_auxr_6(env0, arg0, arg1):
  tmpret37 = None
  tmp38 = None
  tmp39 = None
  tmp40 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab12():
    nonlocal env0, arg0, arg1
    nonlocal tmpret37, tmp38, tmp39, tmp40
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab15
    __atstmplab13()
    return
  def __atstmplab13():
    nonlocal env0, arg0, arg1
    nonlocal tmpret37, tmp38, tmp39, tmp40
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret37 = arg1
    return
  def __atstmplab14():
    nonlocal env0, arg0, arg1
    nonlocal tmpret37, tmp38, tmp39, tmp40
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab15()
    return
  def __atstmplab15():
    nonlocal env0, arg0, arg1
    nonlocal tmpret37, tmp38, tmp39, tmp40
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp38 = arg0[0]
    tmp39 = arg0[1]
    tmp40 = _ats2pypre_qlistref_auxr_6(env0, tmp39, arg1)
    tmpret37 = env0[0](env0, tmp40, tmp38)
    return
  mbranch_1 = { 1: __atstmplab12, 2: __atstmplab13, 3: __atstmplab14, 4: __atstmplab15 }
  #__patsflab__ats2pypre_qlistref_auxr_6
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret37


def ats2pypre_qlistref_foldright(arg0, arg1, arg2):
  tmpret44 = None
  tmp45 = None
  tmp46 = None
  tmp55 = None
  tmp56 = None
  tmp57 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_qlistref_foldright
  tmp45 = arg0[0]
  tmp46 = arg0[1]
  tmp55 = ats2pypre_ref_get_elt(tmp46)
  tmp57 = ats2pypre_ref_get_elt(tmp45)
  tmp56 = _ats2pypre_qlistref_auxl_8(arg1, arg2, tmp57)
  tmpret44 = _ats2pypre_qlistref_auxr_9(arg1, tmp55, tmp56)
  return tmpret44


def _ats2pypre_qlistref_auxl_8(env0, arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret47 = None
  tmp48 = None
  tmp49 = None
  tmp50 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab16():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret47, tmp48, tmp49, tmp50
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg1)): tmplab_py = 4 ; return#__atstmplab19
    __atstmplab17()
    return
  def __atstmplab17():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret47, tmp48, tmp49, tmp50
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret47 = arg0
    return
  def __atstmplab18():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret47, tmp48, tmp49, tmp50
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab19()
    return
  def __atstmplab19():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret47, tmp48, tmp49, tmp50
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp48 = arg1[0]
    tmp49 = arg1[1]
    tmp50 = env0[0](env0, tmp48, arg0)
    #ATStailcalseq_beg
    apy0 = tmp50
    apy1 = tmp49
    arg0 = apy0
    arg1 = apy1
    funlab_py = 1 #__patsflab__ats2pypre_qlistref_auxl_8
    #ATStailcalseq_end
    return
  mbranch_1 = { 1: __atstmplab16, 2: __atstmplab17, 3: __atstmplab18, 4: __atstmplab19 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_qlistref_auxl_8
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret47


def _ats2pypre_qlistref_auxr_9(env0, arg0, arg1):
  tmpret51 = None
  tmp52 = None
  tmp53 = None
  tmp54 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab20():
    nonlocal env0, arg0, arg1
    nonlocal tmpret51, tmp52, tmp53, tmp54
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab23
    __atstmplab21()
    return
  def __atstmplab21():
    nonlocal env0, arg0, arg1
    nonlocal tmpret51, tmp52, tmp53, tmp54
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret51 = arg1
    return
  def __atstmplab22():
    nonlocal env0, arg0, arg1
    nonlocal tmpret51, tmp52, tmp53, tmp54
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab23()
    return
  def __atstmplab23():
    nonlocal env0, arg0, arg1
    nonlocal tmpret51, tmp52, tmp53, tmp54
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp52 = arg0[0]
    tmp53 = arg0[1]
    tmp54 = _ats2pypre_qlistref_auxr_9(env0, tmp53, arg1)
    tmpret51 = env0[0](env0, tmp52, tmp54)
    return
  mbranch_1 = { 1: __atstmplab20, 2: __atstmplab21, 3: __atstmplab22, 4: __atstmplab23 }
  #__patsflab__ats2pypre_qlistref_auxr_9
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret51

######
##
## end-of-compilation-unit
##
######
