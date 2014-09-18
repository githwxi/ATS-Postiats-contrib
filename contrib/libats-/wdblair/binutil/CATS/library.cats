#ifndef LIBATSWDBLAIR_BINUTILS_SO
#define LIBATSWDBLAIR_BINUTILS_SO

#include <dlfcn.h>
#include <bfd.h>

#define bfd_asymbol_get_name(sym) (((asymbol *)sym)->name)

#endif
