function [Y]=Si(X,Mw,D,n)
% n indicate the FD or EHD
if n==1 % FD
b=0.5*Mw+0.0043*D+0.01+0.61;
Y=b-log10(X+0.0055*10.^(0.5*Mw))-0.003*X;
elseif n==2 % EHD
     b=0.5*Mw+0.0036*D+0.09+0.6;
        Y=b-log10(X)-0.003*X;      
else
        fprintf('error in function Si')
    end
