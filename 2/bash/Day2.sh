#!/bin/bash

# part 1
total=0
while read line; do
	if [[ "$line" == "A X" ]]; then total=$((total + 4)); fi
	if [[ "$line" == "A Y" ]]; then total=$((total + 8)); fi
	if [[ "$line" == "A Z" ]]; then total=$((total + 3)); fi
	if [[ "$line" == "B X" ]]; then total=$((total + 1)); fi
	if [[ "$line" == "B Y" ]]; then total=$((total + 5)); fi
	if [[ "$line" == "B Z" ]]; then total=$((total + 9)); fi
	if [[ "$line" == "C X" ]]; then total=$((total + 7)); fi
	if [[ "$line" == "C Y" ]]; then total=$((total + 2)); fi
	if [[ "$line" == "C Z" ]]; then total=$((total + 6)); fi
done <input
printf "%d\n" $total

# part 2
total=0
while read line; do
	if [[ "$line" == "A X" ]]; then total=$((total + 3)); fi
	if [[ "$line" == "A Y" ]]; then total=$((total + 4)); fi
	if [[ "$line" == "A Z" ]]; then total=$((total + 8)); fi
	if [[ "$line" == "B X" ]]; then total=$((total + 1)); fi
	if [[ "$line" == "B Y" ]]; then total=$((total + 5)); fi
	if [[ "$line" == "B Z" ]]; then total=$((total + 9)); fi
	if [[ "$line" == "C X" ]]; then total=$((total + 2)); fi
	if [[ "$line" == "C Y" ]]; then total=$((total + 6)); fi
	if [[ "$line" == "C Z" ]]; then total=$((total + 7)); fi
done <input
printf "%d\n" $total
