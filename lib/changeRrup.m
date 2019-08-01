function  changeRrup(path,n_f,limit_fault)

out_ad=strcat(path,'Output/');
in_ad=strcat(path,'Input/');

[fl fh]=band_select(n_f);

retname=strcat('last',num2str(fl),'_',num2str(fh),'_P1','.mat');
load(strcat(out_ad,retname));
fprintf(retname)
fprintf('\n')
lon=ret.lon;
lat=ret.lat;
[lon_f,la_f,depth,slip]=readfault(path,limit_fault);


for i=1:length(ret.lon)  % stations
    % FD Calculation
    for j=1:length(lon_f)  % fault point
        [s1(j),az1(j),reaz1(j)] = vdist(la_f(j),lon_f(j),lat(i),lon(i));
        Rrup(j)=((s1(j)/1000)^2+depth(j)^2)^(1/2);
    end
    [mm n]=min(Rrup);
    FD(i)=Rrup(n);
    % Rjb
    [mm2 n2]=min(s1);
    Rjb(i)=s1(n2);
    % EHD Calculation
    EHD(i)=(sum(slip.*slip)/sum((slip.*slip)./(Rrup.*Rrup)))^(1/2);
end

ret.FD=FD;
ret.Rjb=Rjb;
save(strcat(out_ad,retname),'ret');
cd (path)
fprintf('Updated\n')

end