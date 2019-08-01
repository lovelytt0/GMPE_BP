function Finalplot3(path,dislimit,lat0,lon0)
project_ad=path
address='/home/tian_feng/Workspace/GMPE_BP/'
addpath(strcat(address,'lib/'));addpath(strcat(address,'src/'));addpath(strcat(address,'image/'));
data_ad=strcat(project_ad,'knet/');
in_ad=strcat(project_ad,'Input/');
out_ad=strcat(project_ad,'Output/');

load japan_coastline.dat;

figure(110)
set(gcf,'Position',[10,10,550,1000],'color','w')
hha=tight_subplot(4,2,[0.02 0.07 ],[0.15 0.05 ],[0.12 0.05])
for n_f=2:5
    [fl fh ff]=band_select(n_f)
    
    figname3=strcat(project_ad,'Output/','last',num2str(fl),'_',num2str(fh),'_','P1.mat');
    
    
    load(figname3)
    r_Rjb=log(ret.Observe_Rjb)-log(ret.Predict_Rjb);
    r_Rbp=log(ret.Observe_BP)-log(ret.Predict_BP);
    
    axes(hha((n_f-2)*2+1))
    plot(lon0,lat0,'rp')
    hold on
    
    scatter(ret.lon,ret.lat,12,r_Rbp,'filled')
    hold on
    plot(japan_coastline(:,1),japan_coastline(:,2),'-.k','linewidth',1);
    ylim([32 46])
    xlim([132 146])
    hold on
    colormap('jet')
    box on
    set (gca,'fontsize',15,'Fontweight','bold')
    caxis([-4,4])
    if n_f==2
        titlename2='Rf'
        %    title(titlename2,'FontSize',15,'Fontweight','bold');
        %        hcb=colorbar()
        
        text('Units','normalized','position',[0.12,0.88],'string',titlename2,'fontsize',18,'HorizontalAlignment','center','Fontweight','bold','color','red')
        
        %         colorTitleHandle=get(hcb,'Title');
        %         titleString='ln(Obs)-ln(Pre)'
        %         set(colorTitleHandle,'String',titleString)
    end
    
    
    ylabel(strcat(' Residual(T=',num2str(1.0/fl/2) ,'s)'),'FontSize',18,'Fontweight','bold');
    
    
    
    
    axes(hha((n_f-2)*2+2))
    plot(lon0,lat0,'rp')
    hold on
    scatter(ret.lon,ret.lat,12,r_Rjb,'filled')
    hold on
    plot(japan_coastline(:,1),japan_coastline(:,2),'-.k','linewidth',1);
    ylim([32 46])
    xlim([132 146])
    hold on
    colormap('jet')
    box on
    set (gca,'fontsize',18,'Fontweight','bold')
    caxis([-4,4])
    if n_f==5
        hcb=colorbar('southoutside')
        aaa=get(hcb,'Position')
        set(hcb,'Position',[0.2    0.05    0.6500    0.01500])
        
        colorTitleHandle=get(hcb,'Title');
        titleString='ln(Obs)-ln(Pre)'
        set(colorTitleHandle,'String',titleString)
    end
    if n_f==2
        titlename2='Rjb'
        %      title(titlename2,'FontSize',15,'Fontweight','bold');
        text('Units','normalized','position',[0.12,0.88],'string',titlename2,'fontsize',18,'HorizontalAlignment','center','Fontweight','bold','color','red')
        
    end
    [fl fh ff]=band_select(n_f)
    
    box on
    set(gca,'fontsize',18,'Fontweight','bold')
    
end

set(hha(1:6),'XTickLabel','')
set(hha([2,4,6,8]),'YTickLabel','')

set(gcf,'color','white','paperpositionmode','auto');
figname=strcat(project_ad,'Fig/final3.eps');

print('-depsc',figname);
end
