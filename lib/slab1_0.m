load ('home/tian_feng/Workspace/GMPE_BP/src/sam_slab1.0_clip.xyz')
a=sam_slab1_0_clip;
% figure
% plot3(a(:,1),a(:,2),a(:,3))
n=0
for i=1:length(a(:,3)) 
    if isnan(a(i,3))
    else
        n=n+1;
        slab.lon(n)=a(i,1);
        slab.lat(n)=a(i,2);
        slab.dep(n)=a(i,3);
    end
end
save('../src/slab_sam.mat','slab')
% [mm nn]=min(distance22(lat,lon,40,140))
% 
% Out=dep(nn)
% hold on
% plot3(lon(nn),lat(nn),dep(nn),'*')
