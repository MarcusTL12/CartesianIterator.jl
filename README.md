# CombinatoricsIterators.jl
Iterations tools for different combinatoric structures.

Two functions defined for now:

## BinomIter(Collection c, k=2)

This function lets you iterate through all unique k-tuples of different elements of c.
The length of this iterator is n choose k, as it is almost the definition of the binomial
coefficient (All combinations of k elements from c).

Usage of this grants a really slick way of iterating through all these combinations:

```julia
# List of gravitational bodies
bodies = [...]

# For example for an n-body gravity simulation
for (i, j) ∈ BinomIter(bodies)
    applyGravity(i, j)
end
```

## cartiter(ranges r)

Base version of function takes in a collection of AbstractRanges. This gives an iterator
for all combinations of the indices in the ranges.

This example loops through all integer coordinates of the box x ∈ [0, 3], y ∈ [-2, 5], z ∈ [2, 4]

```julia
for (i, j, k) ∈ cartiter(0:3, -2:5, 2:4)
    dostuffwith(i, j, k)
end
```

This also gives a slick way if iterating through all indices of a multidimentional array with a single
for loop.

```julia
for coord ∈ cartiter(multiarray)
    multiarray[coord...]
end
```

