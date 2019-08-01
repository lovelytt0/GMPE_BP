clear all
close all
load outhyp2.mat
la=38.10
lo=142.86

figure
subplot(1,3,1)
scatter(ret.lon,ret.lat,12,log10(ret.Observe),'filled')
title('Observed PSA')
load japan_coastline.dat;
hold on
plot(japan_coastline(:,1),japan_coastline(:,2),'-.k','linewidth',1);
ylim([32 46])
xlim([132 146])
hold on
colorbar()
caxis([0,3.2])

plot(lo,la,'rp','Markersize',10,'MarkerFaceColor','y')   
set (gca,'fontsize',15,'Fontweight','bold')
colormap('jet')

box on
subplot(1,3,2)

scatter(ret.lon,ret.lat,12,log10(ret.Predict),'filled')
title('Predicted PSA')
hold on
plot(japan_coastline(:,1),japan_coastline(:,2),'-.k','linewidth',1);
ylim([32 46])
xlim([132 146])
hold on
colorbar()
caxis([0,3.2])
colormap('jet')

plot(lo,la,'rp','Markersize',10,'MarkerFaceColor','y')   

box on

set (gca,'fontsize',15,'Fontweight','bold')



 subplot(1,3,3)
scatter(ret.lon,ret.lat,12,log10(ret.Observe)-log10(ret.Predict),'filled')
title('Residual')
hold on
plot(japan_coastline(:,1),japan_coastline(:,2),'-.k','linewidth',1);
ylim([32 46])
xlim([132 146])
hold on
colorbar()
colormap('jet')
box on
set (gca,'fontsize',15,'Fontweight','bold')
caxis([-1.9,1.9])

set(gcf,'Position',[40,40,1400,350],'color','w')