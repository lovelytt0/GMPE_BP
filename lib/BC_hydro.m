function Y=BC_hydro(R,M,FABA,vs30,T)
load Para_BC_Hydro
Period=Para_BC_Hydro(:,1);
% T=1.0
% M=9.1
% R=100
% FABA=1
[mm,nn]=min(abs(Period-T));
x1=Para_BC_Hydro(nn,4);
x2=Para_BC_Hydro(nn,5);
x6=Para_BC_Hydro(nn,6);
x8=Para_BC_Hydro(nn,8);
x13=Para_BC_Hydro(nn,12);
x15=Para_BC_Hydro(nn,14);
x16=Para_BC_Hydro(nn,15);

n=1.18;c=1.88;x3=0.1;x4=0.9;x5=0.0;x9=0.4;C4=10;C1=7.8;
if T<=0.3
    dC1=0.2;
elseif T<=0.5
    dC1=0.1;
elseif T<=1.0
    dC1=0.0;
elseif T<=2.0
    dC1=-0.1;
else
    dC1=-0.2;
end
C11=C1+dC1
if M<=C11
    fmag=x4*(M-C11)+x13*(10-M)^2;
else M>C11
    fmag=x5*(M-C11)+x13*(10-M)^2;
end

fFABA=FABA*(x15+x16*log((max([R,100]))/40.0));
Y=x1+x4*dC1+(x2+x3*(M-7.8))*log(R+C4*exp(x9*(M-6)))+x6*R+fmag+fFABA;
Y=exp(Y)*980;
end

