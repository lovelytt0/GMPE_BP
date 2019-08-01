function [dura]=duration_tian(smoothTime,limit)
dataname='./Input/data0.mat'
load(dataname)
I=find(ret.rdis<85)
ret=orderAll(ret,0,I);
sr=ret.sr
[n m]=size(ret.xori);
DT=1.0/sr

[BB,AA]=butter(4,[2 4]/(sr/2));
for i=1:n
    ret.xori(i,:)=filter(BB,AA,ret.xori(i,:));
end

for i=1:n
    i
    hpdata1=ret.xori(i,:);
    envelope = abs(hilbert(hpdata1));
    % envelope = log10(envelope);
    smooth_enve(i,:)= smooth(envelope,smoothTime/DT);
end

t=(1:m)/sr;
figure
total=zeros(1,m);
for i=1:n
    hold on
    flag=0;
    [a b]=max(smooth_enve(i,1:m));
    smooth_enve(i,:)=smooth_enve(i,:)/abs(max(smooth_enve(i,1:m)));
    
    for ii=b:m
        if smooth_enve(i,ii)<limit&&b>20
            plot(t(ii),1.2*smooth_enve(i,ii)+ret.az(i),'ro');
            flag=1;
            break
        end
    end
    if flag==1
        plot(t,1.2*smooth_enve(i,1:m)+ret.az(i),'b');
        total=total+smooth_enve(i,1:m);
    end
end
xlim([300 800])
figure

last2=total/n-min(total/n);
plot(t,last2,'k');
[a b]=findpeaks(last2);
[aa bb]=max(a)
hold on

for ii=b(bb):length(last2)
    if last2(ii)<limit*aa
        plot(t(ii),last2(ii),'ro');
        dura=round(t(ii)-300)
        break;
    end
end
end