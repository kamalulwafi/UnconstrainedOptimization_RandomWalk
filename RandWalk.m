%% Random Walk Method
% Chapter 6. (p.301) Non-Linear Programming II. Unconstrained Optimization
% 6.2 Random Walk Method
% Engineering Optimization - Theory and Practice, 4th Edition
% Singiresu S. Rao

clear all
clc

%% Initialization
syms X Y lambda
var = 2;                    % Number of variables on objective function
eps = 0.05;                 % Small probe length (\epsilon)
x = [0;0];                  % Starting point
N = 20;                    % Mazimum episodes
a = 1                       % Lambda - step length
n = 2;                      % A set of n-numbers

% Generate objective function
f = symfun(X - Y + 2*X^2 + 2*X*Y + Y^2, [X Y]);     % 1 Method
% f = inline(X - Y + 2*X^2 + 2*X*Y + Y^2)           % 2 Method
% f = @(X,Y) X - Y + 2*X^2 + 2*X*Y + Y^2            % 3 Method


%% Iterations
R = inf;
% STEP 3
i = 1;
x_temp = x;
while i < N+1
    % STEP 4
    while R > 1
        r = -1 + 2.*rand(n,1);      % n-numbers lies in [-1,1]
        R = sqrt(sum(r.^2))
    end
    u = r./R
    % STEP 5
    x_new = x_temp + a*u
    % STEP 6
    if f(x_new(1),x_new(2)) < f(x_temp(1),x_temp(2))
        x_temp = x_new;
        i = 1;
        R = inf;
    else
        % STEP 7
        if i <= N
            i = i + 1
            R = inf;
        end
        if i > N
            % STEP 8
            i = 1;
            R = inf;
            a = a/2
            if a <= eps
                % STEP 9
                break
            end
        end
    end
end
