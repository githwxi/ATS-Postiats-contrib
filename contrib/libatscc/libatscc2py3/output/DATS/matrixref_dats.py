######
##
## The Python3 code
## is generated from ATS source by atscc2py3
## The starting compilation time is: 2016-12-25: 17h:42m
##
######

######
#ATSextcode_beg()
######
######
def ats2pypre_matrixref_make_elt(m, n, x0):
  M = []
  i0 = 0
  mn = m * n
  while (i0 < mn): i0 = i0 + 1; M.append(x0)
  return M
######
######
#ATSextcode_end()
######

######
#ATSextcode_beg()
######
######
def ats2pypre_mtrxszref_make_matrixref(M, m, n):
  return { 'matrix' : M, 'nrow' : m, 'ncol' : n }
######
def ats2pypre_mtrxszref_get_nrow(MSZ): return MSZ['nrow']
def ats2pypre_mtrxszref_get_ncol(MSZ): return MSZ['ncol']
######
def ats2pypre_mtrxszref_get_at(MSZ, i, j):
  nrow = MSZ['nrow']
  ncol = MSZ['ncol']
  if (i < 0): raise IndexError('mtrxszref_get_at')
  if (j < 0): raise IndexError('mtrxszref_get_at')
  if (i >= nrow): raise IndexError('mtrxszref_get_at')
  if (j >= ncol): raise IndexError('mtrxszref_get_at')
  return MSZ['matrix'][i*ncol+j]
######
def ats2pypre_mtrxszref_set_at(MSZ, i, j, x0):
  nrow = MSZ['nrow']
  ncol = MSZ['ncol']
  if (i < 0): raise IndexError('mtrxszref_set_at')
  if (j < 0): raise IndexError('mtrxszref_set_at')
  if (i >= nrow): raise IndexError('mtrxszref_set_at')
  if (j >= ncol): raise IndexError('mtrxszref_set_at')
  MSZ['matrix'][i*ncol+j] = x0; return##_void
######
######
#ATSextcode_end()
######

def _ats2pypre_matrixref_patsfun_7__closurerize(env0):
  def _ats2pypre_matrixref_patsfun_7__cfun(cenv, arg0): return _ats2pypre_matrixref_patsfun_7(cenv[1], arg0)
  return (_ats2pypre_matrixref_patsfun_7__cfun, env0)

def _ats2pypre_matrixref_patsfun_9__closurerize(env0):
  def _ats2pypre_matrixref_patsfun_9__cfun(cenv, arg0): return _ats2pypre_matrixref_patsfun_9(cenv[1], arg0)
  return (_ats2pypre_matrixref_patsfun_9__cfun, env0)

def _ats2pypre_matrixref_patsfun_12__closurerize(env0):
  def _ats2pypre_matrixref_patsfun_12__cfun(cenv, arg0): return _ats2pypre_matrixref_patsfun_12(cenv[1], arg0)
  return (_ats2pypre_matrixref_patsfun_12__cfun, env0)

def ats2pypre_matrixref_exists_cloref(arg0, arg1, arg2, arg3):
  tmpret0 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_matrixref_exists_cloref
  tmpret0 = ats2pypre_int2_exists_cloref(arg1, arg2, arg3)
  return tmpret0


def ats2pypre_matrixref_forall_cloref(arg0, arg1, arg2, arg3):
  tmpret1 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_matrixref_forall_cloref
  tmpret1 = ats2pypre_int2_forall_cloref(arg1, arg2, arg3)
  return tmpret1


def ats2pypre_matrixref_foreach_cloref(arg0, arg1, arg2, arg3):
  funlab_py = None
  tmplab_py = None
  #__patsflab_matrixref_foreach_cloref
  ats2pypre_int2_foreach_cloref(arg1, arg2, arg3)
  return#_void


def ats2pypre_mtrxszref_make_elt(arg0, arg1, arg2):
  tmpret3 = None
  tmp4 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_mtrxszref_make_elt
  tmp4 = ats2pypre_matrixref_make_elt(arg0, arg1, arg2)
  tmpret3 = ats2pypre_mtrxszref_make_matrixref(tmp4, arg0, arg1)
  return tmpret3


def ats2pypre_mtrxszref_exists_cloref(arg0, arg1):
  tmpret5 = None
  tmp6 = None
  tmp7 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_mtrxszref_exists_cloref
  tmp6 = ats2pypre_mtrxszref_get_nrow(arg0)
  tmp7 = ats2pypre_mtrxszref_get_ncol(arg0)
  tmpret5 = ats2pypre_int2_exists_cloref(tmp6, tmp7, arg1)
  return tmpret5


def ats2pypre_mtrxszref_forall_cloref(arg0, arg1):
  tmpret8 = None
  tmp9 = None
  tmp10 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_mtrxszref_forall_cloref
  tmp9 = ats2pypre_mtrxszref_get_nrow(arg0)
  tmp10 = ats2pypre_mtrxszref_get_ncol(arg0)
  tmpret8 = ats2pypre_int2_forall_cloref(tmp9, tmp10, arg1)
  return tmpret8


def ats2pypre_mtrxszref_exists_method(arg0):
  tmpret11 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_mtrxszref_exists_method
  tmpret11 = _ats2pypre_matrixref_patsfun_7__closurerize(arg0)
  return tmpret11


def _ats2pypre_matrixref_patsfun_7(env0, arg0):
  tmpret12 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_matrixref_patsfun_7
  tmpret12 = ats2pypre_mtrxszref_exists_cloref(env0, arg0)
  return tmpret12


def ats2pypre_mtrxszref_forall_method(arg0):
  tmpret13 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_mtrxszref_forall_method
  tmpret13 = _ats2pypre_matrixref_patsfun_9__closurerize(arg0)
  return tmpret13


def _ats2pypre_matrixref_patsfun_9(env0, arg0):
  tmpret14 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_matrixref_patsfun_9
  tmpret14 = ats2pypre_mtrxszref_forall_cloref(env0, arg0)
  return tmpret14


def ats2pypre_mtrxszref_foreach_cloref(arg0, arg1):
  tmp16 = None
  tmp17 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_mtrxszref_foreach_cloref
  tmp16 = ats2pypre_mtrxszref_get_nrow(arg0)
  tmp17 = ats2pypre_mtrxszref_get_ncol(arg0)
  ats2pypre_int2_foreach_cloref(tmp16, tmp17, arg1)
  return#_void


def ats2pypre_mtrxszref_foreach_method(arg0):
  tmpret18 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_mtrxszref_foreach_method
  tmpret18 = _ats2pypre_matrixref_patsfun_12__closurerize(arg0)
  return tmpret18


def _ats2pypre_matrixref_patsfun_12(env0, arg0):
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_matrixref_patsfun_12
  ats2pypre_mtrxszref_foreach_cloref(env0, arg0)
  return#_void


def ats2pypre_matrixref_get_at(arg0, arg1, arg2, arg3):
  tmpret20 = None
  tmp21 = None
  tmp22 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_matrixref_get_at
  tmp22 = ats2pypre_mul_int1_int1(arg1, arg2)
  tmp21 = ats2pypre_add_int1_int1(tmp22, arg3)
  tmpret20 = ats2pypre_PYlist_get_at(arg0, tmp21)
  return tmpret20


def ats2pypre_matrixref_set_at(arg0, arg1, arg2, arg3, arg4):
  tmp24 = None
  tmp25 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_matrixref_set_at
  tmp25 = ats2pypre_mul_int1_int1(arg1, arg2)
  tmp24 = ats2pypre_add_int1_int1(tmp25, arg3)
  ats2pypre_PYlist_set_at(arg0, tmp24, arg4)
  return#_void

######
##
## end-of-compilation-unit
##
######
