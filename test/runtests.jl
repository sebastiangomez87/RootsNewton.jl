using RootsNewton
using Test

#test to see if returns nothing for functions without real roots
f(x)=x^2+2
fp(x)=2*x
@test newtonroot(f,fp;iv=1.0, tolerance=1E-7, maxiter=1000).value==nothing

#Tests of functions with known solutions
f(x)=x-2
fp(x)=1
@test newtonroot(f,fp;iv=1.0, tolerance=1E-7, maxiter=1000).value ≈ 2

f(x)=x^3-1
fp(x)=3*x^2
@test newtonroot(f,fp;iv=1.0, tolerance=1E-7, maxiter=1000).value ≈ 1

f(x)=log(x)
fp(x)=1/x
@test newtonroot(f,fp;iv=1.0, tolerance=1E-7, maxiter=1000).value ≈ 1

f(x)=cos(x)
fp(x)=-sin(x)
@test newtonroot(f,fp;iv=1.0, tolerance=1E-7, maxiter=1000).value ≈ pi/2

#Tests using automatic differentiation

f(x)=x-2
@test newtonroot(f;iv=1.0, tolerance=1E-7, maxiter=1000).value ≈ 2

f(x)=x^3-1
@test newtonroot(f;iv=2.0, tolerance=1E-7, maxiter=1000).value ≈ 1

f(x)=log(x)
@test newtonroot(f;iv=2.0, tolerance=1E-7, maxiter=1000).value ≈ 1

f(x)=cos(x)
@test newtonroot(f;iv=1.0, tolerance=1E-7, maxiter=1000).value ≈ pi/2

#Tests with BigFloat
f(x)=x-2
@test newtonroot(f;iv=BigFloat(1.0), tolerance=1E-7, maxiter=1000).value ≈ 2

#Tests that maxiter is working
f(x)=x^3-1
@test newtonroot(f;iv=100, tolerance=1E-7, maxiter=3).iter <= 3

#Tests that tolerance is working
f(x)=x^3-1
@test 1-2 <= newtonroot(f;iv=10, tolerance=2, maxiter=1000).value <= 1+2 || newtonroot(f;iv=10, tolerance=2, maxiter=1000).iter==1000


#@testset "RootsNewton.jl" begin
    # Write your own tests here.
#end
