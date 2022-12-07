#include "stdio.h"
#include "stdbool.h"

bool contains(int start, int end, int n){
    if (start <= n && end >= n){
        return true;
        }
        return false;
}

int main(){
    FILE *fIn = fopen("input", "r");
    int total_a = 0;
    int total_b = 0;
    int r1a, r1b, r2a, r2b;
    while (fscanf(fIn, "%d-%d,%d-%d\n", &r1a, &r1b, &r2a, &r2b) == 4){
        if ((r1a <= r2a) && (r1b >= r2b) || ((r2a <= r1a) && (r2b >= r1b) )){
            total_a += 1;
        }
        if ((contains(r1a, r1b, r2a)) | contains(r1a, r1b, r2b) | (contains(r2a, r2b, r1a) | (contains(r2a, r2b, r1b)) )){
            total_b += 1;
        }
    };
    fclose(fIn);
    printf("A: %d\n", total_a);
    printf("B: %d\n", total_b);
}
