function [filename]=setparBP(path,inputband,Band,lon0,lat0,dep,parr,over,ps,qs,lonrange,latrange)

project_ad=path;%strcat(pwd,'/')
address='/home/tian_feng/Workspace/GMPE_BP/'
addpath(strcat(address,'lib/'));addpath(strcat(address,'src/'));addpath(strcat(address,'image/'));
data_ad=strcat(project_ad,'knet/');
in_ad=strcat(project_ad,'Input/');
out_ad=strcat(project_ad,'Output/');

fileinput=strcat(path,'Input/data',num2str(inputband))
load(fileinput);
%

load ./Input/match2;
lon=ret.lon';
lat=ret.lat'
 LaBP=match2.La1
 LoBP=match2.Lo1
 LaJMA=match2.La2
 LoJMA=match2.Lo2
lat_c=LaJMA;
lon_c=LoJMA;
lat_ap=LaBP;
lon_ap=LoBP;

%
lat0=ret.lat0
lon0=ret.lon0%JMA
dep0=29;
dep1=29;
for i=1:length(lon)
rdis(i)=distance22(lat0,lon0,lat(i),lon(i));
end
indsta=find(rdis<90);
lat=lat(indsta);
lon=lon(indsta);
Ptimesdepth=load('Ptimesdepth.mat');
rr=Ptimesdepth.dis;
dd=Ptimesdepth.dep;
tt=Ptimesdepth.Ptt;
disM=[]
nf=length(lon_ap);
nn=length(lat);
for i=1:nf
dx(i)= 111.195*(lat0-lat_c(i));%NS direction
dy(i)=111.195*(lon0-lon_c(i))*cosd((lat0+lat_c(i))/2);
disM=[disM;dx(i) dy(i)];
sd(i,:)=phtime2d(lat_ap(i),lon_ap(i),dep0,lat_c(i),lon_c(i),dep1,lat,lon,rr,dd,tt)';% P along ray path
data(i).Mx=[];
data(i).My=[];
data(i).y=[];
end

for j=1:nn
data1(j).M=disM;    
data1(j).y=sd(:,j)-sd(:,1);
ds(:,j)=data1(j).M\data1(j).y;
err(j)=sum((data1(j).y-data1(j).M*ds(:,j)).^2)/nf;
end
[latc,IA,IB]=intersect(ret.lat',lat);
ret=orderAll(ret,0,IA);
ret.dsx=ds(1,IB);

ret.dsy=ds(2,IB);





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