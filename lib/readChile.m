function [data0,Info]=readChile(filename,flag)
order=4;
f1 = 5;%low frequency limit
f2 = 10;%high frequency limit
TAPERW = 0.03;
tr = [0 200];
i=1
if  flag==1
ms_t = datenum([2015 9 16 22 54 31]);
elseif  flag==2
ms_t = datenum([2014 4 01 23 46 47]);
else 
    'error'
end
%ms_loc = [-31.637  -71.741];%updated Aug. 2017

ref_t = ms_t;

temp = importdata(filename,'\t',6);
st = datenum(str2double(temp.textdata{1}(21:24)), str2double(temp.textdata{1}(26:27)), str2double(temp.textdata{1}(29:30)),...
    str2double(temp.textdata{1}(32:33)), str2double(temp.textdata{1}(35:36)), str2double(temp.textdata{1}(38:43)));
sampling = 1/str2double(temp.textdata{2}(21:23));
ny = 1/(2*sampling);
%[B,A] = butter(order, [f1 f2]/ny);
tmpdat = detrend(temp.data,'linear'); tmpdat = detrend(tmpdat,'constant'); % detrend & demean
tmpdat = taperSeis(tmpdat,TAPERW);


if (st - ref_t)*24*3600 > tr(1)
    padl = round(((st - ref_t)*24*3600 - tr(1))/sampling);
    tmpdat = [zeros(padl,1);tmpdat];
    st = st - (padl*sampling)/(24*3600);
end
if ( (st - ref_t)*24*3600 + (length(tmpdat)-1)*sampling ) < tr(2)
    padl = round((tr(2) - ( (st - ref_t)*24*3600 + (length(tmpdat)-1)*sampling ))/sampling);
    tmpdat = [tmpdat;zeros(padl,1)];
end

%data{i,1} = filtfilt(B,A,tmpdat);
%data{i,1} = cumtrapz(data{i,1})*sampling;


data0=tmpdat*100;%data{1};
%idx = cellfun(@(x)(strcmp(x,fnames{i}(1,38:41))), station);
%sta = sscanf(temp.textdata{5}, '%*s %*s %f %*s %f', [1, inf]);
% figure
% plot(data{i,1})
Info.Station.latitude=str2num(temp.textdata{5}(12:19));
Info.Station.longitude=str2num(temp.textdata{5}(30:36));
Info.SampleFrequency=str2num(temp.textdata{2}(21:23));
Info.RecordTime.hour=str2num(temp.textdata{1}(32:33));
Info.RecordTime.min=str2num(temp.textdata{1}(35:36));
Info.RecordTime.sec=str2num(temp.textdata{1}(38:39));
Info.RecordTime.msec=str2num(temp.textdata{1}(41:42));
Info.Station.name=temp.textdata{4}(12:16);
end
%fclose(fid);