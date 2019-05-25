
include("../CombinatoricsIterators.jl")

let
	
	a = [i for i in 1 : 11]
	
	# for i in CombinatoricsIterators.BinomIter(a, 5)
	# 	display(i)
	# end
	
	[i for i in CombinatoricsIterators.BinomIter(a, 5)]
	
end

