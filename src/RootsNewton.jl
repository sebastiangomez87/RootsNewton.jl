module RootsNewton

greet() = print("Hello World!")

using LinearAlgebra, ForwardDiff

#This function finds the roots of f(x) taking iv as initial point. The derivative is calculated using ForwardDiff
function newtonroot(f; iv, tolerance=1E-7, maxiter=1000)
    D(f) = x -> ForwardDiff.derivative(f, x)
    f_prime=D(f)
    return 0.0
	#newtonroot(f,f_prime;iv=iv,tolerance=tolerance,maxiter=maxiter)
end

#This function finds the roots of f(x) taking iv as initial point
function newtonroot(f,f_prime; iv, tolerance=1E-7, maxiter=1000)
    # setup the algorithm
    x_old = iv
    normdiff = Inf
    iter = 1
    while normdiff > tolerance && iter <= maxiter
        x_new = x_old - f(x_old)/f_prime(x_old) # use the passed in map
        normdiff = norm(x_new - x_old)
        x_old = x_new
        iter = iter + 1
    end
	if iter>=maxiter || isnan(x_old)
		return (value = nothing, funcRes=nothing, iter=iter-1) # A named tuple
	else
		return (value = x_old, funcRes=f(x_old), iter=iter-1) # A named tuple
	end
end

export newtonroot

end # module
