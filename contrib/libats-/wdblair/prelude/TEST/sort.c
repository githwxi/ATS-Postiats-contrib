#include <stdio.h>
#include <limits.h>
#include <stdlib.h>
#include <assert.h>

/**
  Here we demonstrate our verified version of qsort as if it were
  the sorting function given by libc.
*/

extern
void patslibc_qsort (void *base, size_t nmemb, size_t size,
                                    int (*cmp)(const void *, const void *));

typedef struct {
    unsigned int timestamp;
    long long sender;
    long long recipient;
    char data[16];
} msg_t;

int cmp_msg (const void *x, const void *y) {
    const msg_t *mx = (const msg_t *)x;
    const msg_t *my = (const msg_t *)y;
    
    return mx->timestamp - my->timestamp;
}

#define N 1024

int main () {
    msg_t *buf = calloc(N, sizeof(msg_t));
    assert(buf != NULL);
   
    /**
      Make some fake messages with random time stamps.
    */ 
    for (int i = 0; i < N; i++) {
        buf[i].timestamp = (int)random() % INT_MAX;
    }
    
    patslibc_qsort (buf, N, sizeof(msg_t), cmp_msg);
    
    for (int i = 0; i < (N - 1); i++) {
        assert(buf[i].timestamp <= buf[i+1].timestamp);
    }
    
    printf("Sorting test passed!\n");
}
