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


end

