function [lon,la,dep,slip]=readfault(path,limit_fault)
f=load(strcat(path,'/Fault/fault_data'))
lon_f=f(:,2);
la_f=f(:,1);
dep_f=-f(:,5);
slip_f=f(:,6);

count=0
max_slip=limit_fault*max(slip_f)
for i=1:size(lon_f)
    if slip_f(i)>max_slip
        count=count+1
        lon_o(count)=lon_f(i)
        la_o(count)=la_f(i)
        dep_o(count)=dep_f(i)
        slip_o(count)=slip_f(i)
    end
end
figure
scatter(lon_o,la_o,10,slip_o);
colorbar();
lon=lon_o;
la=la_o;
dep=dep_o;
slip=slip_o;

figname2=(strcat(path,'Fig/fault.eps'))
print(gcf,'-depsc',figname2);
end