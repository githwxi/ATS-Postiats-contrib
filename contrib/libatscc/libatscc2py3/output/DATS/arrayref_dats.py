######
##
## The Python3 code
## is generated from ATS source by atscc2py3
## The starting compilation time is: 2016-12-25: 17h:42m
##
######

def _ats2pypre_arrayref_patsfun_8__closurerize(env0):
  def _ats2pypre_arrayref_patsfun_8__cfun(cenv, arg0): return _ats2pypre_arrayref_patsfun_8(cenv[1], arg0)
  return (_ats2pypre_arrayref_patsfun_8__cfun, env0)

def ats2pypre_arrayref_exists_cloref(arg0, arg1, arg2):
  tmpret0 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_arrayref_exists_cloref
  tmpret0 = ats2pypre_int_exists_cloref(arg1, arg2)
  return tmpret0


def ats2pypre_arrayref_forall_cloref(arg0, arg1, arg2):
  tmpret1 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_arrayref_forall_cloref
  tmpret1 = ats2pypre_int_forall_cloref(arg1, arg2)
  return tmpret1


def ats2pypre_arrayref_foreach_cloref(arg0, arg1, arg2):
  funlab_py = None
  tmplab_py = None
  #__patsflab_arrayref_foreach_cloref
  ats2pypre_int_foreach_cloref(arg1, arg2)
  return#_void


def ats2pypre_arrszref_make_elt(arg0, arg1):
  tmpret3 = None
  tmp4 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_arrszref_make_elt
  tmp4 = ats2pypre_arrayref_make_elt(arg0, arg1)
  tmpret3 = ats2pypre_arrszref_make_arrayref(tmp4, arg0)
  return tmpret3


def ats2pypre_arrszref_exists_cloref(arg0, arg1):
  tmpret5 = None
  tmp6 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_arrszref_exists_cloref
  tmp6 = ats2pypre_arrszref_size(arg0)
  tmpret5 = ats2pypre_int_exists_cloref(tmp6, arg1)
  return tmpret5


def ats2pypre_arrszref_forall_cloref(arg0, arg1):
  tmpret7 = None
  tmp8 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_arrszref_forall_cloref
  tmp8 = ats2pypre_arrszref_size(arg0)
  tmpret7 = ats2pypre_int_forall_cloref(tmp8, arg1)
  return tmpret7


def ats2pypre_arrszref_foreach_cloref(arg0, arg1):
  tmp10 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_arrszref_foreach_cloref
  tmp10 = ats2pypre_arrszref_size(arg0)
  ats2pypre_int_foreach_cloref(tmp10, arg1)
  return#_void


def ats2pypre_arrszref_foreach_method(arg0):
  tmpret11 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_arrszref_foreach_method
  tmpret11 = _ats2pypre_arrayref_patsfun_8__closurerize(arg0)
  return tmpret11


def _ats2pypre_arrayref_patsfun_8(env0, arg0):
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_arrayref_patsfun_8
  ats2pypre_arrszref_foreach_cloref(env0, arg0)
  return#_void


def ats2pypre_arrayref_make_elt(arg0, arg1):
  tmpret13 = None
  tmp14 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_arrayref_make_elt
  tmp14 = ats2pypre_PYlist_make_elt(arg0, arg1)
  tmpret13 = tmp14
  return tmpret13


def ats2pypre_arrayref_get_at(arg0, arg1):
  tmpret15 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_arrayref_get_at
  tmpret15 = ats2pypre_PYlist_get_at(arg0, arg1)
  return tmpret15


def ats2pypre_arrayref_set_at(arg0, arg1, arg2):
  funlab_py = None
  tmplab_py = None
  #__patsflab_arrayref_set_at
  ats2pypre_PYlist_set_at(arg0, arg1, arg2)
  return#_void


def ats2pypre_arrszref_make_arrayref(arg0, arg1):
  tmpret17 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_arrszref_make_arrayref
  tmpret17 = arg0
  return tmpret17


def ats2pypre_arrszref_size(arg0):
  tmpret18 = None
  tmp19 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_arrszref_size
  tmp19 = ats2pypre_PYlist_length(arg0)
  tmpret18 = tmp19
  return tmpret18


def ats2pypre_arrszref_get_at(arg0, arg1):
  tmpret20 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_arrszref_get_at
  tmpret20 = ats2pypre_PYlist_get_at(arg0, arg1)
  return tmpret20


def ats2pypre_arrszref_set_at(arg0, arg1, arg2):
  funlab_py = None
  tmplab_py = None
  #__patsflab_arrszref_set_at
  ats2pypre_PYlist_set_at(arg0, arg1, arg2)
  return#_void

######
##
## end-of-compilation-unit
##
######
