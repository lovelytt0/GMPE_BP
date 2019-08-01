function [YY Fs   period]=Boore_Rjb(R,M,FABA,Vs30,T)

load('para_b');
load('para_c');
load('para_e');
load('para_err');
% independent coefficient
%Mw=9.1;
%R=100;
g=1;
Mref=4.5;
Rref=1.0;
a1=0.03*g;
a2=0.09*g;
pga_low=0.06*g;
V1=180;
V2=300;
Vref=760;
%n=14; % frequency choice
for i=1:2
% Dependent coefficient 
switch i
        case 1
% pga4nl
c1=-0.55;
c2=0;
c3=-0.01151;
c4=3.00;
h=3.00;
e1=-0.03279;
e2=-0.03279;
e3=-0.03279;
e4=-0.03279;
e5=0.29795;
e6=-0.20341;
e7=0;
Mh=7;
    case 2
  %PGV

   periods=para_c(:,1);
 [mm,n]=min(abs(periods-T));
   period=para_c(n,1);

c1=para_c(n,2);
c2=para_c(n,3);
c3=para_c(n,4);
c4=para_c(n,5);
h=para_c(n,5);
blin=para_b(n,2);
b1=para_b(n,3);
b2=para_b(n,4);
e1=para_e(n,2);
e2=para_e(n,3);
e3=para_e(n,4);
e4=para_e(n,5);
e5=para_e(n,6);
e6=para_e(n,7);
e7=para_e(n,8);
Mh=para_e(n,9);
% PGA

end

% Fault type
U=0; SS=0 ; NS=0; RS=1;
%R=(R^2+h^2)^(1/2)
% ln Y= Fm(M)+Fd(R,M)+Fs(Vs30,R,M)+Err
% Fd
R=(R^2+c4^2)^(1/2);
 Fd=(c1+c2*(M-Mref))*log(R/Rref)+c3*(R-Rref);
 % Fm
 if M>Mh
      Fm=e1*U+e2*SS+e3*NS+e4*RS+e7*(M-Mh);
 else
      Fm=e1*U+e2*SS+e3*NS+e4*RS+e5*(M-Mh)+e6*(M-Mh)^2;
 end
 % estimate of pga4nl
 pga4nl=exp(Fm+Fd);
% Fs 
 if i==2
 % bnl
 if Vs30<=V1
 bnl=b1
 elseif Vs30<=V2
     bnl=(b1-b2)*log(Vs30/V2)/log(V1/V2)+b2;
 elseif Vs30<Vref
     bnl=b2*log(Vs30/Vref)/log(V2/Vref);
 else
     bnl=0;
 end
% Parameter c
dx=log(a2/a1);
dy=bnl*log(a2/pga_low);
c=(3*dy-bnl*dx)/dx^2;

% Parameter d
 d=-(2*dy-bnl*dx)/dx^3;
     
     % Fnl
 if pga4nl<=a1
     Fnl=bnl*log(pga_low/0.1);
 elseif pga4nl <=a2
     Fnl=bnl*log(pga_low/0.1)+c*(log(pga4nl/a1))^2+d*(log(pga4nl/a1))^3;
 else
     Fnl=bnl*log(pga4nl/0.1);
 end
  Flin=blin*log(Vs30/Vref);

 
 Fs=Flin+Fnl;
 % err
 
 Y=exp(Fm+Fd+Fs);
 end
end
 YY=Y*980