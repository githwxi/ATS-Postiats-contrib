#include <stdio.h>
#include <stdlib.h>
#include <setjmp.h>
 
static jmp_buf buf;
 
void
second(int *p) {
  *p = 1000000;
  printf("second: *p = %i\n", *p);
  longjmp(buf,1);             // jumps back to where setjmp was called - making setjmp now return 1
}
 
void
first(int *p) {
  second(p);
  printf("first\n");          // does not print
}
 
int main() {
  /*
  int x = 0;
  */
  int *p;
  p = malloc(sizeof(int));
/*
  printf("main: p = %p\n", p);
*/
  if (p == 0)
  {
    fprintf (stderr, "malloc: failed!\n"); exit(1);
  }

  *p = 0;

  if (!setjmp(buf) ) {
    first(p);                // when executed, setjmp returns 0
  } else {                    // when longjmp jumps back, setjmp returns 1
    printf("main: *p = %i\n", *p);       // prints
  }
  return 0;
}
