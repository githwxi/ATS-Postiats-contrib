#include <stdio.h>
#include <setjmp.h>
 
static jmp_buf buf;
 
void
second(int *p) {
  *p = 1000000;
  printf("second\n");         // prints
  longjmp(buf,1);             // jumps back to where setjmp was called - making setjmp now return 1
}
 
void
first(int *p) {
  second(p);
  printf("first\n");          // does not print
}
 
int main() {
  int x = 0;
  if (!setjmp(buf) ) {
    first(&x);                // when executed, setjmp returns 0
  } else {                    // when longjmp jumps back, setjmp returns 1
    printf("main: x = %i\n", x);       // prints
  }
  return 0;
}
