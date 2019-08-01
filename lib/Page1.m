function varargout = Page1(varargin)
% PAGE1 MATLAB code for Page1.fig
%      PAGE1, by itself, creates a new PAGE1 or raises the existing
%      singleton*.
%
%      H = PAGE1 returns the handle to a new PAGE1 or the handle to
%      the existing singleton*.
%
%      PAGE1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PAGE1.M with the given input arguments.
%
%      PAGE1('Property','Value',...) creates a new PAGE1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Page1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Page1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Page1

% Last Modified by GUIDE v2.5 30-Jan-2018 15:14:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Page1_OpeningFcn, ...
    'gui_OutputFcn',  @Page1_OutputFcn, ...
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


% --- Executes just before Page1 is made visible.
function Page1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Page1 (see VARARGIN)

% Choose default command line output for Page1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Page1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Page1_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function londown_Callback(hObject, eventdata, handles)
% hObject    handle to londown (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of londown as text
%        str2double(get(hObject,'String')) returns contents of londown as a double


% --- Executes during object creation, after setting all properties.
function londown_CreateFcn(hObject, eventdata, handles)
% hObject    handle to londown (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function latup_Callback(hObject, eventdata, handles)
% hObject    handle to latup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of latup as text
%        str2double(get(hObject,'String')) returns contents of latup as a double


% --- Executes during object creation, after setting all properties.
function latup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to latup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lonup_Callback(hObject, eventdata, handles)
% hObject    handle to lonup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lonup as text
%        str2double(get(hObject,'String')) returns contents of lonup as a double


% --- Executes during object creation, after setting all properties.
function lonup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lonup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function latdown_Callback(hObject, eventdata, handles)
% hObject    handle to latdown (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of latdown as text
%        str2double(get(hObject,'String')) returns contents of latdown as a double


% --- Executes during object creation, after setting all properties.
function latdown_CreateFcn(hObject, eventdata, handles)
% hObject    handle to latdown (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ps_Callback(hObject, eventdata, handles)
% hObject    handle to ps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ps as text
%        str2double(get(hObject,'String')) returns contents of ps as a double


% --- Executes during object creation, after setting all properties.
function ps_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function qs_Callback(hObject, eventdata, handles)
% hObject    handle to qs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of qs as text
%        str2double(get(hObject,'String')) returns contents of qs as a double


% --- Executes during object creation, after setting all properties.
function qs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to qs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inputband_Callback(hObject, eventdata, handles)
% hObject    handle to inputband (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputband as text
%        str2double(get(hObject,'String')) returns contents of inputband as a double


% --- Executes during object creation, after setting all properties.
function inputband_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputband (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Band_Callback(hObject, eventdata, handles)
% hObject    handle to Band (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Band as text
%        str2double(get(hObject,'String')) returns contents of Band as a double


% --- Executes during object creation, after setting all properties.
function Band_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Band (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function parr_Callback(hObject, eventdata, handles)
% hObject    handle to parr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of parr as text
%        str2double(get(hObject,'String')) returns contents of parr as a double


% --- Executes during object creation, after setting all properties.
function parr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to parr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function over_Callback(hObject, eventdata, handles)
% hObject    handle to over (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of over as text
%        str2double(get(hObject,'String')) returns contents of over as a double


% --- Executes during object creation, after setting all properties.
function over_CreateFcn(hObject, eventdata, handles)
% hObject    handle to over (see GCBO)
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


% --- Executes on button press in runBP.
function runBP_Callback(hObject, eventdata, handles)
% hObject    handle to runBP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
path=get(handles.path,'String');
inputband=str2num(get(handles.inputband,'String'));
Band=str2num(get(handles.Band,'String'));
ps=str2num(get(handles.ps,'String'));
qs=str2num(get(handles.qs,'String'));
parr=str2num(get(handles.parr,'String'));
over=str2num(get(handles.over,'String'));
lon0=str2num(get(handles.lon0,'string'));
lat0=str2num(get(handles.lat0,'string'));
dep=str2num(get(handles.dep,'string'));
lonup=str2num(get(handles.lonup,'String'));
londown=str2num(get(handles.londown,'String'));
latup=str2num(get(handles.latup,'String'));
latdown=str2num(get(handles.latdown,'String'));
lonrange=[londown lonup]
latrange=[latdown latup]
fprintf( 'Run runBP\n');
[BPfile]=setparBP(path,inputband,Band,lon0,lat0,dep,parr,over,ps,qs,lonrange,latrange)
BP_type=get(handles.popupmenu1,'value')

if BP_type==1
    runteleBPmusic(path,BPfile);
elseif BP_type==2
    runteleBPquick(path,BPfile);
    
else
    fprintf('BP Type wrong')
end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

slidervalue=get(handles.slider1,'value')
ang=int32(slidervalue)
set(handles.slider1,'Value',ang)

load japan_coastline.dat;

path=get(handles.path,'String');
lonup=str2num(get(handles.lonup,'String'));
londown=str2num(get(handles.londown,'String'));
latup=str2num(get(handles.latup,'String'));
latdown=str2num(get(handles.latdown,'String'));
ps=str2num(get(handles.ps,'String'));
qs=str2num(get(handles.qs,'String'));
lon0=str2num(get(handles.lon0,'string'));
lat0=str2num(get(handles.lat0,'string'));
ux=linspace(latdown+lat0,latup+lat0,ps);
uy=linspace(londown+lon0,lonup+lon0,qs);
Band=str2num(get(handles.Band,'string'));
[fl fh]=band_select(Band);
ret.win=round(1.0/fh*20.0 );
dirname= strcat('Par',num2str(fl),'_',num2str(fh),'_',num2str(ret.win),'Dir/');
filename=strcat(path,'Input/',dirname,num2str(ang),'smat.mat')
load(filename)
ncontour=8;
Pw=real(Pw)/max(max(real(Pw)));
[c,ch]=contourf(handles.axes1,uy,ux,abs(Pw),ncontour);
colorbar();
hold on
plot(handles.axes1,japan_coastline(:,1),japan_coastline(:,2),'k');
ylim([min(ux) max(ux)]);
xlim([min(uy) max(uy)]);


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
