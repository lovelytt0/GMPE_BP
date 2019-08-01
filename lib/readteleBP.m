
function readteleBP(path,lon0,lat0,sr,display,Preshift,plotscale)

project_ad=path;
address='/home/tian_feng/Workspace/GMPE_BP/'
addpath(strcat(address,'lib/'));addpath(strcat(address,'src/'));addpath(strcat(address,'image/'));
data_ad=strcat(project_ad,'knet/');
in_ad=strcat(project_ad,'Input/');
out_ad=strcat(project_ad,'Output/');

opr=readAllSac();
opr.bpbool=false;
opr.lon0=lon0;
opr.lat0=lat0;
opr.bp=[0.01 2];
opr.snrFilterbool=false;
opr.ori=300;
opr.snrFilter=[0.1 0.1 2 -20 -10 100 130];
opr.sr=sr%10;
datalog=strcat(path,'Data/')
ret=readAllSac(datalog,opr);
%
ret.xori=ret.x;
%save('data','ret','-v7.3');

load ptimes;
[n m]=size(ret.x);
fprintf ('size of data %f %f',n,m)
I=2:8;
figure(1);
plotSta(ret);
%
load ptimes
if Preshift==1
    shift=interp1(rr,tt,ret.rdis);
    for i=1:n
        ret.x(i,:)=specshift(ret.x(i,:),ret.sr*(shift(i)-shift(1)));
    end
end
ret.xori=ret.x;
fl=0.1;
fh=0.5;
[BB,AA]=butter(4,[fl fh]/(ret.sr/2));
for i=1:n
    ret.x(i,:)=filter(BB,AA,ret.x(i,:));
end
ret.x=ret.x(:,1:display*ret.sr)
for i=1:n
    ret.x(i,:)=ret.x(i,:)/std(ret.x(i,10*ret.sr:display*ret.sr));
    ret.xori(i,:)=ret.xori(i,:)/std(ret.xori(i,10*ret.sr:display*ret.sr));
end
ret.scale=plotscale;
ret.lt=300;
ret.ht=350;
% [delete_num delete_i]=size(ret.nm);
% delete_c=[19:55,1];
% B=delete_a(delete_num,delete_c');
% ret=orderAll(ret,0,B);
figure(10);
plotAll1(ret);
filename=strcat(path,'Input/data0')
save(filename,'ret','-v7.3');
end