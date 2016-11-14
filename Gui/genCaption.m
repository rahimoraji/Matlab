function  genCaption(poly, degree )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

       [C,matches] = regexpi(poly,{'\^{6','\^{12'});
       C = cell2mat(C);
       matches = cell2mat(matches);
       
        if (12 < (degree-1))
            text(0.01,0.8,strcat('$$',poly(1:C(1)+3),'$$'),'Interpreter','latex');
            text(0.01,0.6,strcat('$$',poly(C(1)+4:matches(2)+1),'$$'),'Interpreter','latex');
            text(0.01,0.4,strcat('$$',poly(matches(2)+2:length(poly)),'$$'),'Interpreter','latex');
        elseif((6 < (degree-1)))
            text(0.01,0.8,strcat('$$',poly(1:C(1)+3),'$$'),'Interpreter','latex');
            text(0.01,0.6,strcat('$$',poly(C(1)+4:length(poly)),'$$'),'Interpreter','latex');     
        else
            text(0.01,0.8,strcat('$$',poly(1:length(poly)),'$$'),'Interpreter','latex');
        end 

end

