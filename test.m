clc
sigma = 8;
X =-5.0:0.5:5.0
Y = X.^2 + sigma*randn(1,length(X))
X = X';
Y = Y';
Parameters = PolynomialRegression(X,Y,5,1)


