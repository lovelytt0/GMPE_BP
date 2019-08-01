% % % %%%%%%%%%%%%%%%%%%%%%%%%%%
function GeneBP()
project_ad=strcat(pwd,'/')
% Setup the address!
address='/home/tian_feng/Workspace/GMPE_BP/'
addpath(strcat(address,'lib/'));addpath(strcat(address,'src/'));addpath(strcat(address,'image/'));
data_ad=strcat(project_ad,'knet/');
in_ad=strcat(project_ad,'Input/');
out_ad=strcat(project_ad,'Output/');

load japan_coastline.dat;
load('logfile');
time=logfile(:,1);
la=logfile(:,2);
lon=logfile(:,3);
power=logfile(:, 4);

h12=figure(12);
set(h12, 'Position', [100, 100, 600, 600]);
set(gcf, 'PaperPositionMode', 'auto') ;

cmm=colormap;
hold on;
tend=240
 t=1:1:tend;
 power_max=max(power)
for j=1:tend
        marker='s';
        scatter(lon(j),la(j),abs((power(j)))*50/power_max,time(j)-300,marker,'filled');
        data.lon(j)=lon(j);
        data.la(j)=la(j);
        data.time(j)=time(j)-300;
        data.power(j)=power(j);
end
axis equal;
c=colorbar
ylabel(c,'Time')
hold on
plot(japan_coastline(:,1),japan_coastline(:,2),'k');
ylim([min(la(1:tend))-2 max(la(1:tend))+2]);
xlim([min(lon(1:tend))-2 max(lon(1:tend))+0.5]);
colormap(cmm);
caxis([0 tend]);
xlabel('Longitude (^o)');
ylabel('Latitude (^o)');
title('0.5-2Hz');
save('0.5-2HZ.mat','data');
end