#ifndef PATSOLVE_PRELUDE_ARRAY
#define PATSOLVE_PRELUDE_ARRAY

/**
   These are useful functions that may take too much time to prove.
*/

inline void array_ptrswap_size (void *p, void *q, size_t sz) {
  char tmp;
  for (size_t i = 0; i < sz; i++) {
    tmp = *(char*)q;
    *(char*)q++ = *(char*)p;
    *(char*)p++ = tmp;
  }
  return;
}

#endif
