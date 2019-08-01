clear all;
close all;
load worldcoast.dat;
la=38.2013;
lon=142.1143;
figure(1)
 plot(worldcoast(:,1),worldcoast(:,2),'k');
hold on;
plot(lon,la,'p');
hold on;
figure(2)
 plot(worldcoast(:,1),worldcoast(:,2),'k');
hold on;
plot(lon,la,'p');
hold on;
n=240
for ii=2:5
 switch ii
       case 1
        fl=0.05;
        fh=0.25;
        restrict=0.95;
       case 2
         fl=0.125;
        fh=0.5; 
                restrict=0.95
         case 3
         fl=0.25;
        fh=1;         
                restrict=0.95
         case 4
         fl=0.5;
        fh=2; 
                restrict=0.95
         case 5
         fl=1;
        fh=4; 
                restrict=0.95;
    otherwise 
           fprintf('error');
 end
 figure(1)
 chain=strcat(num2str(fl),'-',num2str(fh),'HZ','.mat');
 load (chain);
lon=data.lon(1:n);
la=data.la(1:n);
power=data.power(1:n)/max(data.power);
k=0;
for i=1:n
    if power(i)>restrict
        k=k+1;
        lon2(k)=lon(i);
        la2(k)=la(i);
        pw2(k)=power(i);
    end
end
switch ii
    case 1
plot(lon,la,'ko');
hold on;    
    case 2
plot(lon,la,'bo');
hold on;   
    case 3
plot(lon,la,'go');
hold on;   
    case 4
plot(lon,la,'yo');
hold on;    
    case 5
plot(lon,la,'ro');
hold on;
end
xlim([138 150]);
ylim([30 50]);
legend('coastline','0.05-0.25','0.125-0.5','0.25-1','0.5-2','1-4')


figure(2)
hold on;
switch ii
    case 1
plot(lon2,la2,'ko');
hold on;    
    case 2
plot(lon2,la2,'bo');
hold on;   
    case 3
plot(lon2,la2,'go');
hold on;   
    case 4
plot(lon2,la2,'yo');
hold on;    
    case 5
plot(lon2,la2,'ro');
hold on;
end
xlim([138 150]);
ylim([30 50]);
legend('coastline','0.05-0.25','0.125-0.5','0.25-1','0.5-2','1-4')

data.lon=lon2;
data.la=la2
 chain=strcat(num2str(fl),'-',num2str(fh),'HZ_0.95','.mat');
save(chain,'data')
clear lon2; clear la2; clear pw2;clear data;
% figure(2)
% %semilogy(power,'^')
% plot(power)
% 
% hold on
%[pks locs  width Prominence]=findpeaks(power,'MinPeakProminence',0.1,'Annotate','extents','MinPeakDistance',4,'MinPeakWidth',0.1);

% plot(locs, pks,'*')\

end

