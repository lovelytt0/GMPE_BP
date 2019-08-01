function varargout = Page2(varargin)
% PAGE2 MATLAB code for Page2.fig
%      PAGE2, by itself, creates a new PAGE2 or raises the existing
%      singleton*.
%
%      H = PAGE2 returns the handle to a new PAGE2 or the handle to
%      the existing singleton*.
%
%      PAGE2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PAGE2.M with the given input arguments.
%
%      PAGE2('Property','Value',...) creates a new PAGE2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Page2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Page2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Page2

% Last Modified by GUIDE v2.5 31-Jan-2018 10:44:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Page2_OpeningFcn, ...
    'gui_OutputFcn',  @Page2_OutputFcn, ...
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


% --- Executes just before Page2 is made visible.
function Page2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Page2 (see VARARGIN)

% Choose default command line output for Page2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Page2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Page2_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function duration_Callback(hObject, eventdata, handles)
% hObject    handle to duration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of duration as text
%        str2double(get(hObject,'String')) returns contents of duration as a double


% --- Executes during object creation, after setting all properties.
function duration_CreateFcn(hObject, eventdata, handles)
% hObject    handle to duration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function restrict_Callback(hObject, eventdata, handles)
% hObject    handle to restrict (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of restrict as text
%        str2double(get(hObject,'String')) returns contents of restrict as a double


% --- Executes during object creation, after setting all properties.
function restrict_CreateFcn(hObject, eventdata, handles)
% hObject    handle to restrict (see GCBO)
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


% --- Executes on button press in Rdlogfile.
function Rdlogfile_Callback(hObject, eventdata, handles)
% hObject    handle to Rdlogfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

path=get(handles.path,'String');
Band=str2num(get(handles.Band,'String'));
time_length=str2num(get(handles.duration,'String'))
restrict=str2num(get(handles.restrict,'String'));

fprintf( 'Run Rdlogfile\n');
Rdlogfile(path,Band,time_length,restrict)


% --- Executes on button press in Process1.
function Process1_Callback(hObject, eventdata, handles)
% hObject    handle to Process1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
path=get(handles.path,'String');
Band=str2num(get(handles.Band,'String'));
lat0=str2num(get(handles.lat0,'String'))
lon0=str2num(get(handles.lon0,'String'));
dep=str2num(get(handles.dep,'String'));
limit=str2num(get(handles.limit,'String'));

fprintf( 'Run Process1\n');
Process1(path,Band,lat0,lon0,dep,limit)

% --- Executes on button press in Process2.
function Process2_Callback(hObject, eventdata, handles)
% hObject    handle to Process2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
path=get(handles.path,'String');
Band=str2num(get(handles.Band,'String'));
dep=str2num(get(handles.dep,'String'));
Mw=str2num(get(handles.Mw,'String'));

dislimit=1000;
equation_flag=get(handles.popupmenu1,'value')
fprintf( 'Run Process2\n');
Process2(path,Band,Mw,dep,dislimit,equation_flag)


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


% --- Executes on button press in createspectrum.
function createspectrum_Callback(hObject, eventdata, handles)
% hObject    handle to createspectrum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
path=get(handles.path,'String');
Band=str2num(get(handles.Band,'String'));
equation_flag=get(handles.popupmenu1,'value')

createspectrum(path,Band,equation_flag)

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
path=get(handles.path,'String');
axes(handles.axes2)
cla reset
equation_flag=get(handles.popupmenu1,'value')
Band=str2num(get(handles.Band,'String'));

[Y Y2 PSA period T lat lon vs30 RBP Rjb nm FABA]=rdspectrum(path,ang,equation_flag,Band);

h=loglog(period,smooth(Y),'b','linewidth',5)
hold on
h=loglog(period,smooth(Y2),'r','linewidth',5);
hold on
h=loglog(T,smooth(PSA),'k','linewidth',5);

Error_text=strcat('vs30: ',' ',num2str(vs30,'%4.0f'),'m/s')
text('Units','normalized','position',[0.55,0.30],'string',Error_text,'fontsize',10,'HorizontalAlignment','center','Fontweight','bold')
set(gca,'fontsize',10,'Fontweight','bold')
Error_text2=strcat('Rbp: ',' ',num2str(RBP/1000,'%4.0f'),'km')
text('Units','normalized','position',[0.55,0.18],'string',Error_text2,'fontsize',10,'HorizontalAlignment','center','Fontweight','bold')
Error_text3=strcat(nm)
text('Units','normalized','position',[0.55,0.42],'string',Error_text3,'fontsize',10,'HorizontalAlignment','center','Fontweight','bold')
Error_text4=strcat('Rjb: ',' ',num2str(Rjb/1000,'%4.0f'),'km')
text('Units','normalized','position',[0.55,0.06],'string',Error_text4,'fontsize',10,'HorizontalAlignment','center','Fontweight','bold')
xlim([0.1 10])
ylim([0.01 10000])
set(gcf,'color','white','paperpositionmode','auto');
box on
set(gca,'xtick',[0.1 0.2 0.5 1 2 4 6 8 10])
set(gca,'ytick',[0.01 0.1 1 10 100 1000 10000]);
axes(handles.axes1)
cla reset
if FABA==1
    plot(handles.axes1,lon,lat,'ro');
else
    plot(handles.axes1,lon,lat,'bo');
    
end
hold on
axis([130 146 30 46])
load japan_coastline.dat;
plot(handles.axes1,japan_coastline(:,1),japan_coastline(:,2),'k');
x=[43.59 42.97 41.48 38.32 36.75 36.1 34.98 33.06];
y=[145.3 141.2  141.1 140.6 139.7 138.5 139.1 139.8];

for loopt=1:10
    n=1;
    for i=1:length(x)
        xx(n)=x(i);
        yy(n)=y(i);
        if i<length(x)
            xx(n+1)=(x(i)+x(i+1))/2;
            yy(n+1)=(y(i)+y(i+1))/2;
        end
        n=n+2;
    end
    y=yy;
    x=xx;
end

lat0=str2num(get(handles.lat0,'String'));
lon0=str2num(get(handles.lon0,'String'));

plot(handles.axes1,lon0,lat0,'rp');

plot(handles.axes1,yy,xx,'g--');


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in Update_Rrup.
function Update_Rrup_Callback(hObject, eventdata, handles)
% hObject    handle to Update_Rrup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
path=get(handles.path,'String');
Band=str2num(get(handles.Band,'String'));
limit=str2num(get(handles.limit,'String'));

changeRrup(path,Band,limit)

% --- Executes on button press in Update_RBP.
function Update_RBP_Callback(hObject, eventdata, handles)
% hObject    handle to Update_RBP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
path=get(handles.path,'String');
Band=str2num(get(handles.Band,'String'));

changeRBP(path,Band)


% --- Executes on button press in limit.
function limit_Callback(hObject, eventdata, handles)
% hObject    handle to limit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of limit


% --- Executes during object creation, after setting all properties.
function limit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to limit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in Summary.
function Summary_Callback(hObject, eventdata, handles)
% hObject    handle to Summary (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Plot_flag=get(handles.popupmenu2,'value')
equation_flag=get(handles.popupmenu1,'value')

path=get(handles.path,'String');
dislimit=1000;
if Plot_flag==1
Finalplot(path,dislimit,equation_flag);
Finalplot2(path,dislimit,equation_flag);
elseif Plot_flag==2
   Finalplot_B2(path,dislimit,equation_flag);
Finalplot2_B2(path,dislimit,equation_flag); 
    
else
    fprintf('error')
end

% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
