function  changeRBP(path,n_f)

out_ad=strcat(path,'Output/');
in_ad=strcat(path,'Input/');

[fl fh]=band_select(n_f);
load('/home/tian_feng/Workspace/GMPE_BP/src/slab.mat')
retname=strcat('last',num2str(fl),'_',num2str(fh),'_P1','.mat');
load(strcat(out_ad,retname));
fprintf(retname)
fprintf('\n')

% Read Back Projection Chain
chain2=strcat(in_ad,num2str(fl),'_',num2str(fh),'.mat');
load (chain2);
chainlon2=data.lon%142.498-142.68;
chainla2=data.la%38.2963-38.19;
lat=ret.lat;
lon=ret.lon;
for i=1:length(ret.lon)
    for k=1:length(chainlon2)
        [s2(k),az2(k),reaz2(k)] = vdist(chainla2(k),chainlon2(k),lat(i),lon(i));
    end
    [m n]=min(s2);
    [mm nn]=min(distance22(slab.lat,slab.lon,chainla2(n),chainlon2(n)));
    dep_BP=(slab.dep(nn))*1000;
%     if n==54||n==113||n==114||n==137||n==148
%     dep_BP=10*1000
%     end
    BPshort(i)=(s2(n)^2+(dep_BP)^2)^0.5;
    clear s2;
end
ret.BPshort=BPshort;
save(strcat(out_ad,retname),'ret');
cd (path)
fprintf('Updated\n')
end