
function get_priority(i::Char)::Int
    if Int(i) > 96
        return Int(i) - 96
    else
        return Int(i) - 38
    end
end

function partA()
    println("Part A")

    stream = open("day3_input.txt")

    S = 0

    while !eof(stream)
        l = split(readline(stream), "")
        n = length(l)
        i = intersect(l[1:Int(n/2)],l[Int(n/2)+1:n])[1][1]
        S += get_priority(i)
    end

    close(stream)

    S
end

function partB()
    println("Part B")

    stream = open("day3_input.txt")

    S = 0
    while !eof(stream)
        i = intersect(
            split(readline(stream), ""),
            split(readline(stream), ""),
            split(readline(stream), "")
        )[1][1]
        S += get_priority(i)
    end

    close(stream)

    S
end

println("Advent of Code 2022 day 3")
println(partA())
println(partB())