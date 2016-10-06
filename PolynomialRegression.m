function betaValues = PolynomialRegression(X,Y,degree,plotFlag)
    % X and Y  are  (rows = N , col = 1) matrices
    N = length(X);
    one=ones(1,N)';
    
    % building X matrix 
    Xmatrix=one;
    for i=1 : degree
        Xmatrix = [Xmatrix,X.^i];
    end
    
    % obtaining beta parameters:
    % beta_1+beta_1.X + beta_2.X^2 + beta_3.X^3 +....
    
    Yvalue = (Xmatrix'*Y);
    T = Xmatrix'*Xmatrix;
    beta = (T^(-1))*Yvalue;
    
    if (plotFlag==1)
            Yplot=beta(1)*one;
            for m=1 : degree
                Yplot = Yplot+beta(m+1)*(X.^(m));
            end
            plot(X,Y,'*r',X,Yplot,'.-g');
            title(strcat('Polynomial Regression - Degree: ',num2str(degree)));
            xlabel('X-Values');
            ylabel('Y-Values');
    end
    % printing the polynimial
    poly=strcat('[',num2str(beta(1)),']');
    for m=1 : degree
      if(m>1)
        s = strcat('[',num2str(beta(m+1)),']','X^',num2str(m));
      else
        s = strcat('[',num2str(beta(m+1)),']','X'); 
      end    
      poly = strcat(poly,'+',s);
    end   
    strcat('p(x) = ',poly)        
    % return value
    betaValues = beta;
end
