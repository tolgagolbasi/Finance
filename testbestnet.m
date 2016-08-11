%function [] = nartestwithfints()
symbols = {'#ALIBABA','#AMAZON','#AMERICAN_E','#APPLE','#AT&T','#BERKSHIRE','#BOA','#BOEING','#CAC40`','#CAT','#CHEVRON','#CISCO','#CITIGROUP','#COCA-COLA','#DAX30`','#DISNEY','#DJ30`','#DJ_EUR50`','#DOLLAR_IND','#EXXONMOBIL','#FACEBOOK','#FERRARI','#FTSE100`','#GE','#GM','#GOOGLE','#GS','#INTEL','#JNJ','#JP_MORGAN','#MCDONALDS','#MICROSOFT','#MORGAN_STA','#NASDAQ100`','#NIKKEI225','#PAYPAL','#PFIZER','#PG','#POTASH','#S&P500`','#TWITTER','#VERIZON','#WAL_MART','#YAHOO','#YANDEX','10Y_T-NOTES','30Y_T-BOND','5Y_T-NOTES','AUDCAD`','AUDCHF`','AUDJPY`','AUDNZD`','AUDUSD`','BRENT_OIL`','CADCHF`','CADJPY`','CHFJPY`','COPPER`','CORN`','COTTON#2`','CrudeOIL`','EURAUD`','EURCAD`','EURCHF`','EURDKK`','EURGBP`','EURHUF`','EURILS`','EURJPY`','EURNOK`','EURNZD`','EURPLN`','EURSEK`','EURTRY`','EURUSD','EURUSD`','EURZAR`','GASOLINE`','GAUTRY`','GAUUSD`','GBPAUD`','GBPCAD`','GBPCHF`','GBPJPY`','GBPNZD`','GBPSGD`','GBPTRY`','GBPUSD','GBPUSD`','GOLDEUR`','GOLDTRY`','GOLD`','HEAT_OIL`','NAT_GAS`','NZDCAD`','NZDCHF`','NZDJPY`','NZDUSD`','PLATINUM`','SILVER`','SOYBEAN`','SUGAR#11','TRYBASK`','USDCAD`','USDCHF`','USDDKK`','USDHUF`','USDILS`','USDJPY','USDJPY`','USDMXN`','USDNOK`','USDPLN`','USDRUB.','USDRUB`','USDSEK`','USDSGD`','USDTRY','USDTRY`','USDZAR`','WHEAT`'};
tradePrice = {0.4200000000000001,1.72,0.13,0.9700000000000002,0.13,0.3700000000000001,0.13,0.13,4.5,0.13,0.13,0.13,0.14,0.13,3.5,0.13,7,5,0.11,0.13,0.13,0.14,3.5,0.13,0.13,1.18,0.13,0.13,0.13,0.13,0.13,0.13,0.13,2.5,35,0.14,0.13,0.13,0.22,0.8500000000000002,0.13,0.13,0.13,0.13,0.3100000000000001,0.09000000000000002,0.09000000000000002,0.07000000000000001,0.0007000000000000002,0.0007000000000000002,0.07000000000000002,0.0015,0.0003000000000000001,0.08000000000000002,0.0008000000000000001,0.07000000000000002,0.05000000000000001,0.006200000000000002,0.7500000000000001,0.28,0.06000000000000001,0.0007000000000000002,0.0007000000000000002,0.0004000000000000001,0.003000000000000001,0.0003000000000000001,0.7500000000000002,0.016,0.03000000000000001,0.006180000000000001,0.002,0.009900000000000003,0.005200000000000001,0.002600000000000001,0.0002,0.0002,0.025,0.0021,0.2,0.02,0.0015,0.0015,0.0007000000000000002,0.05000000000000001,0.0025,0.007000000000000002,0.005000000000000001,0.0003000000000000001,0.0003000000000000001,1,4.500000000000001,1,0.0028,0.008000000000000002,0.0008000000000000001,0.0008000000000000001,0.07000000000000002,0.0004000000000000001,1.1,0.08000000000000002,0.4500000000000001,0.09000000000000002,0.005000000000000001,0.0003000000000000001,0.0003000000000000001,0.002,0.7500000000000002,0.016,0.02,0.02,0.01,0.005000000000000001,0.007100000000000002,1.1685,1.1685,0.005160000000000001,0.0008000000000000001,0.0016,0.0016,0.01782000000000001,0.7500000000000001};
tradePrice = cell2mat(tradePrice);
bestcash = 0;
j = 84;
networksize = 20;
commis = tradePrice(j);
symboltotrain = symbols(j);
str = (symboltotrain(1,1));
filepath = strcat('C:\Users\Tolga\AppData\Roaming\MetaQuotes\Terminal\23E8DE8DA57B90C86B70E182D3461C60\MQL4\Files\',symboltotrain);
fid = fopen(char(filepath), 'rt');
a = textscan(fid, '%s %s %f %f %f %f %f', ...
'Delimiter',',', 'CollectOutput',1, 'HeaderLines',1);
fclose(fid);
format short g;
date=a(1,1);
b = strcat(date{1,1});
data = cell2mat(a(1,2));
dataClose = data(1:length(data),4);
CloseCell = num2cell(dataClose);
CloseCell = transpose(CloseCell);
CloseCellTest = num2cell(dataClose(size(dataClose,1)-300:size(dataClose,1)));
CloseCellTest = transpose(CloseCellTest);
tsarray = cell2mat(CloseCell);
tsarray = transpose(tsarray);
%CloseCellTest2 = transpose(CloseCellTest2);
T = CloseCell;
%for networksize=10:5:20
    cash = 0;
    CashArray = [];
    winArray = [];
    load GBPJPY;
    [xs,xis,ais,ts] = preparets(bestnet,{},{},CloseCellTest);
    ys = bestnet(xs,xis,ais);
    tsarray = cell2mat(CloseCellTest);
    ysarray = cell2mat(ys);
    cash = 10000;
    CashArray = [];
    isLong = 1;
    isShort = 1;
    for i = 1:(length(ysarray)-1)
        lastcash = cash;
        if (ysarray(i) - tsarray(i) > 2* commis*(isShort))
            cash = cash * (1+ (tsarray(i+1) - tsarray(i) - (commis*isShort))/tsarray(i));
            isLong = 1;
            isShort = 0;
        end
        if (ysarray(i) - tsarray(i) < (-2)*commis*isLong)
            cash = cash * (1 + (tsarray(i) - tsarray(i+1) - (commis*isLong))/tsarray(i+1));
            isLong = 0;
            isShort = 1;
        end
        CashArray(i) = cash;
        winArray(i) =  cash - lastcash;
    end
    winArrayMean = mean2(winArray);
    winArrayStd = std2(winArray);
    cash = 10000;
    for i = 1 : numel(winArray) 
        if(winArray(i) < (winArrayMean + (2 * winArrayStd))||winArray(i) > (winArrayMean - (2 * winArrayStd)))
            cash = cash + winArray(i);
        end
    end
    cash,symboltotrain
    if (cash > bestcash)
        bestcash = cash;
        bestsize = networksize;
        BestCashArray = CashArray;
        BestwinArray = winArray;
        BestSymbol = symboltotrain;
    end
    %  end
%end