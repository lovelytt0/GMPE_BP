function [Y Y2 PSA period T lat lon vs30 RBP Rjb nm  FABA]=rdspectrum(path,station_num,equation_flag,Band)

project_ad=path;
address='/home/tian_feng/Workspace/GMPE_BP/'
addpath(strcat(address,'lib/'));addpath(strcat(address,'src/'));addpath(strcat(address,'image/'));
data_ad=strcat(project_ad,'knet/');
in_ad=strcat(project_ad,'Input/');
out_ad=strcat(project_ad,'Output/');
sample_period=0.01;% sample rate for the accerleration data
damp=0.05; % damp rate

% [fl fh]=band_select(Band);
% dirname= strcat('last',num2str(fl),'_',num2str(fh),'_P1.mat');

for i=1:4
    switch i
        case 1
            dirname='last0.125_0.5_P1.mat'
        case 2
            dirname='last0.25_1_P1.mat'
        case 3
            dirname='last0.5_2_P1.mat'
        case 4
            dirname='last1_4_P1.mat'
    end
    logfilename=strcat(path,'Output/',dirname);
     load(logfilename);
    
    switch i
        case 1
                RBP1=ret.BPshort(station_num);
        case 2
                RBP2=ret.BPshort(station_num);
        case 3
                RBP3=ret.BPshort(station_num);
        case 4
                RBP4=ret.BPshort(station_num);
    end
end

%     logfilename=strcat(path,'Output/',dirname);
%      load(logfilename);
    Mw=9.0;
    Rjb=ret.Rjb(station_num);
    Rrup=ret.FD(station_num);
%     RBP=ret.BPshort(station_num);
    FABA=ret.FABA(station_num);
    vs30=ret.vs30(station_num);


cd (data_ad);

   %lista(5)

    station=strcat(ret.nm(station_num,:),'103111446.');
    
    d(1,:)=strcat(station,'EW');
    d(2,:)=strcat(station,'NS');
    d(3,:)=strcat(station,'UD');
    
    for j=1:3
        
        [data(:,j),Info]=readKuma(d(j,:)) ;
        data(:,j)=data(:,j)-mean(data(:,j));
    end
    lon=Info.Station.longitude;
    lat=Info.Station.latitude;
    r=Info.Station.height/1000;%change into UNIT km
    Data{1}=data;
    [Data]=pad0(Data,Info );
    
    
    data=Data{1};
    
    for i=1:100
        T(i)=1.05^(i-50);
        % EW
        EWori=data(:,1)'/100;
        [EWvaluemax EWlocmax]=max( EWori);
        [EW_a EW_v  EW_d]= response_spectrum(EWori',sample_period,T(i),damp);
        %NS
        NSori=data(:,2)'/100;
        [NSvaluemax NSlocmax]=max( NSori);
        [NS_a NS_v  NS_d]= response_spectrum(NSori',sample_period,T(i),damp);
        nm=Info.Station.name;
        SA(i)= (EW_a^2+NS_a^2)^(1/2)*100;
        PSA(i)=(EW_d^2+NS_d^2)^(1/2)*100*(2*3.14159/T(i))^2;
        
    end
    

%period=[   0.0200   0.0500    0.0750  0.1000   0.1500    0.2000    0.2500    0.3000    0.4000    0.5000    0.6000   0.7500    1.0000    1.5000    2.0000    2.5000    3.0000    4.0000    5.0000  6.0000 7.5000 10.0000];
 period =[0.1  0.2 0.25 0.3 0.4 0.5 0.75 1 1.5 2 3 4 5 7.5 10]  ;
for i=1:length(period)
%       
% RBPn=[RBP1 RBP2 RBP3 RBP4];
% periodn=[2 1 0.5 0.25];
% RBP=interp1(periodn,RBPn,period(i))
% if period(i)<0.5
    RBP=RBP4
% elseif period(i)<1
%     RBP=RBP3
% elseif period(i)<2
%     RBP=RBP2
% else
%     RBP=RBP1
% end
       if equation_flag==1
             Y(i) =BC_hydro(Rrup,Mw,FABA,vs30,period(i));
            Y2(i) =BC_hydro(RBP/1000,Mw,FABA,vs30,period(i));
       elseif equation_flag==2
        [Y(i) Fs(i) ]=Boore_Rjb(Rjb/1000,Mw,FABA,vs30,period(i));
        [Y2(i) Fs2(i) ]=Boore_Rjb(RBP/1000,Mw,FABA,vs30,period(i));
        Y(i)=Y(i)/exp(Fs(i));
        Y2(i)=Y2(i)/exp(Fs2(i));
       else
           fprintf('No equation selected!');
       end
       
 end
   
end