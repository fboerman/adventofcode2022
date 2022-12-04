using DelimitedFiles
using DataFrames

function partA()
    println("Part A")
    function calc_match_points(opponent::String, me::String)::Int
        win = Dict(
            "X" => "C", # rock wins of scissor
            "Y" => "A", # paper wins of rock
            "Z" => "B"  # scissor wins of paper
        )
        draw = Dict(
            "X" => "A", # rock
            "Y" => "B", # paper
            "Z" => "C"  # scissor
        )

        if draw[me] == opponent
            return 3
        end
        if win[me] == opponent
            return 6
        end

        return 0
    end

    points = Dict(
        "X" => 1, # rock
        "Y" => 2, # paper
        "Z" => 3  # scissor
    )

    df =  DataFrame(readdlm("day2_input.txt", ' ', String, '\n'), ["opponent", "me"])
    transform!(df, [:opponent, :me] => ByRow(calc_match_points) .=> :match_points)
    transform!(df, :me => ByRow(x -> points[x]) => :choice_points)
    df[!, :total_points] = df.match_points + df.choice_points
    
    #df[!, :choice_point] = [points[x] for x in df.me]

    sum(df.total_points)

end

function partB()
    println("part B")

    decision_tree = Dict(
        "X" => Dict(
            "A" => 3,
            "B" => 1,
            "C" => 2
        ),
        "Y" => Dict(
            "A" => 1,
            "B" => 2,
            "C" => 3
        ),
        "Z" => Dict(
            "A" => 2,
            "B" => 3,
            "C" => 1
        )
    )

    points = Dict(
        "X" => 0, # lose
        "Y" => 3, # draw
        "Z" => 6  # wing
    )

    df =  DataFrame(readdlm("day2_input.txt", ' ', String, '\n'), ["opponent", "result"])
    transform!(df, [:opponent, :result] => ByRow((x, y) -> decision_tree[y][x]) .=> :choice_points)
    transform!(df, :result => ByRow(x -> points[x]) => :match_points)
    df[!, :total_points] = df.match_points + df.choice_points

    sum(df.total_points)
end

println(partA())
println(partB())