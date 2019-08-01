function y=disfilter(x,value)
 IB=find(x<value)
 y=x(IB)
end