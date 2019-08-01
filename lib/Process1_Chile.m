%******************************************************************************%
% This code is used to read K-NET data and VS30 Correction Calculate distance PGA, Psa            %
% Modified by Tian on 11/03/2017                                                                                                               %
%******************************************************************************%
function Process1(path,n_f,lat0,lon0,dep,limit_fault)
project_ad=path;
address='/home/tian_feng/Workspace/GMPE_BP/'
addpath(strcat(address,'lib/'));addpath(strcat(address,'src/'));addpath(strcat(address,'image/'));
data_ad=strcat(project_ad,'knet/');
in_ad=strcat(project_ad,'Input/');
out_ad=strcat(project_ad,'Output/');
load('/home/tian_feng/Workspace/GMPE_BP/src/slab_sam.mat')

%********************************************************************************
%sample_period=0.01;% sample rate for the accerleration data
damp=0.05; % damp rate

%*******************************************************************************
% PART 1  Read K-NET DATA
%*******************************************************************************

% BP  band selection
[fl fh]=band_select(n_f);
T=1/fl/2;
% Read Back Projection Chain
chain2=strcat(in_ad,num2str(fl),'_',num2str(fh),'.mat');
load (chain2);
chainlon2=data.lon;
chainla2=data.la;
% event information

eventlat=lat0;
eventlon=lon0;
eventdep=dep;
%****************************************************************
cd(data_ad);
% list all the station data
d(:,1)=dir('*HNE.txt');
d(:,2)=dir('*HNN.txt');
d(:,3)=dir('*HNZ.txt');
fprintf( '  Start reading\n  Start reading\n');
flagChile=999;
if  strcmp(path,'/home/tian_feng/Workspace/Chile_2014_04_01/')

flagChile=2;
elseif  strcmp(path,'/home/tian_feng/Workspace/Chile_2015_09_16/')

    flagChile=1;
else
    'error'
end
for i=1:length(d(:,1))
    clear data;
    for j=1:3
        [data(:,j),Info(i)]=readChile(d(i,j).name,flagChile) ;
        data(:,j)=data(:,j)-mean(data(:,j));
    end
    Data{i}=data;
    lon(i,:)=Info(i).Station.longitude;
    lat(i,:)=Info(i).Station.latitude;
    sample_period(i)=1.0/Info(i).SampleFrequency;
    r(i,3)=0;%Info(i).Station.height/1000;%change into UNIT km
end

% Site (volcano arc)

x=[-17.38 -20.25 -22.54 -22.96 -24.08 -26.84 -33.25 -35.48 -37.27 -37.77];
y=[-69.75  -68.55 -67.85 -67.68 -68.27 -68.49 -69.80 -70.71  -71.33 -71.44];

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

for i=1:length(lat)
    [ a I]=min(abs(x(:)-lat(i)));
    if y(I)-lon(i)<0.0
        FABA(i)=1;
    else
        FABA(i)=0;
    end
end
clear a;
clear I;
%*********************************************************************************
%                                                             Calculate Distance
%*********************************************************************************
%*********************************************************************************
%                                                                 BP distance
%*********************************************************************************

for i=1:length(Info)
    % Epi distance
    [Ed(i) AZ(i) BZ(i)]=vdist(eventlat,eventlon,lat(i),lon(i));
    % Hypo distance
    Hyp(i)=(Ed(i)^2+(eventdep*1000)^2)^(1/2);
    for k=1:length(chainlon2)
        [s2(k),az2(k),reaz2(k)] = vdist(chainla2(k),chainlon2(k),lat(i),lon(i));
    end
    [m n]=min(s2);
    [mm nn]=min(distance22(slab.lat,slab.lon,chainla2(n),chainlon2(n)));
    dep_BP=slab.dep(nn)*1000;
    BPshort(i)=(s2(n)^2+dep_BP^2)^0.5;
    clear s2;
end

%******************************************************************************%%
%                                                         Fault   Distance
%******************************************************************************%%
% f=load(strcat(path,'/Fault/fault_data'))
% lon_f=f(:,2);
% la_f=f(:,1);
% depth=-f(:,5);
% slip=f(:,6);

[lon_f,la_f,depth,slip]=readfault(path,limit_fault);
%*************************************************************************
%                                                         Plot Fault Figure
%*************************************************************************
%plot3(lon2, lat2,zz,'^');
% xlabel('longitude(degree)');
% ylabel('latitude(degree)');
% zlabel('depth(km)');
%-------------------------------------------------------------------------------------------------------------------------
for i=1:length(Info)  % stations
    % FD Calculation
    for j=1:length(lon_f)  % fault point
        [s1(j),az1(j),reaz1(j)] = vdist(la_f(j),lon_f(j),lat(i),lon(i));
        Rrup(j)=((s1(j)/1000)^2+depth(j)^2)^(1/2);
    end
    [mm n]=min(Rrup);
    FD(i)=Rrup(n);
    % Rjb
    [mm2 n2]=min(s1);
    Rjb(i)=s1(n2);
    % EHD Calculation
    EHD(i)=(sum(slip.*slip)/sum((slip.*slip)./(Rrup.*Rrup)))^(1/2);
end
%add zero to NA data
[Data]=pad0(Data,Info);

%******************************************************************************
% PART 2  PGA Calculation
%******************************************************************************
% construct the filter
fprintf('PGA  \n');
fprintf('PGA  \n');
%  [BB,AA]=butter(order,[fl fh]/(Info(1).SampleFrequency/2));
for i=1:length(d(:,1))
    EWori(i,:)=Data{i}(:,1)'/100;
    [EWvaluemax(i) EWlocmax(i)]=max( EWori(i,:));
    [EW_a(i) EW_v(i)  EW_d(i)]= response_spectrum(EWori(i,:)',sample_period(i),T,damp);
    %NS
    NSori(i,:)=Data{i}(:,2)'/100;
    [NSvaluemax(i) NSlocmax(i)]=max( NSori(i,:));
    [NS_a(i) NS_v(i)  NS_d(i)]= response_spectrum(NSori(i,:)',sample_period(i),T,damp);
    nm(i,:)=Info(i).Station.name;
end
cd (address);
%*******************************************************************************
% PART 3 VS30 CORRECTION
%*******************************************************************************
% match station
[nn mm]=size(nm);
fid=fopen('vs30_knet');
i=0;
while ~feof(fid)
    i=i+1;
    a_name=fgetl(fid);
    S = regexp(a_name, ',', 'split');
    a(i)=S(1);
    b(i)=S(9);
end
times=i;
for k=1:nn
     ss(k,:)=num2str(nm(k,:));
%     m=ss(k,1:6);
    vs30(k)=9999; %Estimate of Vs30 Value for stations not show on the list
%     for i=1:times
%         if strcmp(a{i},m)
%             vs30(k)=str2num( b{i});
%         end
%         
%     end
end

% Cite Correction
R=10.^(1.83-0.66*log10(vs30)); % empricial expression
EW=EWvaluemax;
NS=NSvaluemax;
% PGA, Sa, Psa!
for i=1:length(d(:,1))
    PGA(i)= (EW(i)^2+NS(i)^2)^(1/2)*100;
    PGA_vs30(i)=PGA(i)/R(i);
    SA(i)= (EW_a(i)^2+NS_a(i)^2)^(1/2)*100;
    PSA(i)=(EW_d(i)^2+NS_d(i)^2)^(1/2)*100*(2*3.14159/T)^2;
end

% remove the station without vs30;
index=find(vs30<9999)
lon(index)=[];
lat(index)=[];
nm(index,:)=[];
BPshort(index)=[];
FD(index)=[];
EHD(index)=[];
vs30(index)=[];
PGA(index)=[];
PGA_vs30(index)=[];
SA(index)=[];PSA(index)=[];
Ed(index)=[];Hyp(index)=[];
Rjb(index)=[];
%ss(index,:)=[];
FABA(index)=[];
%********************************************************************************
% PART 4  SAVE DATA
%********************************************************************************
fprintf('Save data  \n');
fprintf('Save data  \n');
ret.lon=lon;
ret.lat=lat;
ret.nm=ss;
ret.BPshort=BPshort;
ret.FD=FD;
ret.EHD=EHD;
ret.vs30=vs30;
ret.PGA=PGA;
ret.PGA_vs30=PGA_vs30;
ret.SA=SA;
ret.PSA=PSA;
ret.Ed=Ed;
ret.Hyp=Hyp;
ret.Rjb=Rjb;
ret.FABA=FABA;
retname=strcat('last',num2str(fl),'_',num2str(fh),'_P1','.mat');
save(strcat(out_ad,retname),'ret');
cd (project_ad)

fprintf('Finished Process1\n')

end