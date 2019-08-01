clear all
close all
load worldcoast.dat
addpath /home/tian_feng/Workspace/GMPE_BP/lib/
dirname=['Japan_2011_03_11'   
    'Japan_2003_09_26'
    'Japan_2005_08_16'
    'Chile_2015_09_16'
    'Chile_2014_04_01'
    ]
range=[2.1 1.6 0.59 0.9 1.3 ]
figure
set(gcf,'Position',[10,10,1250,1000],'color','w')
   % hha=tight_subplot(2,3,[0.01 0.05 ],[0.05 0.05 ],[0.05 0.05])
load /home/tian_feng/Workspace/GMPEfig/trench.txt
load /home/tian_feng/Workspace/GMPEfig/trench_Japan.txt
for i=1:5
    subplot(2,3,i)
    plot(trench(:,1),trench(:,2),'k:','linewidth',1.8);
     hold on
        a7= plot(trench_Japan(:,1),trench_Japan(:,2),'k:','linewidth',1.8);

        %axes(hha(i))

path=strcat('/home/tian_feng/Workspace/',dirname(i,:),'/')
%path='/home/tian_feng/Workspace/Japan_2011_03_11/'

cd (path)
cd Input
load ../Fault/fault_data
axis equal;
hold on
A=linspace(min(fault_data(:,2)),max(fault_data(:,2)),30)';
B=linspace(min(fault_data(:,1)),max(fault_data(:,1)),30);
fault_data(:,6)=fault_data(:,6)/max(fault_data(:,6));
[X,Y,Z]=griddata(fault_data(:,2),fault_data(:,1),fault_data(:,6),A,B,'linear');
%[cs,h]=contour(X,Y,Z,[0.1,0.5,0.9],'k','ShowText','on','linewidth',2); %shading interp
%clabel(cs,h,'fontsize',16,'color','k','fontweight','bold')

[c,h]=contourf(X,Y,Z,[0.12,0.5])
plot(worldcoast(:,1),worldcoast(:,2),'k-','linewidth',1.8);

% hc=get(h,'Children');
% n=length(hc);
% v=zeros(n,1);
% s=zeros(n,1);
% for i=1:n
%     x=get(hc(i),'xdata')
%     y=get(hc(i),'ydata')
%     i=length(x)
%     s(i)=sum((x([2:1,1])-x).*(y([2:1,1])+y))/2;
%     v(i)=get(hc(i),'UserData')
%     
% end
% [v m n]=unique(v)
% s=accumarray(n,s)
%plot(fault_data(:,2),fault_data(:,1),'<')% maxslip=max(fault_data(:,6));
% AA=find(fault_data(:,6)>0.2*maxslip);
% hold on
% plot(fault_data(AA,2),fault_data(AA,1),'k^')
hold on
load 0.125_0.5.mat
data.pw2=data.pw2/max(data.pw2);
a1=scatter(data.lon,data.la,data.pw2*30,'c')
hold on
load 0.25_1.mat
data.pw2=data.pw2/max(data.pw2);
a2=scatter(data.lon,data.la,data.pw2*30,'g')
lonmid=(min(data.lon)+max(data.lon))/2;
latmid=(min(data.la)+max(data.la))/2;
if i==5
    latmid=latmid-0.3
elseif i==4
        latmid=latmid+0.2

end
xlim([lonmid-range(i),lonmid+range(i)])
ylim([latmid-range(i),latmid+range(i)])

load 0.5_2.mat
data.pw2=data.pw2/max(data.pw2);
a3=scatter(data.lon,data.la,data.pw2*30,'m')
load 1_4.mat
data.pw2=data.pw2/max(data.pw2);
a4=scatter(data.lon,data.la,data.pw2*30,'r')

load data5.mat
a5=scatter(ret.lon0,ret.lat0,700,'kp','filled')

%[cs,h]=contour(X,Y,Z,[0.1,0.5,0.9],'k','ShowText','on','linewidth',2); %shading interp
%clabel(cs,h,'fontsize',16,'color','k','fontweight','bold')

box  on
grid on



%set(gca, 'xTick',linspace(lonmid-range(i),lonmid+range(i),2))
%set(gca, 'yTick',linspace(latmid-range(i),latmid+range(i),2))

if i==1
    name='2011 Mw 9.0 Tohoku'
elseif i==2
        name='2003 Mw 8.0 Tokachi'
elseif i==3
        name='2005 Mw 7.2 off-Miyagi'
        elseif i==4
        name='2015 Mw 8.3 Illapel'
elseif i==5
            name='2014 Mw 8.1 Iquique'

end
title(name,'fontsize',22)
set(gca,'fontsize',22,'fontweight','bold')
end
% axes(hha(6))
% axis off
% plot(,1,'^')
hh=gridLegend([ a1 a2 a3 a4 a5 h a7],1,'0.5Hz HFR','1Hz HFR','2Hz HFR','4Hz HFR','epicenter',' slip model','trench','location','east','Fontsize',18)
rect=[0.68 0.12 .20 .3]

set(hh,'Position',rect)
%legendmarkeradjust(20)

set(gcf,'color','white','paperpositionmode','auto');

%A for i= 1:5
%     limit_fault=i*0.2
% [lon,la,dep,slip]=readfault(path,limit_fault)
% plot(lon,la,'k')
% end