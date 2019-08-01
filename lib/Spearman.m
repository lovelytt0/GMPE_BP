function Out=Spearman(x_in,y_in)
% Spearman's rank correlation
%example

% x_in=[86 97 99 100 101 103 106 110 112 113]
% y_in=[0 20 28 27 50 29 7 17 6 12]

[x_out x]=sort(x_in);
[y_out y]=sort(y_in);

d=x-y;
n=length(x_in);
Out=1-(6*sum(d.^2))/(n*(n^2-1));