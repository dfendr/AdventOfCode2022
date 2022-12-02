# https://adventofcode.com/2022/day/1
function update_list(n){
    min = ar[0];
    min_pos = 0;
    for (i = 0; i < 3; i++){
        if (min > ar[i]){
            min = ar[i];
            min_pos = i;
            }
        }
        if (n >= min){
        ar[min_pos] = n;
    }
}

BEGIN{curr_sum = 0;}
{
if ($0 ~ /^$/){
        update_list(curr_sum);
        curr_sum = 0;
    }
else { curr_sum += $0}

}
END{total = 0;
    update_list(curr_sum);
    for (n in ar){
        total += ar[n];
    }
    print total;
    }
