
function partA()
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

partA()