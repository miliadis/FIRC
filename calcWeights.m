function [ w ] = calcWeights( res )

residual     =   res.^2;
residual_sort      =   sort(residual);
iter               =   residual_sort(ceil(0.6*length(residual)));
beta               =   8/iter;
w            =   1./(1+1./exp(-beta*(residual-iter)));

end

