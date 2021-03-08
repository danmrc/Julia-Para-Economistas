using LinearAlgebra

A = [0.5 0.7 0;
       1 1 0;
       0 0 0]

B = [1 0 0;
     0 1 1;
     -1.5 -0.5/4 1]

mat = inv(B)*A
    
tt = eigen(mat)

abs.(tt.values)

uu = [1;0;0]

dynamics = zeros(11,3)

dynamics[1,:] = uu

for t = 1:10
    dynamics[t+1,:] = mat*dynamics[t,:]

end

using Plots

plot(dynamics[:,1], label = "π")
plot(dynamics[:,2],label = "y")
plot(dynamics[:,3],label = "i")
