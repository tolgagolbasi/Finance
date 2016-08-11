function [] = priceEstimation()
    symbol = 'GBPTRY`';
    load(symbol);
    filepath = strcat('C:\Users\Tolga\AppData\Roaming\MetaQuotes\Terminal\23E8DE8DA57B90C86B70E182D3461C60\MQL4\Files\',symbol);
    fid = fopen(char(filepath), 'rt');
    a = textscan(fid, '%s %s %f %f %f %f %f', ...
          'Delimiter',',', 'CollectOutput',1, 'HeaderLines',1);
    fclose(fid);
    date=a(1,1);
    b = strcat(date{1,1});
    dates = datetime(b(1:length(b), 1),'InputFormat','yyyy.MM.dd');
    timeforfints = cell2mat(b(1:length(b), 2));
    formatOut = 'mmm.dd,yy';
    dateforfints = datestr(dates,formatOut);
    dates_times = strcat(dateforfints,{' '},timeforfints);
    data = cell2mat(a(1,2));
    dataClose = data(1:length(data),1);
    timeday = fints(dates_times,dataClose);
    FtsClosePrice = fts2mat(timeday,'series1');
    FtsClosePrice=FtsClosePrice(~isnan(FtsClosePrice));
    OpenCell = num2cell(FtsClosePrice);
    OpenCell = transpose(OpenCell);
    [xs,xis,ais,ts] = preparets(bestnet,{},{},OpenCell);
    ys = bestnet(xs,xis,ais);
    ysarray = cell2mat(ys);
    fileID = -1;
    while(fileID == -1)
        [fileID,~] = fopen('C:\Users\Tolga\AppData\Roaming\MetaQuotes\Terminal\23E8DE8DA57B90C86B70E182D3461C60\MQL4\Files\buyorsell.txt','w+');
        fprintf(fileID,'%f5',ysarray(length(ys)));
        fclose(fileID);
    end
end