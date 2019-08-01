function PlotGMPE_PGA(project_ad,k,X,Y,PGA,RMSE)
H(1)=subplot(3,1,[1, 2]);
loglog(X,PGA,'o');
hold on;
loglog(X,Y,'.r')
    
ylim([10^(-1) 10^4]); xlim([10^(0) 10^3])
ylabel(' PGA','FontSize',15,'Fontweight','bold');

aaaa=get(gca,'xlim');
set(gca,'xtick',[])
switch k
    case 1 % FD 
        titlename2='Rbp';
    case 2  % BP
        titlename2='Rrup';
    case 3
        titlename2='EHD';
    otherwise
       fprintf('error');
end

title(titlename2,'FontSize',15,'Fontweight','bold');
legend('Predict PGA','Observed PGA','Location','southwest');

Error_text=strcat('Root-Mean-Square Error: ',' ',num2str(RMSE,'%5.3f'))
text('Units','normalized','position',[0.4,0.25],'string',Error_text,'fontsize',12,'HorizontalAlignment','center','Fontweight','bold')

H(2)=subplot(3,1,3);

semilogx(X,log10(Y)-log10(PGA),'bo');
residue=log10(Y)-log10(PGA);
hold on
p=polyfit(log10(X),log10(Y)-log10(PGA),1);
xx=[0:1000];
yy=p(1)*log10(xx)+p(2);
%calculate the value of bias 
 %length=[10000:30000]*0.0001
 %var=sum(residue.*X)/sqrt((sum(residue.^2)*sum(X.^2)))
  var2=corrcoef(residue,log10(X))
  var=var2(2,1)
 %var=max(abs(xcorr(residue,log10(X),'coeff')))
%area=1/2*abs((p(2)/p(1))*p(2))+1/2*(3-abs(p(2)/p(1)))*abs(p(2)+3*p(1))
yyy=0*xx;
semilogx(xx,yyy,'k--','linewidth',2);
hold on
semilogx(xx,yy,'r','linewidth',2);
ylim([-2 2]);
set(gca,'ytick',[-2 -1 0 1 2]);
xlim(aaaa);
if k==1
     ylabel('residual','FontSize',15,'Fontweight','bold')
end
 
semilogx(xx,yy+RMSE,'r--','linewidth',0.7);
semilogx(xx,yy-RMSE,'r--','linewidth',0.7);
legend_slope=strcat('Slope: ',num2str(p(1),'%5.2f'),'',' ','  Intercept:',num2str(p(2),'%5.2f') )
legend_cor=strcat('  Correlation Coefficients:',num2str(var,'%5.2f'))

%text(500,200,legend_slope);
text('Units','normalized','position',[0.4,0.85],'string',legend_slope,'fontsize',12,'HorizontalAlignment','center','Fontweight','bold')
text('Units','normalized','position',[0.4,0.15],'string',legend_cor,'fontsize',12,'HorizontalAlignment','center','Fontweight','bold')


PPP=get(H(2),'pos')
if k==1
PPP(1)=PPP(1)-0.0
PPP(3)=PPP(3)+0.06 
else
PPP(1)=PPP(1)-0.06
PPP(3)=PPP(3)+0.12
end
PPP(2)=PPP(2)-0.05

PPP(4)=PPP(4)+0.06
set(H(2),'pos',PPP)
PPP=get(H(1),'pos')
if k==1
    PPP(1)=PPP(1)-0.0
PPP(3)=PPP(3)+0.06
else
PPP(1)=PPP(1)-0.06
PPP(3)=PPP(3)+0.12
end
PPP(2)=PPP(2)-0.06

PPP(4)=PPP(4)+0.07
set(H(1),'pos',PPP)
set(gcf,'color','white','paperpositionmode','auto');

switch k
    case 1
  figname2=strcat(project_ad,'Fig/','PGA','Rbp.eps');

   
      case 2
 figname2=strcat(project_ad,'Fig/','PGA','Rrup.eps');


     case 3
 figname2=strcat(project_ad,'Fig/','PGA','EHD.eps');


 otherwise
       fprintf('error');
end

print('-depsc',figname2);
end