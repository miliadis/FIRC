function [ W_y,W_T,x ] = runFIRC( pars,b )

T = pars.T;

residual = b - normc(mean(pars.Tor,2));
[w,var] = firc(pars,b,residual);

WW_index = repmat(w,[1 size(T,2)]);
W_T      = WW_index.*T;
W_y = w.*b;
x = var.x;

end
