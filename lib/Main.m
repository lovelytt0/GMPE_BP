function varargout = Main(varargin)
%MAIN M-file for Main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('Property','Value',...) creates a new MAIN using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Main_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      MAIN('CALLBACK') and MAIN('CALLBACK',hObject,...) call the
%      local function named CALLBACK in MAIN.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Main

% Last Modified by GUIDE v2.5 23-Jan-2018 01:16:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Main_OpeningFcn, ...
                   'gui_OutputFcn',  @Main_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before Main is made visible.
function Main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Main_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function address_Callback(hObject, eventdata, handles)
% hObject    handle to address (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of address as text
%        str2double(get(hObject,'String')) returns contents of address as a double


% --- Executes during object creation, after setting all properties.
function address_CreateFcn(hObject, eventdata, handles)
% hObject    handle to address (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Dir_Callback(hObject, eventdata, handles)
% hObject    handle to Dir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Dir as text
%        str2double(get(hObject,'String')) returns contents of Dir as a double


% --- Executes during object creation, after setting all properties.
function Dir_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Dir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in initial_flag.
function initial_flag_Callback(hObject, eventdata, handles)
% hObject    handle to initial_flag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

a1=get(handles.address,'string');
a2=get(handles.Dir,'string');
fprintf(a1)
fprintf(a2)
    initialize(a1,a2);

function path_Callback(hObject, eventdata, handles)
% hObject    handle to path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of path as text
%        str2double(get(hObject,'String')) returns contents of path as a double



% --- Executes during object creation, after setting all properties.
function path_CreateFcn(hObject, eventdata, handles)
% hObject    handle to path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.


if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function lon0_Callback(hObject, eventdata, handles)
% hObject    handle to lon0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lon0 as text
%        str2double(get(hObject,'String')) returns contents of lon0 as a double


% --- Executes during object creation, after setting all properties.
function lon0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lon0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lat0_Callback(hObject, eventdata, handles)
% hObject    handle to lat0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lat0 as text
%        str2double(get(hObject,'String')) returns contents of lat0 as a double


% --- Executes during object creation, after setting all properties.
function lat0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lat0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function dep_Callback(hObject, eventdata, handles)
% hObject    handle to dep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dep as text
%        str2double(get(hObject,'String')) returns contents of dep as a double


% --- Executes during object creation, after setting all properties.
function dep_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Mw_Callback(hObject, eventdata, handles)
% hObject    handle to Mw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Mw as text
%        str2double(get(hObject,'String')) returns contents of Mw as a double


% --- Executes during object creation, after setting all properties.
function Mw_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Mw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sr_Callback(hObject, eventdata, handles)
% hObject    handle to sr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sr as text
%        str2double(get(hObject,'String')) returns contents of sr as a double


% --- Executes during object creation, after setting all properties.
function sr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function display_Callback(hObject, eventdata, handles)
% hObject    handle to display (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of display as text
%        str2double(get(hObject,'String')) returns contents of display as a double


% --- Executes during object creation, after setting all properties.
function display_CreateFcn(hObject, eventdata, handles)
% hObject    handle to display (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Preshift.
function Preshift_Callback(hObject, eventdata, handles)
% hObject    handle to Preshift (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Preshift





% --- Executes on button press in readteleBP.
function readteleBP_Callback(hObject, eventdata, handles)
% hObject    handle to readteleBP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
  

% 
% 
% 
lon0=str2num(get(handles.lon0,'string'));
lat0=str2num(get(handles.lat0,'string'));
sr=str2num(get(handles.sr,'string'));
display=str2num(get(handles.display,'string'));
plotscale=str2num(get(handles.plotscale,'string'));

a1=get(handles.address,'string');
a2=get(handles.Dir,'string');
path=strcat(a1,a2,'/');
fprintf('Run readBP\n');
preshift=get(handles.Preshift,'value');
  readteleBP(path,lon0,lat0,sr,display,preshift,plotscale)



function ts12_Callback(hObject, eventdata, handles)
% hObject    handle to ts12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ts12 as text
%        str2double(get(hObject,'String')) returns contents of ts12 as a double


% --- Executes during object creation, after setting all properties.
function ts12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ts12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function refst_Callback(hObject, eventdata, handles)
% hObject    handle to refst (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of refst as text
%        str2double(get(hObject,'String')) returns contents of refst as a double


% --- Executes during object creation, after setting all properties.
function refst_CreateFcn(hObject, eventdata, handles)
% hObject    handle to refst (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Band_for_align_Callback(hObject, eventdata, handles)
% hObject    handle to Band_for_align (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Band_for_align as text
%        str2double(get(hObject,'String')) returns contents of Band_for_align as a double


% --- Executes during object creation, after setting all properties.
function Band_for_align_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Band_for_align (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cutoff_Callback(hObject, eventdata, handles)
% hObject    handle to cutoff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cutoff as text
%        str2double(get(hObject,'String')) returns contents of cutoff as a double


% --- Executes during object creation, after setting all properties.
function cutoff_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cutoff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in align_BP.
function align_BP_Callback(hObject, eventdata, handles)
% hObject    handle to align_BP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
path=get(handles.path,'String');
Band_for_align=str2num(get(handles.Band_for_align,'String'))
plotscale=str2num(get(handles.plotscale,'String'))

ts12=str2num(get(handles.ts12,'String'))
refst=str2num(get(handles.refst,'String'));
cutoff=str2num(get(handles.cutoff,'String'));

    fprintf( 'Run alignBP\n');
    align_BP(path,Band_for_align,ts12,refst,cutoff,plotscale)



function plotscale_Callback(hObject, eventdata, handles)
% hObject    handle to plotscale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of plotscale as text
%        str2double(get(hObject,'String')) returns contents of plotscale as a double


% --- Executes during object creation, after setting all properties.
function plotscale_CreateFcn(hObject, eventdata, handles)
% hObject    handle to plotscale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Band_for_check_Callback(hObject, eventdata, handles)
% hObject    handle to Band_for_check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Band_for_check as text
%        str2double(get(hObject,'String')) returns contents of Band_for_check as a double


% --- Executes during object creation, after setting all properties.
function Band_for_check_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Band_for_check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in check_BP.
function check_BP_Callback(hObject, eventdata, handles)
% hObject    handle to check_BP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Band_for_check=str2num(get(handles.Band_for_check,'String'));
path=get(handles.path,'String');
plotscale=str2num(get(handles.plotscale,'string'));

 checkwave(path,Band_for_check,plotscale);
 
 
 


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
