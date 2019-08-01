function [Data]=pad0(Data,Info)
%û����ݵĵط�����
SampleFreq=Info(1).SampleFrequency;
for i=1:length(Info)
    hour=Info(i).RecordTime.hour;
    m=Info(i).RecordTime.min;
    sec=Info(i).RecordTime.sec;
    msec=Info(i).RecordTime.msec;
    time1(i)=3600*hour+m*60+sec+0.001*msec;
    time2(i)=3600*hour+m*60+sec+0.001*msec+length(Data{i}(:,1))/SampleFreq;
end
%Ѱ���ʼ��ʱ��������¼��ʱ���
[va,ind1]=min(time1);
[va,ind2]=max(time2);
%����
for i=1:length(Info)
    n1=(time1(i)-time1(ind1))*SampleFreq;
    n2=(time2(ind2)-time2(i))*SampleFreq;
    n1=round(n1);
    n2=round(n2);
    
    data=Data{i};
    data=[zeros(n1,3);data];
    data=[data;zeros(n2,3)];
    Data{i}=data;

end