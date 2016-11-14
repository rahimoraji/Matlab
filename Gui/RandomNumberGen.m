function [ X, Y] = RandomNumberGen(sigma , start, stop, step)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    X =start:step: stop;
    Y = X.^2 + sigma*randn(1,length(X));

end

