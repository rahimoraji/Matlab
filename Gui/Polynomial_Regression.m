function varargout = Polynomial_Regression(varargin)
% POLYNOMIAL_REGRESSION MATLAB code for Polynomial_Regression.fig
%      POLYNOMIAL_REGRESSION, by itself, creates a new POLYNOMIAL_REGRESSION or raises the existing
%      singleton*.
%
%      H = POLYNOMIAL_REGRESSION returns the handle to a new POLYNOMIAL_REGRESSION or the handle to
%      the existing singleton*.
%
%      POLYNOMIAL_REGRESSION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in POLYNOMIAL_REGRESSION.M with the given input arguments.
%
%      POLYNOMIAL_REGRESSION('Property','Value',...) creates a new POLYNOMIAL_REGRESSION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Polynomial_Regression_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Polynomial_Regression_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, 	, GUIHANDLES

% Edit the above text to modify the response to help Polynomial_Regression

% Last Modified by GUIDE v2.5 13-Nov-2016 15:46:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Polynomial_Regression_OpeningFcn, ...
                   'gui_OutputFcn',  @Polynomial_Regression_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Polynomial_Regression is made visible.
function Polynomial_Regression_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Polynomial_Regression (see VARARGIN)

% Choose default command line output for Polynomial_Regression
handles.output = hObject;
   axes(handles.latexPol);
   axis off;
   
% Update handles structure
guidata(hObject, handles);
% UIWAIT makes Polynomial_Regression wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Polynomial_Regression_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnExample.
function btnExample_Callback(hObject, eventdata, handles)
 
    clc
    [Xran, Yran] = RandomNumberGen(15, -0.5,0.5,0.01);
    clc
    set(handles.btnFit,'ForegroundColor','red');
    set(handles.btnFit,'Enable','on');
    set(handles.degreePolynom,'Enable','on');
    
    axes(handles.axesPlot);
    cla;
    plot(Xran,Yran,'*r');
    
    axes(handles.latexPol);
    axis off;
    cla;
        
    handles.X = Xran';
    handles.Y = Yran';
    guidata(hObject, handles);

   





function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnFit.
function btnFit_Callback(hObject, eventdata, handles)
% hObject    handle to btnFit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    cla;
    axes(handles.axesPlot);
    degree = get(handles.degreePolynom,'Value');
    [Para, poly] = PolynomialRegressionGUI(handles.X,handles.Y,degree-1,1);

    axes(handles.latexPol);
    axis off;
    cla;
    genCaption(poly,degree);
      


    
    
    
    
 
% --------------------------------------------------------------------
function file_Callback(hObject, eventdata, handles)
% hObject    handle to file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function open_Callback(hObject, eventdata, handles)
% hObject    handle to open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName,FilterIndex] = uigetfile({'*.csv','Csv Files(*.csv)'},'Select Your *.csv File','');
%CurDir=pwd;
%close('all');
if ((FilterIndex~=0) && (length(FileName)~=0) && (length(PathName)~=0))
    set(handles.btnFit,'ForegroundColor','blue');
    openedFile = csvread(strcat(PathName,FileName));
    handles.X = openedFile(:,1);
    handles.Y = openedFile(:,2);
    set(handles.btnFit,'Enable','on');
    set(handles.degreePolynom,'Enable','on');
    
    axes(handles.latexPol);
    axis off;
    cla;

    axes(handles.axesPlot);
    cla;
    plot(handles.X,handles.Y,'*r');

    
else
     set(handles.btnFit,'Enable','off');
end
    guidata(hObject, handles);
% axes(handles.axesPlot);
% X =-5.0:0.5:5.0;
% X = X';
% Y = Y';
% [Para, poly] = PolynomialRegressionGUI(X,Y,15,1);
% set(handles.polyTexe, 'String', poly);
% set(handles.edit1, 'String', poly);

% --------------------------------------------------------------------
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all; %
clc; % 
fclose('all'); %  
close(gcbf);


% --- Executes on selection change in listDegree.
function listDegree_Callback(hObject, eventdata, handles)
% hObject    handle to listDegree (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listDegree contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listDegree


% --- Executes during object creation, after setting all properties.
function listDegree_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listDegree (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in degreePolynom.
function degreePolynom_Callback(hObject, eventdata, handles)
% hObject    handle to degreePolynom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns degreePolynom contents as cell array
%        contents{get(hObject,'Value')} returns selected item from degreePolynom
     cla;
     axes(handles.axesPlot);
     degree = get(handles.degreePolynom,'Value');
     [Para, poly] = PolynomialRegressionGUI(handles.X,handles.Y,degree-1,1);
    axes(handles.latexPol);
    axis off;
    cla;
    genCaption(poly,degree);

% --- Executes during object creation, after setting all properties.
function degreePolynom_CreateFcn(hObject, eventdata, handles)
% hObject    handle to degreePolynom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on btnFit and none of its controls.
function btnFit_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to btnFit (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
