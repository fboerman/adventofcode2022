function partA()
    println("Part A")
    stream = open("day1_test.txt")
    most_calories = 0
    current_calories = 0
    while ! eof(stream)
        l = readline(stream)
        if l == ""
            if current_calories > most_calories
                most_calories = current_calories
            end
            current_calories = 0
        else
            c = parse(Int, l)
            current_calories += parse(Int, l)
        end
    end
    println("Most calories: ", most_calories)

    close(stream)
end

function partB()
    println("Part B")
    elves = Int[0]
    stream = open("day1_input.txt")
    while ! eof(stream)
        l = readline(stream)
        if l == ""
            push!(elves, 0)
        else
            c = parse(Int, l)
            elves[length(elves)] += c
        end
    end
    close(stream)
    println("Top three summed: ", sum(sort(elves, rev=true)[1:3]))
end

println("Advent of Code 2022 day 1")
partA()
partB()