function runBPmusic(path,BPfile)
project_ad=path
address='/home/tian_feng/Workspace/GMPE_BP/'
addpath(strcat(address,'lib/'));addpath(strcat(address,'src/'));addpath(strcat(address,'image/'));
data_ad=strcat(project_ad,'knet/');
in_ad=strcat(project_ad,'Input/');
out_ad=strcat(project_ad,'Output/');
load(BPfile)
load ptimes;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x0=ret.xori;
r=ret.r;
lon0=ret.lon0;
lat0=ret.lat0;
dep0=ret.dep0;
sr=ret.sr;
parr=ret.parr;
begin=ret.begin;
over=ret.end;
step=ret.step;
ps=ret.ps;
qs=ret.qs;
uxRange=ret.latrange;
uyRange=ret.lonrange;
fl=ret.fl;
fh=ret.fh;
win=ret.win;
dirname=ret.dirname;
Nw=ret.Nw;
fs=ret.fs;
%%%%%%%%%%%%%%%%%%%%%%%

[n m]=size(x0);
ux=linspace(uxRange(1)+lat0,uxRange(2)+lat0,ps);
uy=linspace(uyRange(1)+lon0,uyRange(2)+lon0,qs);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd(in_ad)
fprintf dirname
saveDir=[dirname 'Dir'];
system(['mkdir ' saveDir]);
cd(saveDir);
fileID=fopen('logfile','w');

rmfield(ret,'xori');
save('parret','ret');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[BB,AA]=butter(4,[fl fh]/(sr/2));
for i=1:n
    
    x0(i,:)=filter(BB,AA,x0(i,:));
end
for i=1:n 
        x0(i,:)=x0(i,:)/std(x0(i,parr*ret.sr:(parr+30)*ret.sr));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if isfield(ret,'pP')
	Ptimesdepth=load('pPtimesdepth.mat');
else
Ptimesdepth=load('Ptimesdepth.mat');
end
rr=Ptimesdepth.dis;
dd=Ptimesdepth.dep;
tt=Ptimesdepth.Ptt;
tlib=zeros(n,ps,qs);

for p=1:ps
    
    for q=1:qs
        
              sd=phtime2d(lat0,lon0,dep0,ux(p),uy(q),dep0,r(:,2),r(:,1),rr,dd,tt)';% along ray path
   
        tlib(:,p,q)=sd-mean(sd);
    end
end
%%%%%%%%%%%%%%%%%%%%%%%

for tl=parr+begin:step:parr+over
    
    
    th=tl+win;        
    display(['t=' num2str(tl-parr-begin) 's']);


    Pm=zeros(ps,qs);
    Pw=zeros(ps,qs);

    S=cmtmall(x0(:,tl*sr:th*sr-1),Nw);
    s=linspace(0,sr-sr/((th-tl)*sr),(th-tl)*sr);
    fli=round(interp1(s,1:length(s),fl));
    fhi=round(interp1(s,1:length(s),fh));
    for i=fli:fs:fhi

        s(i)
        Pm1=zeros(ps,qs);
        Pw1=zeros(ps,qs);
        clear Uv A Un a wi;
        Rxx=zeros(n,n);
        for j=1:n
            for k=1:n
                Rxx(j,k)=S(i,j,k);
            end
        end
        [Uv,A]=eig(Rxx);
        As=zeros(n,n);
        un=zeros(n,n);
        us=zeros(n,n);
        M=rank(Rxx);
        
        
        
        un(:,1:n-M)=Uv(:,1:n-M);
        
        Un=un*un';
        for p=1:ps
            
            for q=1:qs
                
                a=exp(-1i*2*pi*s(i)*tlib(:,p,q));
                Pm1(p,q)=((a'*a)/(a'*Un*a));
                Pw1(p,q)=((a'*Rxx*a)/(a'*a));
            end
        end
        
        Pm=Pm+Pm1;
        Pw=Pw+Pw1;
        
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
           tmp1=peakfit2d(real(Pm));
            bux=interp1(1:length(ux),ux,tmp1(1));
            buy=interp1(1:length(uy),uy,tmp1(2));
            maxp=interp2(1:ps,1:qs,Pm',tmp1(1),tmp1(2),'linear',0);
            
             tmp2=peakfit2d(real(Pw));
            bux2=interp1(1:length(ux),ux,tmp2(1));
            buy2=interp1(1:length(uy),uy,tmp2(2));
            maxp2=interp2(1:ps,1:qs,Pw',tmp2(1),tmp2(2),'linear',0);
            
            disp(['bm bux ' num2str(tmp2(1)) ' buy ' num2str(tmp2(2)) ' max ' num2str(maxp2)]);

         fprintf(fileID,'%f %f %f %f %f %f %f\n',tl,bux,buy,maxp,bux2,buy2,maxp2);

        save ([  num2str(tl-parr-begin) 'smat'],'Pm','Pw');

end
rmfield(ret,'xori');
save('parret','ret');
end