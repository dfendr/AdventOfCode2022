def get_input(filename):
    try:
        file = open(filename, "r")
        input_str = file.read()
        return input_str
    except Exception as e:
        print(e)
        exit()


def get_value(char: str):
    if char.islower():
        return ord(char) - ord("`")
    else:
        return ord(char) - ord("&")


def question_1(input_str):
    total = 0
    for line in input_str.splitlines():
        half = len(line) // 2
        whole = len(line)
        a = line[0:half]
        b = line[half:whole]
        char = (set(a).intersection(set(b))).pop()
        total += get_value(char)
    print(total)


def question_2(input_str):
    total = 0
    lines = input_str.splitlines()
    for i in range(0, len(lines), 3):
        char = (
            set(lines[i]).intersection(
                set(lines[i + 1]).intersection(set(lines[i + 2]))
            )
        ).pop()
        total += get_value(char)
    print(total)


if __name__ == "__main__":
    input_str = get_input("input")
    question_1(input_str)
    question_2(input_str)
