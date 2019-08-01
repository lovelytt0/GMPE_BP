function PlotGMPE(project_ad,n_f,k,X,Y,PGA,RMSE,spm,xmax,FABA,nm)
figure
set(gcf,'Position',[10,10,450,300],'color','w')
n1=0;
n2=0;
for i=1:length(X)
    if FABA(i)==0
        a1=loglog(X(i),PGA(i),'bo');
        hold on;
        a2=loglog(X(i),Y(i),'.k');
        n1=n1+1;
        X1(n1)=X(i);
        Y1(n1)=Y(i);
        PGA1(n1)=PGA(i);
        nm1(n1,:)=nm(i,:);
    else
        a3=loglog(X(i),PGA(i),'ro');
        hold on;
        a4=loglog(X(i),Y(i),'.g');
        n2=n2+1;
        X2(n2)=X(i);
        Y2(n2)=Y(i);
        PGA2(n2)=PGA(i);
        nm2(n2,:)=nm(i,:);
        
    end
end
%loglog(X,Y2,'.c')
ylim([10^(-1) 10^4]); %xlim([5 xmax*1.2])
[fl fh ff]=band_select(n_f)
ylabel(strcat(' Psa',num2str(1.0/fl/2) ,'s'),'FontSize',15,'Fontweight','bold');

aaaa=get(gca,'xlim');
%set(gca,'xtick',[])

if n_f<4.5
    switch k
        case 1 % FD
            titlename2='Rbp';
        case 2  % BP
            titlename2='Rjb';
        case 3
            titlename2='Rrup';
        case 4
            titlename2='Rhyp';
        otherwise
            fprintf('error');
    end
else
    titlename2=' ';
end
title(titlename2,'FontSize',15,'Fontweight','bold');
%legend('Predict   ','Observed Psa','Location','southwest');
if k==1
    if exist('a3')
        gridLegend([a1 a2 a3 a4],1,'forearc obs','forearc pre','backarc obs','backarc pre','location','west');
    else
        gridLegend([a1 a2 ],1,'forearc obs','forearc pre','location','west');
        
    end
else
    if exist('a3')
        
        gridLegend([a1 a2 a3 a4],1,'forearc obs','forearc pre','backarc obs','backarc pre','location','northeast');
    else
        gridLegend([a1 a2 ],1,'forearc obs','forearc pre','location','northeast');
        
    end
end
Error_text=strcat('Root-Mean-Square Error: ',' ',num2str(RMSE,'%5.3f'));
text('Units','normalized','position',[0.4,0.25],'string',Error_text,'fontsize',12,'HorizontalAlignment','center','Fontweight','bold');
%Error_text2=strcat('Spearman: ',' ',num2str(spm,'%5.3f'))
%text('Units','normalized','position',[0.4,0.45],'string',Error_text2,'fontsize',12,'HorizontalAlignment','center','Fontweight','bold')

set(gcf,'color','white','paperpositionmode','auto');

switch k
    case 1
        figname2=strcat(project_ad,'Fig/','PSA',num2str(fl),'_',num2str(fh),'_',num2str(xmax),'Rbp.eps');
        figname3=strcat(project_ad,'Output/','PSA',num2str(fl),'_',num2str(fh),'_',num2str(xmax),'Rbp');
        
    case 2
        figname2=strcat(project_ad,'Fig/','PSA',num2str(fl),'_',num2str(fh),'_',num2str(xmax),'Rjb.eps');
        figname3=strcat(project_ad,'Output/','PSA',num2str(fl),'_',num2str(fh),'_',num2str(xmax),'Rjb');
        
    case 3
        figname2=strcat(project_ad,'Fig/','PSA',num2str(fl),'_',num2str(fh),'_',num2str(xmax),'Rrup.eps');
        figname3=strcat(project_ad,'Output/','PSA',num2str(fl),'_',num2str(fh),'_',num2str(xmax),'Rrup');
        
    case 4
        figname2=strcat(project_ad,'Fig/','PSA',num2str(fl),'_',num2str(fh),'_',num2str(xmax),'Rhyp.eps');
        figname3=strcat(project_ad,'Output/','PSA',num2str(fl),'_',num2str(fh),'_',num2str(xmax),'Rhyp');
        
    otherwise
        fprintf('error');
end

print(gcf,'-depsc',figname2);
% Save data for the later plot
ft.X=X;
ft.Y=Y;
ft.PGA=PGA;
ft.RMSE=RMSE
ft.X1=X1;
ft.Y1=Y1;
ft.PGA1=PGA1;
ft.nm1=nm1;
if exist('X2')
ft.X2=X2;
ft.Y2=Y2;
ft.PGA2=PGA2;
ft.nm2=nm2;
end

save(strcat(figname3,'.mat'),'ft')
end