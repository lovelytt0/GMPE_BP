% % % %%%%%%%%%%%%%%%%%%%%%%%%%%
function Rdlogfile(path,Band,time_length,restrict)

address='/home/tian_feng/Workspace/GMPE_BP/'
addpath(strcat(address,'lib/'));addpath(strcat(address,'src/'));addpath(strcat(address,'image/'));

load japan_coastline.dat;
[fl fh]=band_select(Band);
ret.win=round(1.0/fh*20.0 );
dirname= strcat('Par',num2str(fl),'_',num2str(fh),'_',num2str(ret.win),'Dir');
logfilename=strcat(path,'Input/',dirname,'/logfile');
paraloc=strcat(path,'Input/Par',num2str(fl),'_',num2str(fh),'_',num2str(ret.win),'.mat')
load (paraloc)
ps=ret.ps;
qs=ret.qs;
lon0=ret.lon0;
lat0=ret.lat0;
uxRange=ret.latrange;
uyRange=ret.lonrange;
ux=linspace(uxRange(1)+lat0,uxRange(2)+lat0,ps);
uy=linspace(uyRange(1)+lon0,uyRange(2)+lon0,qs);


load(logfilename);
time=logfile(:,1);
la=logfile(:,5);
lon=logfile(:,6);
power=logfile(:, 7);
cd(strcat(path,'Input/',dirname))

count=0
for i=1:time_length
    filename=strcat(num2str(i),'smat.mat')
    load(filename)
    if i==1
        Pw_all=real(Pw)*0;
    end
    
         if abs(max(max(Pw)))/max(power)>0.1
    Pw_all=real(Pw)/abs(max(max(Pw)))+Pw_all;
         else
             count=count+1
         end
end
Pw=Pw_all/abs(max(max(Pw_all)));
% ncontour=15;
% figure
%      [c,ch]=contourf(uy,ux,abs(Pw),ncontour);
% colorbar()
% hold on
% plot(japan_coastline(:,1),japan_coastline(:,2),'k');
% ylim([min(ux) max(ux)]);
% xlim([min(uy) max(uy)]);
% figure
% for i=1:ps
%     for j=1:qs
%         if Pw(i,j)>0.55
%             plot(uy(j),ux(i),'r*')
%             hold on
%         end
%     end
% end
% plot(japan_coastline(:,1),japan_coastline(:,2),'k');
% ylim([min(ux) max(ux)]);
% xlim([min(uy) max(uy)]);
h12=figure(12);


set(h12, 'Position', [100, 100, 600, 600],'color','w');
set(gcf, 'PaperPositionMode', 'auto') ;
count2=0;
for i=1:50
    for j=1:50
        if Pw(i,j)<0.55%0.55
            Pw(i,j)=0.0;
        else
            count2=count2+1;
            clon(count2)=uy(j);
            clat(count2)=ux(i);
            cp(count2)=Pw(i,j);
        end
    end
end
ncontour=14
[c,ch]=contourf(uy,ux,abs(Pw),ncontour);
colorbar()
hold on
plot(japan_coastline(:,1),japan_coastline(:,2),'k');


power=power/max(power);
k=0;
for i=1:time_length
    if power(i) > restrict
        aa=0
        if i>1
        aa=distance22(la(i),lon(i),la(i-1),lon(i-1))
        end
        if aa<4
        k=k+1;
        lon2(k)=lon(i);
        la2(k)=la(i);
        pw2(k)=power(i);
        time2(k)=time(i);
        end
    end
end

data.lon=lon2;
data.la=la2;
data.pw2=pw2;
data.time2=time2;
data.clon=clon;
data.clat=clat;
data.cp=cp;
cd ../

outdir= strcat(num2str(fl),'_',num2str(fh),'.mat');
save(outdir,'data');

hold on
scatter(lon2,la2,exp(pw2*6),'r')
ylim([min(ux) max(ux)]);
xlim([min(uy) max(uy)]);

box on;
xlabel('Longitude (^o)','FontSize',15,'Fontweight','bold');
ylabel('Latitude (^o)','FontSize',15,'Fontweight','bold');
set(gca,'FontSize',15,'Fontweight','bold');
title(strcat(num2str(fl),'to',num2str(fh)));
figname2=(strcat(path,'Fig/BPpos',num2str(fl),'to',num2str(fh),'.eps'))
print(gcf,'-depsc',figname2);
figname3=(strcat(path,'Input/BPradiator',num2str(fl),'to',num2str(fh),'HZ.txt'))

fileID=fopen(figname3,'w')
for i=1:length(lon2)
    fprintf(fileID,'%f  %f %f\n',lon2(i),la2(i),pw2(i));
end

figname4=(strcat(path,'Input/BPregion',num2str(fl),'to',num2str(fh),'HZ.txt'))

fileID2=fopen(figname4,'w')
for i=1:length(clon)
    fprintf(fileID2,'%f  %f %f\n',clon(i),clat(i),cp(i));
end
cd(path)
end