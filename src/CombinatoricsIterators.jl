__precompile__(true)

"""
Module for iterating through combinatoric structures
	Dev branch
"""
module CombinatoricsIterators

export cartiter

"""
CartesianIterator
Returns generator for all combinations for the given list of indexranges
"""
function cartiter(its)
	exbuff = IOBuffer()
	write(exbuff, "(its_=$its; inds_=zeros(Int, length(its_)); ((inds_...,) for ")
	for i in 1:length(its)
		i > 1 && write(exbuff, ", ")
		write(exbuff, "inds_[$i]=its_[$i]")
	end
	write(exbuff, "))")
	eval(Meta.parse(String(k!(exbuff))))
end

# Returns generator for all combinations for the given list of indexranges
cartiter(its...) = cartiter(its)


export BinomIter
struct BinomIter
	c::AbstractArray
	k::Int
	BinomIter(c::AbstractArray, k::Int=2) =
		new(c, k)
end

import Base.iterate
export iterate
function iterate(it::BinomIter, state=[i for i in 1 : it.k])
	state[end] > length(it.c) && return nothing
	ret = ([it.c[j] for j in state], state)
	i = it.k
	while i > 0 && (state[i] += 1) > length(it.c) - (it.k - (i -= 1) - 1) end
	state[i+2 : end] .= (state[i + 1] + 1 : state[i + 1] + (it.k - (i + 1)))
	ret
end



import Base.length
export length
length(it::BinomIter) = binomial(length(it.c), it.k)



end

