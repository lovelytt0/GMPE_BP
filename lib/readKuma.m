function [data,Info]=readKuma(filename)
%����������ʽΪ���ȡ���

 %clear
% filename='E:\�������\arrayEEW\kumamoto\20160416012500\�ܱ����\20160416012500.knt\AIC0011604160125.NS';
% filename='E:\�������\arrayEEW\kumamoto\20160416012500\�ܱ����\20160416012500.knt\AIC0031604160125.EW';
% filename='/home/tian_feng/Workspace/Projects/202term/kinet/YMT0171103111446.NS'
fid=fopen(filename,'rb'); %rb
i=1;data=[];
while ~feof(fid)                                   % �ж��Ƿ�Ϊ�ļ�ĩβ
    tline=fgetl(fid);                                 % ���ļ�����
    switch i
        case 7
            %���������ʽ��ȡγ�ȣ������Ǹ��г��ֿո���ٳ��ָ��Ż���������������
            index=regexp(tline,'\s[\-\d]');
            stla=str2num(tline(index+1:end));
        case 8
            %��ȡγ��
            index=regexp(tline,'\s[\-\d]');
            stlo=str2num(tline(index+1:end));
        case 9
            %��ȡ�߳�
            index=regexp(tline,'\s[\-\d]');
            sthe=str2num(tline(index+1:end));
        case 10
            %��ȡʱ��
            index=regexp(tline,'\s[\-\d]');
            recordTime=tline(index+1:end);
            Info.RecordTime.year=str2num(recordTime(1:4));
            Info.RecordTime.month=str2num(recordTime(6:7));
            Info.RecordTime.day=str2num(recordTime(9:10));
            Info.RecordTime.hour=str2num(recordTime(12:13));
            Info.RecordTime.min=str2num(recordTime(15:16));
            Info.RecordTime.sec=str2num(recordTime(18:19));
            Info.RecordTime.msec=0;
        case 11
            %��ȡ����Ƶ��
            index=regexp(tline,'\s[\-\d]');
            sampleFreq=str2num(tline(index+1:end-2));
        case 14
            index=regexp(tline,'\d+');
            a=str2num(tline(index(1):index(1)+3));
            b=str2num(tline(index(2):end));
            scaleFactor=a/b;
    end
    if i>17
        %�ӵ�18�п�ʼ��ȡ���
        sline=scaleFactor*sscanf(tline,'%f',8);
        data=[data ;sline];
        
        
    end
    i=i+1;
end
Info.Station.longitude=stlo;
Info.Station.latitude=stla;
Info.Station.height=sthe;
nameindex=regexp(filename,'[A-Z]+\d\d\d');
Info.Station.name=filename(nameindex:nameindex+6);
Info.SampleFrequency=sampleFreq;

fclose(fid);
