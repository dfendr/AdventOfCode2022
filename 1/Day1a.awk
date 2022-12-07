# https://adventofcode.com/2022/day/1



BEGIN{max_sum = 0; curr_sum}
{
if ($0 ~ /^$/){
        if (curr_sum > max_sum){
            max_sum = curr_sum;
            }
        curr_sum = 0
    }
    else{ curr_sum += $0}



}
END{print max_sum; print max_elf}




