function Finalplot2(path,dislimit,equation_flag)
project_ad=path
address='/home/tian_feng/Workspace/GMPE_BP/'
addpath(strcat(address,'lib/'));addpath(strcat(address,'src/'));addpath(strcat(address,'image/'));
data_ad=strcat(project_ad,'knet/');
in_ad=strcat(project_ad,'Input/');
out_ad=strcat(project_ad,'Output/');
figure(521)
set(gcf,'Position',[10,10,1000,1600],'color','w')
%hha=tight_subplot(1,2,[0.02 0.03 ],[0.1 0.1 ],[0.15 0.1])

hha=tight_subplot(4,2,[0.03 0.05 ],[0.1 0.1 ],[0.1 0.15])

if equation_flag==1
    kk=[1 3]
elseif equation_flag==2
    kk=[1 2]
else
    fprintf('error')
end


for n_f=2:5
    [fl fh ff]=band_select(n_f)
    for k=kk
        switch k
            case 1
                figname3=strcat(project_ad,'Output/','PSA',num2str(fl),'_',num2str(fh),'_',num2str(dislimit),'Rbp.mat');
                
            case 2
                figname3=strcat(project_ad,'Output/','PSA',num2str(fl),'_',num2str(fh),'_',num2str(dislimit),'Rjb.mat');
                
            case 3
                figname3=strcat(project_ad,'Output/','PSA',num2str(fl),'_',num2str(fh),'_',num2str(dislimit),'Rrup.mat');
%                 
            case 4
                figname3=strcat(project_ad,'Output/','PSA',num2str(fl),'_',num2str(fh),'_',num2str(dislimit),'Rhyp.mat');
                
            otherwise
                fprintf('error');
        end
        
        load(figname3)
        X=ft.X;
        PGA=ft.PGA;
        RMSE=ft.RMSE;
        Y=ft.Y;
        if k==3
            m=2
        else
            m=k
        end
        axes(hha((n_f-2)*2+m))
        if equation_flag==1
            residue1=log(ft.PGA1)-log(ft.Y1);
            
            a1=semilogx(ft.X1,residue1,'bo');
            hold on        
            if isfield(ft,'PGA2')
            residue2=log(ft.PGA2)-log(ft.Y2);

            a2=semilogx(ft.X2,residue2,'ko');
            end
        elseif equation_flag==2
            residue=log(PGA)-log(Y);
            semilogx(X,residue,'bo');
            
        else
            fprintf('error')
        end
        hold on
        ylim([-3.5 3.5]);
                grid on

        %% Median
        % [X_sort,IB]=sort(X);
        % Y_sort=Y(IB);
        % PGA_sort=PGA(IB);
        xlim([10 1000])
        
        aaaa=get(gca,'xlim')
        dislim=log10(aaaa)
        step=(dislim(2)-dislim(1))/10.0;
        
        if equation_flag==1
            for i=1:10
                aab=find (ft.X1>10^(dislim(1)+step*(i-1))&ft.X1<10^(dislim(1)+i*step))
                if isempty(aab)
                    fprintf('no value')
                else
                    medianvalue1=median(residue1(aab))
                   a3= semilogx(10^(dislim(1)+step*(i-0.5)),medianvalue1,'gd','MarkerSize',8,'linewidth',3)
                end
            end
            hold on
            if isfield(ft,'X2')
            for i=1:10
                aab=find (ft.X2>10^(dislim(1)+step*(i-1))&ft.X2<10^(dislim(1)+i*step))
                if isempty(aab)
                    fprintf('no value')
                else
                    medianvalue2=median(residue2(aab))
                  a4=  semilogx(10^(dislim(1)+step*(i-0.5)),medianvalue2,'rd','MarkerSize',8,'linewidth',3)
                end
            end
            end
            
        elseif equation_flag==2
            for i=1:10
                aab=find (X>10^(dislim(1)+step*(i-1))&X<10^(dislim(1)+i*step))
                if isempty(aab)
                    fprintf('no value')
                else
                    medianvalue=median(residue(aab))
                    semilogx(10^(dislim(1)+step*(i-0.5)),medianvalue,'rd','MarkerSize',8,'linewidth',3)
                    
                end
            end
        else
            fprintf('error')
        end
        
        xdash=[aaaa(1):aaaa(2)]
        semilogx(xdash,xdash*0,'k--');
        %%
        
        
        
        [fl fh , ~]=band_select(n_f)
        if k==1
            ylabel(strcat(' Residual T=',num2str(1.0/fh) ,'s'),'FontSize',15,'Fontweight','bold');
        end
        
        if n_f==2
            switch k
                case 1 % FD
                    titlename2='R_h_f (km)';
                case 2  % BP
                    titlename2='Rjb (km)';
                case 3
                    titlename2='R_r_u_p (km)';
                case 4
                    titlename2='Rhyp (km)';
                otherwise
                    fprintf('error');
            end
            title(titlename2,'FontSize',15,'Fontweight','bold');
            
        else
            fprintf 'no title ';
        end
        
        box on
        set(gca,'fontsize',15,'Fontweight','bold')
    end
end
rect=[0.42 0.47 .15 .05]
if exist('a2')
h=gridLegend([ a1 a2 a3 a4 ],1,'forearc residual','backarc residual','forearc median','backarc median','location','east')
else
    h=gridLegend([ a1  a3  ],1,'forearc residual','forearc median','location','east');

end
set(h,'Position',rect)
set(hha,'ytick',[-3,-2,-1,0,1,2,3])
set(hha,'xtick',[ 10 100 1000  ])

set(hha(1:6),'XTickLabel','')
set(hha([2,4,6,8]),'YTickLabel','')
%set(hha([2]),'YTickLabel','')
set(gcf,'color','white','paperpositionmode','auto');
%figname=strcat(project_ad,'Fig/final2.png');
figname=strcat('/home/tian_feng/Workspace/GMPEfig/',path(27:42),'Residual.png');

print(gcf,'-dpng',figname);
end