# Intinf

A simple package based on libgmp for arithmetic operations
(plus some other common operations on integers)

## Description

###The SATS files

1. SATS/intinf.sats

The abstract types *intinf_type(int)* (nonlin) and *intinf_vtype(int)*
(linear) are introduced, and a few functions are declared for going
between values of these two types. Given a static integer _i_, the
type _intinf_type(i)_ is for a dynamic value representing
_i_ while the type _intinf_vtype(i)_ is for a (linear) dynamic value
representing _i_.

2. SATS/intinf_t.sats

The interface for arithmetic operations and some other operations on
integers represented as dynamic values of the type _intinf_type_. In
general, using functions declared in intinf_t.sats may require some
support of GC.

3. SATS/intinf_vt.sats

The interface for arithmetic operations and some other operations on
integers represented as linear dynamic values of the type
_intinf_vtype_. While it is a bit more involved to use functions
declared in intinf_vt.sats than in intinf_t.sats, the resulting code
can be significantly more efficent both time-wise and memory-wise.

###The DATS files

1. DATS/intinf_t.dats

2. DATS/intinf_vt.dats

3. DATS/gintinf_t.dats
