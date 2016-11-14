function [betaValues, errFunction] = PolynomialRegression(X,Y,degree,plotFlag)
    % X and Y  are  N x 1 (rows = N , cols = 1) matrices
    % degree(0,1,2,3,4,...) is the degree of polynomial chosen for fitting data
    % plotFlag('Y' : plot data and function) 
    
    N = length(X);
    one=ones(1,N)';
    
    % builds X matrix 
    Xmatrix=one;
    for i=1 : degree
        Xmatrix = [Xmatrix,X.^i];
    end
    
    % obtaining beta parameters:
    % beta_1+beta_1.X + beta_2.X^2 + beta_3.X^3 +....
    
    Yvalue = (Xmatrix'*Y);
    T = Xmatrix'*Xmatrix;
    beta = (T^(-1))*Yvalue;
    
    if (plotFlag=='Y')
            Yplot=beta(1)*one;
            for m=1 : degree
                Yplot = Yplot+beta(m+1)*(X.^(m));
            end
            plot(X,Y,'*r',X,Yplot,'.-g');
            title(strcat('Polynomial Regression - Degree: ',num2str(degree)));
            xlabel('X-Values');
            ylabel('Y-Values');
    end
    %cost or error functions
    costFunction = (Y-Yplot)'*(Y-Yplot);
    
    % prints the polynomial
    poly=strcat('[',num2str(beta(1)),']');

    for m=1 : degree
        s = strcat('[',num2str(beta(m+1)),']','X'); 
      if(m>1)
        s = strcat('[',num2str(beta(m+1)),']','X^',num2str(m));
      end    
      poly = strcat(poly,'+',s);
    end   
    strcat('p(x) = ',poly)        
    % return values
    betaValues = beta;
    errFunction = costFunction;
end
