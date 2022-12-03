# https://adventofcode.com/2022/day/1
# How to run:
#$gawk -f Day1b.awk input

BEGIN{curr_sum = 0;i = 0;}
{
    if ($0 == ""){
    ar[i] = curr_sum;
    curr_sum = 0;
    i++;
    }
else { curr_sum += $0}

}
END{total = 0;
    n = asort(ar);
    print ar[n-2] + ar[n- 1] + ar[n];
    }
