function varargout = projectoutputgui(varargin)
% PROJECTOUTPUTGUI MATLAB code for projectoutputgui.fig
%      PROJECTOUTPUTGUI, by itself, creates a new PROJECTOUTPUTGUI or raises the existing
%      singleton*.
%
%      H = PROJECTOUTPUTGUI returns the handle to a new PROJECTOUTPUTGUI or the handle to
%      the existing singleton*.
%
%      PROJECTOUTPUTGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECTOUTPUTGUI.M with the given input arguments.
%
%      PROJECTOUTPUTGUI('Property','Value',...) creates a new PROJECTOUTPUTGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before projectoutputgui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to projectoutputgui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help projectoutputgui

% Last Modified by GUIDE v2.5 16-Sep-2019 15:11:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @projectoutputgui_OpeningFcn, ...
                   'gui_OutputFcn',  @projectoutputgui_OutputFcn, ...
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


% --- Executes just before projectoutputgui is made visible.
function projectoutputgui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to projectoutputgui (see VARARGIN)

% Choose default command line output for projectoutputgui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
 
 imshow('outputgui.jpeg')
vPhase=getappdata(0, 'vPhase');
vLine=getappdata(0, 'vLine');
iLine=getappdata(0, 'iLine');
iPhase=getappdata(0, 'iPhase');
perPhasePower =getappdata(0, 'perPhasePower');
totalPower =getappdata(0, 'totalPower');
lineLossPower =getappdata(0, 'lineLossPower');
perPhasePf =getappdata(0, 'perPhasePf');
totalPf =getappdata(0, 'totalPf');
reqd_value =getappdata(0, 'reqd_value');
reqd_type=getappdata(0, 'reqd_type');
pfType = getappdata(0, 'pfType');

set(handles.PV1, 'String' , num2str(vPhase(1)));
set(handles.PV2, 'String' , num2str(vPhase(2)));
set(handles.PV3, 'String' , num2str(vPhase(3)));
set(handles.LV1, 'String' , num2str(vLine(1)));
set(handles.LV2, 'String' , num2str(vLine(2)));
set(handles.LV3, 'String' , num2str(vLine(3)));
set(handles.PC1, 'String' , num2str(iPhase(1)));
set(handles.PC2, 'String' , num2str(iPhase(2)));
set(handles.PC3, 'String' , num2str(iPhase(3)));
set(handles.LC1, 'String' , num2str(iLine(1)));
set(handles.LC2, 'String' , num2str(iLine(2)));
set(handles.LC3, 'String' , num2str(iLine(3)));
set(handles.anspf, 'String' , num2str(totalPf));
set(handles.ansdirection, 'String' , pfType);
set(handles.ansload, 'String' , num2str(totalPower));
set(handles.ansloss, 'String' , num2str(lineLossPower));
set(handles.val1, 'String' ,  num2str(reqd_value(1)));
set(handles.val2, 'String' ,  num2str(reqd_value(2)));
set(handles.val3, 'String' ,  num2str(reqd_value(3)));
reqd_value(1)
reqd_value(2)
reqd_value(3)

if reqd_type(1)==1
 set(handles.etype1, 'String' , 'Inductor');   
end
if reqd_type(1)==2
 set(handles.etype1, 'String' , 'Capacitor');     
end
if reqd_type(1)==3
  set(handles.etype1, 'String' , 'Nothing');    
end

if reqd_type(2)==1
 set(handles.etype2, 'String' , 'Inductor');   
end
if reqd_type(2)==2
 set(handles.etype2, 'String' , 'Capacitor');     
end
if reqd_type(2)==3
  set(handles.etype2, 'String' , 'Nothing');    
end

if reqd_type(3)==1
 set(handles.etype3, 'String' , 'Inductor');   
end
if reqd_type(3)==2
 set(handles.etype3, 'String' , 'Capacitor');     
end
if reqd_type(3)==3
  set(handles.etype3, 'String' , 'Nothing');    
end
vPhase= round(vPhase,1);
iPhase = round(iPhase,1);
iLine = round(iLine, 1);
vLine = round(vLine,1);
for i=1:3
axes(handles.PVplot);
plot([0 real(vPhase(i))], [0 imag(vPhase(i))]);
text(real(vPhase(i)),imag(vPhase(i)),['(', num2str(round(abs(vPhase(i)),1)), ', ', num2str(round(angle(vPhase(i)),1)), ')'])
hold on; end
legend('Phase Voltage 1', 'Phase Voltage 2', 'Phase Voltage 3','Location', 'southoutside');
for i=1:3
axes(handles.LVplot);
plot([0 real(vLine(i))], [0 imag(vLine(i))]);
text(real(vLine(i)),imag(vLine(i)),['(', num2str(round(abs(vLine(i)),1)), ', ', num2str(round(angle(vLine(i)),1)), ')'])
hold on; end
legend('Line Voltage 1', 'Line Voltage 2', 'Line Voltage 3','Location', 'southoutside');
for i=1:3
axes(handles.PCplot);
plot([0 real(iPhase(i))], [0 imag(iPhase(i))]);
text(real(iPhase(i)),imag(iPhase(i)),['(', num2str(round(abs(iPhase(i)),1)), ', ', num2str(round(angle(iPhase(i)),1)), ')'])
hold on; end
legend('Phase Current 1', 'Phase Current 2', 'Phase Current 3', 'Location', 'southoutside');
for i=1:3
axes(handles.LCplot);
plot([0 real(iLine(i))], [0 imag(iLine(i))]);
text(real(iLine(i)),imag(iLine(i)),['(', num2str(round(abs(iLine(i)),1)), ', ', num2str(round(angle(iLine(i)),1)), ')'])
hold on; end
legend('Line Current 1', 'Line Current 2', 'Line Current 3','Location', 'southoutside');
 
% UIWAIT makes projectoutputgui wait for user response (see UIRESUME)
% uiwait(handles.figure1);

 
% --- Outputs from this function are returned to the command line.
function varargout = projectoutputgui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
 



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



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
