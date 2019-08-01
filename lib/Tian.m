function varargout = Tian(varargin)
% TIAN MATLAB code for Tian.fig
%      TIAN, by itself, creates a new TIAN or raises the existing
%      singleton*.
%
%      H = TIAN returns the handle to a new TIAN or the handle to
%      the existing singleton*.
%
%      TIAN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TIAN.M with the given input arguments.
%
%      TIAN('Property','Value',...) creates a new TIAN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Tian_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Tian_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Tian

% Last Modified by GUIDE v2.5 23-Jan-2018 22:21:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Tian_OpeningFcn, ...
                   'gui_OutputFcn',  @Tian_OutputFcn, ...
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


% --- Executes just before Tian is made visible.
function Tian_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Tian (see VARARGIN)

% Choose default command line output for Tian
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Tian wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Tian_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Main_flag.
function Main_flag_Callback(hObject, eventdata, handles)
% hObject    handle to Main_flag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Main()

% --- Executes on button press in BP_flag.
function BP_flag_Callback(hObject, eventdata, handles)
% hObject    handle to BP_flag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Page1()

% --- Executes on button press in GMPE_flag.
function GMPE_flag_Callback(hObject, eventdata, handles)
% hObject    handle to GMPE_flag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Page2()