function movieBP_tian(i,handles)
path=get(handles.path,'String');

load japan_coastline.dat;
lonup=str2num(get(handles.lonup,'String'));
londown=str2num(get(handles.londown,'String'));
latup=str2num(get(handles.latup,'String'));
latdown=str2num(get(handles.latdown,'String'));
lonrange=[londown lonup];
latrange=[latdown latup];
lon0=str2num(get(handles.lon0,'string'));
lat0=str2num(get(handles.lat0,'string'));
        filename=strcat(num2str(i),'smat.mat')
        ux=linspace(uxRange(1)+lat0,uxRange(2)+lat0,ps);
uy=linspace(uyRange(1)+lon0,uyRange(2)+lon0,qs);
    load(filename)
    ncontour=14
     [c,ch]=contourf(uy,ux,abs(Pw),ncontour);
    colorbar()
    hold on
     plot(japan_coastline(:,1),japan_coastline(:,2),'k');

    



end