function [ w,var ] = firc( pars,b,residual_init )

T = pars.T;
[m, n] = size(T);
x = ones(n,1)/n;
z = zeros(n,1);
e = zeros(m,1);
u1 = zeros(m,1);
u2 = zeros(n,1);

var.x = x;
var.z = z;
var.e = e;
var.u1 = u1;
var.u2 = u2;

w = calcWeights( residual_init );
weight_prev = w;

for t=1:pars.kappa
    
    var = firc_admm(T,b,w,pars,var,pars.alg);
    
    residual = b - T*var.x;
    w = calcWeights( residual );
    
    weight_g  = norm(w-weight_prev,2)/norm(weight_prev,2);
    weight_prev = w;
    
    if weight_g < pars.epsilon_3
        break;
    end
end

end

