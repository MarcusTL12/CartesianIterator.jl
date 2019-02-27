
include("../CartesianIterator.jl")

let
	
	for (i, j) in CartesianIterator.cartiter(0:5, 0:4)
		println((i, j))
	end
	
end

