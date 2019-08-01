function [filename]=setparBP(path,inputband,Band,lon0,lat0,dep,parr,over,ps,qs,lonrange,latrange)

project_ad=path;%strcat(pwd,'/')
address='/home/tian_feng/Workspace/GMPE_BP/'
addpath(strcat(address,'lib/'));addpath(strcat(address,'src/'));addpath(strcat(address,'image/'));
data_ad=strcat(project_ad,'knet/');
in_ad=strcat(project_ad,'Input/');
out_ad=strcat(project_ad,'Output/');

fileinput=strcat(path,'Input/data',num2str(inputband))

load(fileinput);
ret.lon0=lon0;
ret.lat0=lat0;
ret.dep0=dep; %Input depth
ret.parr= parr;
ret.begin= 0;
ret.end=over; %70
ret.step= 1; %0.2
ret.ps= ps;
ret.qs= qs;
ret.lonrange=lonrange;
ret.latrange= latrange;
% frequency
[fl fh]=band_select(Band)
ret.fl= fl;
ret.fh=fh;
ret.fs= 2;
ret.win=round(1.0/fh*20.0 )%40; %5, shorter window for higher frequency
% fl 0.5 fh 2 win 10
ret.dirname= strcat('Par',num2str(fl),'_',num2str(fh),'_',num2str(ret.win));
ret.Nw= 0.5;
filename=strcat(path,'Input/',ret.dirname,'.mat')
save(filename,'ret','-v7.3');
end