
function ret=distance_filter(ret,distance)
% for i=1:2
%     if i==1
IB=find(ret.Hyp<distance*1000)
%     else
% IB=find(ret.lat<40& ret.lat>36)
%     end
ret.BPshort=ret.BPshort(IB);
ret.PGA=ret.PGA(IB);
ret.PGA_vs30=ret.PGA_vs30(IB);
ret.vs30=ret.vs30(IB);
ret.lon=ret.lon(IB);
ret.lat=ret.lat(IB);
ret.SA=ret.SA(IB);
ret.PSA=ret.PSA(IB);
ret.FD=ret.FD(IB);
ret.EHD=ret.EHD(IB);
ret.Ed=ret.Ed(IB);
ret.Hyp=ret.Hyp(IB);
ret.Rjb=ret.Rjb(IB);
ret.nm=ret.nm(IB,:);
ret.FABA=ret.FABA(IB);
%  end
end