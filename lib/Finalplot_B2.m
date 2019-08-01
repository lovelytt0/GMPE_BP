function Finalplot(path,dislimit,equation_flag)

project_ad=path
address='/home/tian_feng/Workspace/GMPE_BP/'
addpath(strcat(address,'lib/'));addpath(strcat(address,'src/'));addpath(strcat(address,'image/'));
data_ad=strcat(project_ad,'knet/');
in_ad=strcat(project_ad,'Input/');
out_ad=strcat(project_ad,'Output/');
figure(520)
set(gcf,'Position',[10,10,750,800],'color','w')

ha=tight_subplot(2,2,[0.03 0.05 ],[0.1 0.1 ],[0.15 0.15])

%ha=tight_subplot(1,2,[0.02 0.03 ],[0.1 0.1 ],[0.1 0.1])
if equation_flag==1
    kk=[1 3]
elseif equation_flag==2
    kk=[1 2]
else
    fprintf('error')
end

for n_f=[2 5]
    [fl fh ff]=band_select(n_f)
    
    for k=kk
        
        switch k
            case 1
                figname3=strcat(project_ad,'Output/','PSA',num2str(fl),'_',num2str(fh),'_',num2str(dislimit),'Rbp.mat');
                
            case 2
                figname3=strcat(project_ad,'Output/','PSA',num2str(fl),'_',num2str(fh),'_',num2str(dislimit),'Rjb.mat');
                
            case 3
                figname3=strcat(project_ad,'Output/','PSA',num2str(fl),'_',num2str(fh),'_',num2str(dislimit),'Rrup.mat');
                
            case 4
                figname3=strcat(project_ad,'Output/','PSA',num2str(fl),'_',num2str(fh),'_',num2str(dislimit),'Rhyp.mat');
                
            otherwise
                fprintf('error');
        end
        
        load(figname3)
        X=ft.X;
        PGA=ft.PGA/980.66;
        RMSE=ft.RMSE;
        Y=ft.Y/980.66;
        if k==3
            m=2
        else
            m=k
        end
        
        if n_f==5
            mm=3
        else
            mm=n_f
        end
        axes(ha((mm-2)*2+m))
        %        subplot(5,2,(n_f-1)*2+k);
        %         [X_sort,IB]=sort(X);
        % Y_sort=Y(IB);
        % PGA_sort=PGA(IB);
        if equation_flag==1
                     [A1 B1]=sort(ft.X1);
                ft.X1=ft.X1(B1);
                ft.PGA1=ft.PGA1(B1);
                ft.Y1=ft.Y1(B1);
                
                    [A2 B2]=sort(ft.X2);
                ft.X2=ft.X2(B2);
                ft.PGA2=ft.PGA2(B2);
ft.Y2=ft.Y2(B2);
            loglog(ft.X1,ft.PGA1/980.66,'bo');
            hold on
                        loglog(ft.X2,ft.PGA2/980.66,'ko');

            hold on
            loglog(ft.X1,ft.Y1/980.66,'g','linewidth',2);
            loglog(ft.X2,ft.Y2/980.66,'r','linewidth',2);
        elseif equation_flag==2
            loglog(X,PGA,'ko');
            hold on;
            loglog(X,Y,'.r')
        else
            fprintf('Error!')
        end
        ylim([10^(-3.5) 10^1.5]);
        xlim([40 1000])
        grid on
        [fl fh ff]=band_select(n_f)
        if k==1
            ylabel(strcat(' Psa T=',num2str(1.0/fh) ,'s (g)'),'FontSize',15,'Fontweight','bold');
        end
        aaaa=get(gca,'xlim');
        
        if n_f==2
            switch k
                case 1 % FD
                    titlename2='Rf (km)';
                case 2  % BP
                    titlename2='Rjb (km)';
                case 3
                    titlename2='Rrup (km)';
                case 4
                    titlename2='Rhyp (km)';
                otherwise
                    fprintf('error');
            end
            title(titlename2,'FontSize',15,'Fontweight','bold');
            
        else
            fprintf 'no title ';
        end
        %         if n_f<4.3
        %                         set(gca,'xtick',[])
        %         end
        box on
        
        Error_text=strcat('RMSE: ',' ',num2str(RMSE,'%5.3f'))
        if n_f <3.1
            text('Units','normalized','position',[0.44,0.88],'string',Error_text,'fontsize',18,'HorizontalAlignment','center','Fontweight','bold')
        else
            text('Units','normalized','position',[0.44,0.10],'string',Error_text,'fontsize',18,'HorizontalAlignment','center','Fontweight','bold')
        end
        set(gca,'fontsize',18,'Fontweight','bold')
    end
end
rect=[0.41 0.48 .15 .05]
h=legend('forearc observation','backarc observation','forearc prediction','backarc prediction');
set(h,'Position',rect)
set(ha,'ytick',10.^[-4:4])
set(ha,'xtick',[10  100 1000])

%set(ha(1:2),'XTickLabel','')
set(ha([2,4]),'YTickLabel','')
%set(ha([2]),'YTickLabel','')
set(ha(1:2),'XTickLabel','')

set(gcf,'color','white','paperpositionmode','auto');
figname=strcat(project_ad,'Fig/finalB2.eps');

print(gcf,'-depsc',figname);
end

