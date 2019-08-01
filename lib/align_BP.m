function align_BP(path,Band,ts11,refst,cutoff,plotscale)

project_ad=path;%strcat(pwd,'/')
address='/home/tian_feng/Workspace/GMPE_BP/'
addpath(strcat(address,'lib/'));addpath(strcat(address,'src/'));addpath(strcat(address,'image/'));
data_ad=strcat(project_ad,'knet/');
in_ad=strcat(project_ad,'Input/');
out_ad=strcat(project_ad,'Output/');

filename=strcat(path,'Input/data',num2str(Band-1))
load(filename);
[fl fh win range]=alignband(Band);
ret.x=ret.xori;
load ptimes;

% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[n m]=size(ret.x);

[BB,AA]=butter(4,[fl fh]/(ret.sr/2));
for i=1:n
    ret.x(i,:)=filter(BB,AA,ret.x(i,:));
end

align=seismoAlign();
align.ts11=ts11;% aligned time start from straight one
align.win=win;
align.lt=400;%no change
align.range=range% upper limitation
align.refst=refst;% first not zero, anyone is ok
align.cutoff=cutoff;
ret=seismoAlign(ret,align);%!!!!!!!important!!!!

ret.scale=plotscale;%no change
ret.lt=300;% no change
ret.ht=350;%no change  above 3 lines for plotting

figure(10);
plotAll1(ret);
filename=strcat(path,'Input/data',num2str(Band))

save(filename,'ret','-v7.3');
end