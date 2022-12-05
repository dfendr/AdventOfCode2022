#include "stdio.h"
#include "stdbool.h"


bool contains(int start, int end, int n){
    if ((start <= n) && (end >= n)){
        return true;
        }
    else {
        return false;
        }
}

int main(){
    FILE *fIn = fopen("input", "r");
    int total_a = 0;
    int total_b = 0;
    char line[50];
    int linecount = 0;
    int r1a, r1b, r2a, r2b;
    for (; fgets(line,50, fIn);  linecount+= 1){
        sscanf(line, "%d-%d,%d-%d", &r1a,&r1b, &r2a, &r2b);
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
