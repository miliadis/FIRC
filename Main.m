% =========================================================================
%   Michael Iliadis, Haohong Wang, Rafael Molina and
%   Aggelos K. Katsaggelos
%
%
% Written by Michael Iliadis @ NU-IVPL
% March, 2016.
% =========================================================================

clearvars;
clc;
close all;

%% DATA LOADING
load('data/YaleB_96x84_subsets_block_255.mat');
load('data/1.mat');

% DATABASE AND TESTING IMAGES (insert your own dataset here, make sure to
% use the same variable names - other than that you are all set, just RUN!)
train_or = imgs(:,trainIdx);
train = normc(imgs(:,trainIdx));
test = normc(imgs(:,testIdx));
gttrain = gtids(trainIdx);
gttest = gtids(testIdx);
classes = unique(gttrain);
fr.dim.m = 96;
fr.dim.n = 84;

%% PARAMETERS OF ALGORITHM 1
fr.Tor = train_or;
fr.T = train;
% PARAMETERS IRC///////////
fr.alg = 'f-lr-irc'; % 'f-irc', 'f-lr-irc'
fr.epsilon_3 = 0.01;
fr.kappa = 100;
% PARAMETERS ADMM//////////
fr.lambda_star = 0.01; % use 0.01 or 0.05
fr.rho1 = 1;
fr.rho2 = 0.1;
fr.epsilon_1 = 0.01;
fr.epsilon_2 = 0.1;
%%%%%%%%%%%%%%%%%%%%%%%%%%
R = inv(fr.T'*fr.T + eye(size(fr.T'*fr.T,2)).*(fr.rho2/fr.rho1));
fr.Pinv = R;

%% RUN FACE IDENTIFICATION
for ii=1:size(test,2)
    
    % Regression
    [y,T,x] = runFIRC( fr,test(:,ii) );
    
    % Identification scheme
    for class  =  1:size(classes,2)
        s           =   x (gttrain == classes(class));
        residuals(class) = norm(y - T(:,gttrain == classes(class))*s, 2);
    end
    [val,identity] = min(residuals);
    label = classes(identity);
    
    % Printing
    if label==gttest(ii)
        accuracy(ii) = 1;
        fprintf('%d right!\n', ii);
    else
        fprintf('%d wrong! %d\n', ii,gttest(ii));
        
    end
end

%% PRINT FINAL RECOGNITION RATE
meanAcc = mean(accuracy);
fprintf('Recognition rate: %.2f\n', meanAcc*100);
