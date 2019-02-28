
include("../CombinatoricsIterators.jl")

let
	
	for (i, j) in CombinatoricsIterators.cartiter(0:5, 0:4)
		println((i, j))
	end
	
end

