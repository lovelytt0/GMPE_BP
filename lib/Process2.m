function Process2(path,n_f,Mw,D,dislimit,equation_flag)
project_ad=path
address='/home/tian_feng/Workspace/GMPE_BP/'
addpath(strcat(address,'lib/'));addpath(strcat(address,'src/'));addpath(strcat(address,'image/'));
data_ad=strcat(project_ad,'knet/');
in_ad=strcat(project_ad,'Input/');
out_ad=strcat(project_ad,'Output/');

%*****************************************************************************
%                                            Step 1: Choose Frequency Band (Hz)
%*****************************************************************************
%for n_f=1:5
%n_f=5
flag=2;
%flag=2;  %1 to do PGA ;  2 to do the Psa
[fl fh ff]=band_select(n_f)
filenames=strcat(out_ad,'last',num2str(fl),'_',num2str(fh),'_P1.mat')

load (filenames)
% Distance filter
ret=distance_filter(ret,dislimit);

% transfer parameters
%
PGA=ret.PGA;
PGA_vs30=ret.PGA_vs30;
vs30=ret.vs30;
lon2=ret.lon;
lat2=ret.lat;
SA=ret.SA;
PSA=ret.PSA;
BPshort=ret.BPshort/1000;
FD=ret.FD;
EHD=ret.EHD;
Hyp=ret.Hyp/1000;
Rjb=ret.Rjb/1000;
FABA=ret.FABA;
nm=ret.nm;
% [m n]=size(lon2);
% zz=zeros(1,m);
% Set Magnitude parameter
%-------------------------------------------------------------------------------------
%Mw % Magnitude
%D%Depth of Eq

% middle lines
x=zeros(1,10);
y=linspace(0,250,10);
if flag==1
    %**********************************************************************
    %                                          Step 2 :  Equation for FD and EHD
    %**********************************************************************
    %
    % Equaton : log(A)=b-log(X+c1*10.^(c2*Mw))-kX
    %                       b=aMw+hD+di*si+e
    %--------------------------------------------------------------------------------------------------------------------
    
    for k=1:3 % Choose Distance Type
        switch k
            case 1
                X=BPshort
                Y=Si(X,Mw,D,1);
            case 2
                X=FD;
                Y=Si(X,Mw,D,1);
            case 3  % EHD
                X=EHD
                Y=Si(X,Mw,D,2);
            otherwise
                fprintf('error');
        end
        
        PGA=PGA_vs30;
        Y=10.^Y;
        figure (12)
        set(gcf,'Position',[10,10,450,400],'color','w')
        MSE=real(mean(abs(log10(Y)-log10(PGA)).^2));
        RMSE=sqrt(MSE);
        PlotGMPE_PGA(project_ad,k,X,Y,PGA,RMSE);
        close all;
        clear X;
        clear PPP;
        clear aaaa;
        clear H;
        
    end
    %******************************************************************************%%
    %                                                            Tian Plot
    %******************************************************************************%%
else
    fprintf('else');
end

%******************************************************************************%%
%                                                           Step4 : Tian Plot
%                                                                      PSA
%******************************************************************************%%

if  flag==2
    for k=1:4 %
        switch k
            case 1 % FD
                X=BPshort;
            case 2  % BP
                X=Rjb;
            case 3
                X=FD;
            case 4
                X=Hyp;
            otherwise
                fprintf('error');
        end
        [~, n]=size(X)
        T=1.0/fh;
        if equation_flag==1
            for i=1:n
                
                Y(i) =BC_hydro(X(i),Mw,FABA(i),vs30(i),T);
            end
        elseif equation_flag==2
            if k==2
                for i=1:n
                    [Y(i) Fs(i)]=Boore_Rjb(X(i),Mw,FABA(i),vs30(i),T);
                    Y(i)=Y(i)/exp(Fs(i));
                end
            else
                for i=1:n
                    [Y(i) Fs(i)]=Boore(X(i),Mw,FABA(i),vs30(i),T);
                    Y(i)=Y(i)/exp(Fs(i));
                end
            end
        else
            fprintf('equation is not list')
        end
                
        PGA=PSA;
        %figure (12)
%         set(gcf,'Position',[10,10,450,300],'color','w')        
        MSE=real(mean(abs(log(Y)-log(PGA)).^2));
        RMSE=sqrt(MSE);
        spm=Spearman(X,PGA);
        PlotGMPE(project_ad,n_f,k,X,Y,PGA,RMSE,spm,dislimit,FABA,nm)       
               %close all;
               clear RMSE
        clear X;
        clear PPP;
        clear aaaa;
        clear H;
        if k==1
            ret.Predict_BP=Y;
            ret.Observe_BP=PGA;
        elseif k==2
            ret.Predict_Rjb=Y;
            ret.Observe_Rjb=PGA;
        elseif k==3
            ret.Predict_FD=Y;
            ret.Observe_FD=PGA;
        elseif k==4
            ret.Predict_hyp=Y;
            ret.Observe_hyp=PGA;
        end
        save(filenames,'ret')
    end
end

cd (project_ad)
end