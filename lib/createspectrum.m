function createspectrum(path,Band,equation_flag)

%path='/home/tian_feng/Workspace/Japan_2011_03_11/'
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
% logfilename=strcat(path,'Output/',dirname);
% 
% 
% load(logfilename);
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
    
    switch  i
        case 1
                RBP1=ret.BPshort;
        case 2
                RBP2=ret.BPshort;
        case 3
                RBP3=ret.BPshort;
        case 4
                RBP4=ret.BPshort;
    end
end

    Mw=9.0;
    Rjb1=ret.Rjb;
    Rrup1=ret.FD;
    FABA1=ret.FABA;
    vs301=ret.vs30;



% [lista]=find (abs(ret.Predict_BP-ret.Observe_BP)<2)
% [listb]=find (abs(ret.BPshort)<200000)
% listc=intersect(lista,listb)
set(gcf,'Position',[10,10,1000,800],'color','w');
cd (data_ad);
%ha=tight_subplot(2,2,[0.05 0.05 ],[0.05 0.05 ],[0.1 0.05])
     a2= [12 89 194 227  315 364 ]

for hh=1:length(ret.lon)
    %[177 638  193 97]
    station_num=hh%lista(5)
    %179 101 131 638 29 38 97 177 193
    % 394 iwate
    station=strcat(ret.nm(station_num,:),'103111446.')
    % station='TCG0141103111446.'
    
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
    Data{1}=data
    [Data]=pad0(Data,Info );
    
    
    data=Data{1}
    
    for i=1:300
        T(i)=1.02^(i-180)
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
    

    
%     for i=3:23
%         [Y(i) Fs(i) period(i)]=Boore_Rjb(Rjb/1000,Mw,vs30,i);
%         [Y2(i) Fs2(i) period(i)]=Boore_Rjb(RBP/1000,Mw,vs30,i);
%         
%         Y(i)=Y(i)/exp(Fs(i))
%         Y2(i)=Y2(i)/exp(Fs2(i))
%         
%     end
period=[   0.1000   0.1500    0.2000    0.2500    0.3000    0.4000    0.5000    0.6000   0.7500    1.0000    1.5000    2.0000    2.5000    3.0000    4.0000    5.0000  6.0000 7.5000 10.0000];
    for i=1:length(period)
      if period(i)<=0.25
    RBP=RBP4(station_num);
elseif period(i)<=0.5
    RBP=RBP3(station_num);
elseif period(i)<=1
    RBP=RBP2(station_num);
else
    RBP=RBP1(station_num);
      end  
Rrup=Rrup1(station_num);
Rjb=Rjb1(station_num);
FABA=FABA1(station_num);
vs30=vs301(station_num);
        if equation_flag==1
             Y(i) =BC_hydro(Rrup,Mw,FABA,vs30,period(i));
            Y2(i) =BC_hydro(RBP/1000.0,Mw,FABA,vs30,period(i));
       elseif equation_flag==2
        [Y(i) Fs(i) ]=Boore_Rjb(Rjb/1000.0,Mw,FABA,vs30,period(i));
        [Y2(i) Fs2(i) ]=Boore_Rjb(RBP/1000.0,Mw,FABA,vs30,period(i));
        Y(i)=Y(i)/exp(Fs(i));
        Y2(i)=Y2(i)/exp(Fs2(i));
       else
           fprintf('No equation selected!');
        end
        
    end
    
    
figure
%     if hh==1
%     p=[0.5 1.8 2.5 8]
%     elseif hh==2
%         p=[0.02 0.4 0.7 5]
%     elseif hh==3
%           p=[0.45 5 5.5 10]
% 
%     else
%         p=[0.02 0.45 1.5 5]
% 
%         end
    

    loglog(period,smooth(Y/980),'b','linewidth',5)
    hold on
    loglog(period,smooth(Y2/980),'r','linewidth',5)
    hold on
     loglog(T,smooth(PSA/980),'k','linewidth',5)

%     x2=[p(1) p(2) p(2) p(1)]
%     y2=[0.01 0.01 100 100]
%     patch(x2,y2,'c','facealpha',0.3,'linestyle','none')
%     hold on
%      x1=[p(3) p(4) p(4) p(3)]
%     y1=[0.01 0.01 100 100]
%     patch(x1,y1,'y','facealpha',0.3,'linestyle','none')
    
    %Error_text=strcat('vs30: ',' ',num2str(vs30,'%4.0f'),'m/s');
    %text('Units','normalized','position',[0.55,0.30],'string',Error_text,'fontsize',20,'HorizontalAlignment','center','Fontweight','bold');
    set(gca,'fontsize',24,'Fontweight','bold');
    Error_text2=strcat('Rbp: ',' ',num2str(RBP2/1000.0,'%4.0f'),'km');
    text('Units','normalized','position',[0.55,0.18],'string',Error_text2,'fontsize',20,'HorizontalAlignment','center','Fontweight','bold');
      Error_text3=strcat(nm);
    text('Units','normalized','position',[0.15,0.87],'string',Error_text3,'fontsize',20,'HorizontalAlignment','center','Fontweight','bold');
    Error_text4=strcat('Rrup: ',' ',num2str(Rrup,'%4.0f'),'km');
    text('Units','normalized','position',[0.55,0.06],'string',Error_text4,'fontsize',20,'HorizontalAlignment','center','Fontweight','bold');
       
    %xlim([0.01 5])
    xlim([0.1 10]);
    ylim([0.001 10]);
    set(gcf,'color','white','paperpositionmode','auto');
    box on;
    set(gca,'xtick',[0.1  0.5  2 10]);
    set(gca,'ytick',[  0.001 0.01 0.1 1 10 ]);

%     set(ha(1:2),'XTickLabel','')
%     set(ha([2,4]),'YTickLabel','')
    figname=strcat(path,'/spectrum/Six/B',num2str(Band),'_N',num2str(station_num),'.png')
    print(gcf,'-dpng',figname);
    clear data
    st_lat(hh)=lat
    st_lon(hh)=lon
    close all
end
% rect=[0.45 0.45 .15 .05]
% h=legend('Rjb','Rbp','data','Rbp zone','Rjb zone');
% set(h,'Position',rect)

% figure
% plot(st_lon,st_lat,'*')
% load japan_coastline.dat;
% hold on
%  plot(japan_coastline(:,1),japan_coastline(:,2),'-.k','linewidth',1);
%     ylim([32 46])
%     xlim([132 146])

end