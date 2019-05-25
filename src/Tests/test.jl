
include("../CombinatoricsIterators.jl")

let
	
	a = [i for i in 1 : 5]
	
	for i in CombinatoricsIterators.BinomIter(a, 3)
		display(i)
	end
	
	# [i for i in CombinatoricsIterators.BinomIter(a, 3)]
	
	# collect(CombinatoricsIterators.BinomIter(a, 3))
	
end

