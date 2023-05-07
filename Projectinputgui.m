function varargout = Projectinputgui(varargin)
% PROJECTINPUTGUI MATLAB code for Projectinputgui.fig
%      PROJECTINPUTGUI, by itself, creates a new PROJECTINPUTGUI or raises the existing
%      singleton*.
%
%      H = PROJECTINPUTGUI returns the handle to a new PROJECTINPUTGUI or the handle to
%      the existing singleton*.
%
%      PROJECTINPUTGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECTINPUTGUI.M with the given input arguments.
%
%      PROJECTINPUTGUI('Property','Value',...) creates a new PROJECTINPUTGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Projectinputgui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Projectinputgui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Projectinputgui

% Last Modified by GUIDE v2.5 15-Sep-2019 20:15:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Projectinputgui_OpeningFcn, ...
                   'gui_OutputFcn',  @Projectinputgui_OutputFcn, ...
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


% --- Executes just before Projectinputgui is made visible.
function Projectinputgui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Projectinputgui (see VARARGIN)
 
% Choose default command line output for Projectinputgui
handles.output = hObject;

 
% Update handles structure
guidata(hObject, handles);


% UIWAIT makes Projectinputgui wait for user response (see UIRESUME)
% uiwait(handles.figure1);
 imshow('guiphoto.jpg')

% --- Outputs from this function are returned to the command line.
function varargout = Projectinputgui_OutputFcn(hObject, eventdata, handles) 
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
 imshow(hObject,'guiphoto.jpg')
% Hint: place code in OpeningFcn to populate axes1


% --- Executes on button press in genout.
function genout_Callback(hObject, eventdata, handles)
% hObject    handle to genout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

voltages= str2num(get(handles.vrms, 'String'));
frequencies= str2num(get(handles.freq, 'String'));
loaded1 = str2num(get(handles.load1,'String'));
loaded2 = str2num(get(handles.load2,'String'));
loaded3 = str2num(get(handles.load3, 'String'));
lineloaded = str2num(get(handles.lineload, 'String')); 
loaded1 = seriesinator(phasoriser(loaded1,frequencies));
loaded2 = seriesinator(phasoriser(loaded2, frequencies));
loaded3 = seriesinator(phasoriser(loaded3, frequencies));
lineloaded= seriesinator(phasoriser(lineloaded, frequencies));
desire= str2num(get(handles.powerfactor,'String'));
sourcecon= get(handles.configure1,'Value');
loadcon= get(handles.configure2,'Value');
abcnakiacb= get(handles.configure3,'Value');
pferdik = get(handles.direction, 'Value');

voltageSource = sourcemaker(voltages, abcnakiacb);

if sourcecon==1 && loadcon==1 
     [vPhase,vLine,iLine,iPhase,perPhasePower,totalPower,lineLossPower,perPhasePf,totalPf,reqd_value,reqd_type, pfType]...
    = wye_wye(voltageSource, [loaded1 loaded2 loaded3],  lineloaded, frequencies, desire, pferdik) ; 
end

if sourcecon==1 && loadcon==2 
        [vPhase,vLine,iLine,iPhase,perPhasePower,totalPower,lineLossPower,perPhasePf,totalPf,reqd_value,reqd_type, pfType]...
    = wye_delta(voltageSource, [loaded1 loaded2 loaded3],  lineloaded, frequencies, desire, pferdik);
end

if sourcecon==2 && loadcon==1 
      [vPhase,vLine,iLine,iPhase,perPhasePower,totalPower,lineLossPower,perPhasePf,totalPf,reqd_value,reqd_type, pfType]...
    = delta_wye(voltageSource, [loaded1 loaded2 loaded3],  lineloaded, frequencies, desire, pferdik);
end

if sourcecon==2 && loadcon==2
        [vPhase,vLine,iLine,iPhase,perPhasePower,totalPower,lineLossPower,perPhasePf,totalPf,reqd_value,reqd_type, pfType]...
    = delta_delta(voltageSource, [loaded1 loaded2 loaded3],  lineloaded, frequencies, desire, pferdik) ; 
end

setappdata(0, 'vPhase',vPhase );
setappdata(0, 'vLine',vLine );
setappdata(0, 'iLine',iLine );
setappdata(0, 'iPhase',iPhase );
setappdata(0, 'perPhasePower',perPhasePower );
setappdata(0, 'totalPower', totalPower);
setappdata(0, 'lineLossPower', lineLossPower);
setappdata(0, 'perPhasePf',perPhasePf );
setappdata(0, 'totalPf',totalPf );
setappdata(0, 'reqd_value',reqd_value );
setappdata(0, 'reqd_type',reqd_type);
setappdata(0, 'pfType',pfType );
run projectoutputgui;

function lineload_Callback(hObject, eventdata, handles)
% hObject    handle to lineload (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lineload as text
%        str2double(get(hObject,'String')) returns contents of lineload as a double


% --- Executes during object creation, after setting all properties.
function lineload_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lineload (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function powerfactor_Callback(hObject, eventdata, handles)
% hObject    handle to powerfactor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of powerfactor as text
%        str2double(get(hObject,'String')) returns contents of powerfactor as a double


% --- Executes during object creation, after setting all properties.
function powerfactor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to powerfactor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function load1_Callback(hObject, eventdata, handles)
% hObject    handle to load1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of load1 as text
%        str2double(get(hObject,'String')) returns contents of load1 as a double


% --- Executes during object creation, after setting all properties.
function load1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to load1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function load2_Callback(hObject, eventdata, handles)
% hObject    handle to load2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of load2 as text
%        str2double(get(hObject,'String')) returns contents of load2 as a double


% --- Executes during object creation, after setting all properties.
function load2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to load2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function load3_Callback(hObject, eventdata, handles)
% hObject    handle to load3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of load3 as text
%        str2double(get(hObject,'String')) returns contents of load3 as a double


% --- Executes during object creation, after setting all properties.
function load3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to load3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function freq_Callback(hObject, eventdata, handles)
% hObject    handle to freq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of freq as text
%        str2double(get(hObject,'String')) returns contents of freq as a double


% --- Executes during object creation, after setting all properties.
function freq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to freq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function vrms_Callback(hObject, eventdata, handles)
% hObject    handle to vrms (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vrms as text
%        str2double(get(hObject,'String')) returns contents of vrms as a double


% --- Executes during object creation, after setting all properties.
function vrms_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vrms (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in configure2.
function configure2_Callback(hObject, eventdata, handles)
% hObject    handle to configure2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns configure2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from configure2


% --- Executes during object creation, after setting all properties.
function configure2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to configure2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in configure1.
function configure1_Callback(hObject, eventdata, handles)
% hObject    handle to configure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns configure1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from configure1


% --- Executes during object creation, after setting all properties.
function configure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to configure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in direction.
function direction_Callback(hObject, eventdata, handles)
% hObject    handle to direction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns direction contents as cell array
%        contents{get(hObject,'Value')} returns selected item from direction


% --- Executes during object creation, after setting all properties.
function direction_CreateFcn(hObject, eventdata, handles)
% hObject    handle to direction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on genout and none of its controls.
function genout_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to genout (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in configure3.
function configure3_Callback(hObject, eventdata, handles)
% hObject    handle to configure3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns configure3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from configure3


% --- Executes during object creation, after setting all properties.
function configure3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to configure3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
