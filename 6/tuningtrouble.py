# https://adventofcode.com/2022/day/6
s = open("input", "r").readline()
for i in range(len(s) - 4):
    window = set()
    for j in range(0, 4):
        window.add(s[i + j])
    if len(window) == 4:
        print(i + 3)
        exit()
