clc
% opens a csv file 
[FileName,PathName,FilterIndex] = uigetfile({'*.csv','Csv Files(*.csv)'},'Select Your *.csv File','');
%CurDir=pwd;
%close('all');
if ((FilterIndex~=0) && (length(FileName)~=0) && (length(PathName)~=0))

    openedFile = csvread(strcat(PathName,FileName));
	% first column
    X = openedFile(:,1);
    % second column
	Y = openedFile(:,2);
else
    display('No file is opened !!!');
end


% % generates random numbers
% sigma = 8;
% X =-5.0:0.5:5.0;
% Y = X.^2 + sigma*randn(1,length(X));
% X = X';
% Y = Y';
degree = 8;
displayPlot = 'Y'; % 'Y' : display data and fitted function 
[Parameters, errFunction] = PolynomialRegression(X,Y,degree,displayPlot)


