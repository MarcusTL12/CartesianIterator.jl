__precompile__(true)

"""
Module for iterating through combinatoric structures
	Dev branch
"""
module CombinatoricsIterators


# struct CartIt
# 	lb
# end



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
	eval(Meta.parse(String(take!(exbuff))))
end

# Returns generator for all combinations for the given list of indexranges
cartiter(its...) = cartiter(its)


export BinomIter
struct BinomIter
	data::AbstractArray
	take::Int
	BinomIter(elems::AbstractArray, take::Int) =
		new(elems, take)
end

import Base.iterate
export iterate
function iterate(it::BinomIter, state=[i for i in 1 : it.take])
	ret = ([it.data[j] for j in state], state)
	i = it.take
	while i > 0 && (state[i] += 1) > length(it.data) - (it.take - (i -= 1) - 1) end
	state[i+2 : end] .= (state[i + 1] + 1 : state[i + 1] + (it.take - (i + 1)))
	state[end] > length(it.data) && return nothing
	ret
end



import Base.length
export length
length(it::BinomIter) = binomial(length(it.data), it.take)



end

