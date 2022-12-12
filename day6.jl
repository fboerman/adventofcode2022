
function find_package(n::Int)::Int
    stream = open("day6_input.txt")

    line = readline(stream) # puzzle input is single line here
    marker_end = -1
    for i=n:length(line)
        if length(unique(line[i-(n-1):i])) == n
            marker_end = i
            break
        end
    end
    close(stream)

    marker_end
end

println("Advent of Code 2022 day 6")
println("Part A")
println(find_package(4))
println("Part B")
println(find_package(14))
