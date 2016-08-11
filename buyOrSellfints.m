function [] = buyOrSellfints()
    filepath = strcat('C:\Users\Tolga\AppData\Roaming\MetaQuotes\Terminal\23E8DE8DA57B90C86B70E182D3461C60\MQL4\Files\','EURUSD`');
    generatefile();
     while(true)
         c = clock;
         c = fix(c);
         if (mod(c(4),4) == 0 &&c(5) == 0 &&(c(6) == 0))
             delete('C:\Users\Tolga\AppData\Roaming\MetaQuotes\Terminal\23E8DE8DA57B90C86B70E182D3461C60\MQL4\Files\buyorsell.txt');
             while (true)
                 Time = GetFileTime(filepath);
                 c = clock;
                 c = fix(c);                 
                 if Time.Write(4) == c(4) 
                     generatefile();
                     break;
                 end
                 pause(0.01);
             end
         end
         pause(0.01);
     end
end

function [] = generatefile()
    load EURUSD;
    filepath = strcat('C:\Users\Tolga\AppData\Roaming\MetaQuotes\Terminal\23E8DE8DA57B90C86B70E182D3461C60\MQL4\Files\','EURUSD`');
    fid = -1;
    while(fid == -1)
        fid = fopen(char(filepath), 'rt');
    end    
    a = textscan(fid, '%s %s %f %f %f %f %f', ...
          'Delimiter',',', 'CollectOutput',1, 'HeaderLines',1);
    fclose(fid);
    %format short g;
    date=a(1,1);
    b = strcat(date{1,1});
    dates = datetime(b(1:length(b), 1),'InputFormat','yyyy.MM.dd');
    timeforfints = cell2mat(b(1:length(b), 2));
    formatOut = 'mmm.dd,yy';
    dateforfints = datestr(dates,formatOut);
    dates_times = strcat(dateforfints,{' '},timeforfints);
    data = cell2mat(a(1,2));
    dataClose = data(1:length(data),1);
%     lasttimecsv = b{length(b), 2};
%     lastdatecsv = b{length(b), 1};
%     currenttime = datestr(c,'HH:MM');
%     currentdate = datestr(c,'yyyy.mm.dd');
%     if all(lastdatecsv == currentdate) && all(currenttime == lasttimecsv)
%         dataClose = dataClose(1:length(dataClose)-1);
%     end
    timeday = fints(dates_times,dataClose);
    %k = datenum([datestr(dates(1),formatOut);datestr(dates(length(dates)),formatOut)],formatOut);
    %alltimes = k(1):1/(24/hour):k(2);
    %alltimes = transpose(alltimes);
    %A = repmat((NaN),length(alltimes),1);
    %emptyfints = fints(alltimes,A);
    %fullfints = merge(emptyfints,timeday);
    %filledfints = fillts(fullfints,'linear');
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
    end    
    fprintf(fileID,'%f5',ysarray(length(ys)));
    fclose(fileID);
end
