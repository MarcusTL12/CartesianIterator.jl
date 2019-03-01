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


struct CombWrap{T}
	data::AbstractArray{T}
	n::Int
end



export combs
"""
Gives an iterator for all n chooce k k-tuples of the n elements in c.
"""
combs(c::AbstractArray{T}, k::Int=2) where T = CombWrap{T}(c, k)

import Base.iterate
export iterate
function iterate(p::CombWrap{T}, state::Vector{Int}=collect(1 : p.n)) where T
	l = length(p.data)
	
	state[1] == (l - p.n + 2) && return nothing
	
	ret = T[p.data[j] for j in state]
	
	i = p.n
	
	while (state[i] += 1) == (l - p.n + i + 1) ? ((i -= 1) > 0) : false end
	
	(0 < i < p.n) && (state[i + 1 : end] .= state[i] + 1 : state[i] + (p.n - i))
	
	return ret, state
end


import Base.length
export length
length(a::CombWrap) = binomial(length(a.data), a.n)


import Base.collect
export collect
collect(a::CombWrap{T}) where T = Vector{T}[i for i in a]


end

