function var = firc_admm( A,b,w,pars,var,alg )

MAX_ITER = 1000;
RELTOL   = pars.epsilon_1;
RELTOL1   = pars.epsilon_2;
Pinv = pars.Pinv;

x = var.x;
e = var.e;
z = var.z;
u1 = var.u1;
u2 = var.u2;

c = 1 + (2*w/(pars.rho1));
A_x = A*x;

for k = 1:MAX_ITER
    
    % e-update
    if strcmp(alg,'f-lr-irc')
        e_tilde = shrinkageW(b - A_x + (u1/(pars.rho1)),c);
        e = sing_shrinkage(reshape(e_tilde,pars.dim.m,pars.dim.n), pars.lambda_star);
        e = e(:);
    else
        e = shrinkageW(b - A_x + (u1/(pars.rho1)),c);
    end
    
    % z-update
    z = subplus(x+(u2/pars.rho2));
    
    % x-update
    new_b = (b - e + (u1/(pars.rho1)));
    q = A'*new_b + (pars.rho2/pars.rho1)*z - (u2/pars.rho1);
    x = Pinv*q;
    A_x = A*x;
    
    % u-update
    % update Multipliers
    leq1 = (b - A_x - e);
    leq2 = (x - z );
    
    u1 = u1 + pars.rho1*(leq1);
    u2 = u2 + pars.rho2*(leq2);
    
    stopC = norm(leq1);
    stopC1 = norm(leq2);
    
    if (stopC<RELTOL && stopC1<RELTOL1)
        break;
    end
end

var.x = x;
var.e = e;
var.z = z;
end


function z = shrinkageW(x,c)
z = x./c;
end

function y = sing_shrinkage(temp, lambda)

[U,sigma,V] = svd(temp,'econ');
sigma = diag(sigma);
svp = length(find(sigma>lambda));
if svp>=1
    sigma = sigma(1:svp)-lambda;
else
    svp = 1;
    sigma = 0;
end
y = U(:,1:svp)*diag(sigma)*V(:,1:svp)';

end


