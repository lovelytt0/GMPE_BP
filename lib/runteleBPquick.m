function runBPquick(path,BPfile)
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load ptimes;

tlib=zeros(n,ps,qs);

for p=1:ps
    
    for q=1:qs
        
              sd=phtime(fl,lat0,lon0,ux(p),uy(q),r(:,2),r(:,1),rr,tt)';
   
        tlib(:,p,q)=sd-mean(sd);
    end
end
%%%%%%%%%%%%%%%%%%%%%%%
        Pm=zeros(ps,qs);      
        Pm1=zeros(ps,qs); 
for tl=parr+begin:step:parr+over
    
 
        th=tl+win;
        display(['t=' num2str(tl-parr-begin) 's']);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                  y=zeros(n,win*sr);
%                   y0=zeros(n,2*win*sr);

            for p=1:ps
                
                for q=1:qs
                     sd=tlib(:,p,q)';

                    for k=1:n
                           y(k,:)=x0(k,floor((tl+sd(k))*sr):floor((tl+win+sd(k))*sr-1));
                           
%                         y0(k,:)=specshift(x0(k,(tl-1/2*win)*sr:(tl+3/2*win)*sr-1),sd(k)*sr);
%                         y(k,:)=y0(k,1/2*win*sr:3/2*win*sr-1);%/std(y(k,tl*sr:tl*sr+windowLength*sr-1));
                    end
                    Pm(p,q)=sum(sum(y(:,:),1).^2);
%                        mati=corrcoef(y');
%                     Pm1(p,q)=sum(sum(mati));
                end
            end
            tmp1=peakfit2d(real(Pm));
          
            bux=interp1(1:length(ux),ux,tmp1(1));
            buy=interp1(1:length(uy),uy,tmp1(2));
            maxp=interp2(1:ps,1:qs,Pm',tmp1(1),tmp1(2),'linear',0);
            %maxp1=max(Pm(:));
            disp(['bm bux ' num2str(tmp1(1)) ' buy ' num2str(tmp1(2)) ' max ' num2str(maxp)]);
            
            Pw=Pm;
             fprintf(fileID,'%f %f %f %f  %f %f %f\n',tl,bux,buy,maxp,bux,buy,maxp);
             save ([  num2str(tl-parr-begin) 'smat'],'Pw');

end
fclose(fileID);
%rmfield(ret,'xori');
save('parret','ret','-v7.3');
        
