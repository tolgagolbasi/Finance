function TimeSeries = ReadTimeSeries(symboltotrain)
    filepath = strcat('C:\Users\Tolga\AppData\Roaming\MetaQuotes\Terminal\23E8DE8DA57B90C86B70E182D3461C60\MQL4\Files\',symboltotrain);
    fid = fopen(char(filepath), 'rt');
    a = textscan(fid, '%s %s %f %f %f %f %f', ...
    'Delimiter',',', 'CollectOutput',1, 'HeaderLines',1);
    fclose(fid);
    format short g;
    date=a(1,1);
    b = strcat(date{1,1});
    dates = datetime(b(1:length(b), 1),'InputFormat','yyyy.MM.dd');
    timeforfints = cell2mat(b(1:length(b), 2));
    %e = strcat(b(1:length(b), 1),{' '},b(1:length(b), 2));
    formatOut = 'mmm.dd,yy';
    dateforfints = datestr(dates,formatOut);
    dates_times = strcat(dateforfints,{' '},timeforfints);
    data = cell2mat(a(1,2));
    dataOpen = data(1:length(data),1);
    %dateforfints = strcat(dateforfints,{''});
    timeday = fints(dates_times,dataOpen);
    %timeday = fints(dateforfints,dataOpen);
    %k = datenum([datestr(dates(1),formatOut);datestr(dates(length(dates)),formatOut)],formatOut);
    %alltimes = k(1):1/(24/hour):k(2);
    %alltimes = transpose(alltimes);
    %A = repmat((NaN),length(alltimes),1);
    %emptyfints = fints(alltimes,A);
    %fullfints = merge(emptyfints,timeday);
    %filledfints = fillts(fullfints,'linear');
    FtsOpenPrice = fts2mat(timeday,1);
    %FtsOpenPrice=FtsOpenPrice(~isnan(FtsOpenPrice));
    TimeSeries = num2cell(FtsOpenPrice);
    TimeSeries = transpose(TimeSeries);
end