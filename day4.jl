
function partA()
    println("Part A")
    stream = open("day4_input.txt")
    S = 0
    while !eof(stream)
        sections = [[parse(Int, y) for y in split(x, "-")] for x in split(readline(stream),",")]
        if (sections[1][1] >= sections[2][1] && sections[1][2] <= sections[2][2]) ||
            (sections[2][1] >= sections[1][1] && sections[2][2] <= sections[1][2])
            S += 1
        end
    end
    close(stream)
    S
end

function partB()
    println("Part B")
    stream = open("day4_input.txt")
    S = 0
    while !eof(stream)
        sections = [[parse(Int, y) for y in split(x, "-")] for x in split(readline(stream),",")]
        if (sections[2][1] <= sections[1][1] <= sections[2][2]) || (sections[2][1] <= sections[1][2] <= sections[2][2]) ||
            (sections[1][1] <= sections[2][1] <= sections[1][2]) || (sections[1][1] <= sections[2][2] <= sections[1][2])
            S += 1
        end
    end
    close(stream)
    S
end

println("Advent of Code 2022 day 3")
println(partA())
println(partB())