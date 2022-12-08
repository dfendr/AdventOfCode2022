// https://adventofcode.com/2022/day/5
using System.Text;
using System.Text.RegularExpressions;

void main()
{
    string s = File.ReadAllText("./input").ToString();
    string[] split = s.Split("\n\n");
    (string boxes, string moves) = (split[0], split[1]);
    List<List<char>> s9001 = CreateStacks(boxes);
    List<List<char>> s9000 = CreateStacks(boxes); // stupid, deep clone isn't in stdlib
    List<int[]> movelist = ParseMoves(moves);
    List<char> holding_stack = new();
    foreach (int[] m in movelist)
    {
        foreach (int i in Enumerable.Range(0, m[0]))
        {
            List<char> sender = s9000[m[1] - 1];
            List<char> sender2 = s9001[m[1] - 1];
            char cargo = sender.Last();
            char cargo2 = sender2.Last();
            holding_stack.Add(cargo2);
            sender.RemoveAt(sender.Count - 1);
            sender2.RemoveAt(sender2.Count - 1);
            s9000[m[2] - 1].Add(cargo);
        }
        foreach (int i in Enumerable.Range(0, m[0]))
        {
            char cargo = holding_stack.Last();
            holding_stack.RemoveAt(holding_stack.Count - 1);
            s9001[m[2] - 1].Add(cargo);
        }
    }
    string solution_1 = GetTopBoxes(s9000);
    string solution_2 = GetTopBoxes(s9001);
    Console.WriteLine($"A. {solution_1}\nB. {solution_2}");
}

string GetTopBoxes(List<List<char>> stacks)
{
    StringBuilder solution = new();
    foreach (List<char> stack in stacks)
    {
        if (stack.Count != 0)
        {
            char topbox = stack.Last();
            solution.Append(topbox);
        }
    }
    return solution.ToString();
}


List<int[]> ParseMoves(string moves)
{
    List<int[]> movelist = new();
    foreach (string line in moves.Split("\n"))
    {
        var rx = new Regex(@"[0-9]+");
        int[] moves_for_line = line.Trim().Split(" ")
                    .Where(x => rx.IsMatch(x))
                    .Select(int.Parse)
                    .ToArray();
        if (moves_for_line.Length != 0) // stupid
            movelist.Add(moves_for_line);
    }
    return movelist;
}


List<List<char>> CreateStacks(string boxes_str)
{
    int amt = int.Parse(boxes_str.Split(" ").Last());
    string boxes = boxes_str.Remove(boxes_str.LastIndexOf("\n"));
    List<List<char>> stacks = new();
    stacks.AddRange(from int i in Enumerable.Range(1, amt)
                    let new_stack = new List<char>()
                    select new_stack);
    foreach (string line in boxes.Split("\n").Reverse())
    {
        for (int j = 0; j < line.Length; j++)
        {
            if (char.IsLetter(line[j]))
            {
                stacks[j / 4].Add(line[j]);
            }
        }
    }
    return stacks;
}

main();
