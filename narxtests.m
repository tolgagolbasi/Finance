%function [] = nartestwithfints()
clear;
symbols = {'#ADS.DE','#ALIBABA','#ALU.PA','#ALV.DE','#AMAZON','#AMERICAN_E','#APPLE','#ASML.AS','#AT&T','#BAIDU','#BAPO.MI','#BARC.L','#BATS.L','#BAYN.DE','#BBVA.MC','#BERKSHIRE','#BKIA.MC','#BNP.PA','#BOA','#BOEING','#BP.L','#CAC40`','#CAT','#CBK.DE','#CHEVRON','#CISCO','#CITIGROUP','#CNA50','#COCA-COLA','#CS.PA','#DAX30`','#DBK.DE','#DISNEY','#DJ30`','#DJ_EUR50`','#DOLLAR_IND','#DTE.DE','#ENG.MC','#EXXONMOBIL','#FACEBOOK','#FCA.MI','#FERRARI','#FTSE100`','#FTSEMIB40','#GAM.MC','#GE','#GM','#GOOGLE','#GPRO','#GS','#GSK.L','#HSBA.L','#HSI','#IBEX35','#INTEL','#JNJ','#JP_MORGAN','#LHA.DE','#MCDONALDS','#MICROSOFT','#MNDI.L','#MORGAN_STA','#NASDAQ100`','#NFLX','#NIKKEI225','#PAYPAL','#PFIZER','#PG','#PHIA.AS','#POTASH','#RDSA.L','#S&P500`','#SAB.L','#SAF.PA','#SAN.MC','#SAP.DE','#SIE.DE','#SINA','#SU.PA','#TEF.MC','#TSLA','#TWITTER','#UG.PA','#UNA.AS','#VERIZON','#VOD.L','#VOW.DE','#VRX','#WAL_MART','#YAHOO','#YANDEX','10Y_T-NOTES','30Y_T-BOND','5Y_T-NOTES','AUDCAD`','AUDCHF`','AUDJPY`','AUDNZD`','AUDUSD`','BRENT_OIL`','CADCHF`','CADJPY`','CHFJPY`','COPPER`','CORN`','COTTON#2`','CrudeOIL`','EURAUD`','EURCAD`','EURCHF`','EURDKK`','EURGBP`','EURHUF`','EURILS`','EURJPY`','EURNOK`','EURNZD`','EURPLN`','EURSEK`','EURTRY`','EURUSD','EURUSD`','EURZAR`','GASOLINE`','GAUTRY`','GAUUSD`','GBPAUD`','GBPCAD`','GBPCHF`','GBPJPY`','GBPNZD`','GBPSGD`','GBPTRY`','GBPUSD','GBPUSD`','GOLDEUR`','GOLDTRY`','GOLD`','HEAT_OIL`','NAT_GAS`','NZDCAD`','NZDCHF`','NZDJPY`','NZDUSD`','PLATINUM`','SILVER`','SOYBEAN`','SUGAR#11','TRYBASK`','USDCAD`','USDCHF`','USDDKK`','USDHUF`','USDILS`','USDJPY','USDJPY`','USDMXN`','USDNOK`','USDPLN`','USDRUB.','USDRUB`','USDSEK`','USDSGD`','USDTRY','USDTRY`','USDZAR`','WHEAT`'};
  tradePrice = {0.8200000000000002,0.4300000000000001,0.07000000000000001,2.11,1.99,0.13,0.9700000000000002,0.3400000000000001,0.13,1.58,0.09000000000000002,1,25,1.1,0.12,0.4100000000000001,0.11,0.18,0.13,0.2,7,4.5,0.15,0.11,0.14,0.13,0.14,35,0.13,0.16,2.5,0.17,0.15,7,5,0.11,0.17,0.08000000000000002,0.13,0.13,0.13,0.16,3,9.5,0.13,0.13,0.13,1.54,0.13,0.14,11,0,0,0,0.13,0.13,0.13,0,0.14,0.13,0,0.13,2.450000000000001,0,35,0.14,0.13,0.12,0,0.21,0,0.8500000000000002,0,0,0,0,0,0,0,0,0,0.13,0,0,0.13,0,0,0,0.12,0.13,0.3100000000000001,0.09000000000000002,0.09000000000000002,0.07000000000000001,0.0007000000000000002,0.0007000000000000002,0.07000000000000002,0.0015,0.0003000000000000001,0.07000000000000001,0.0008000000000000001,0.07000000000000002,0.05000000000000001,0.006200000000000002,0.7500000000000001,0.28,0.04000000000000001,0.0007000000000000002,0.0007000000000000002,0.0004000000000000001,0.003000000000000001,0.0003000000000000001,0.7500000000000002,0.01599,0.03000000000000001,0.004000000000000001,0.002,0.005000000000000001,0.005000000000000001,0.0013,0.0002,0.0002,0.025,0.002,0.2,0.02,0.0015,0.0015,0.0007000000000000002,0.05000000000000001,0.0025,0.007000000000000002,0.0025,0.0003000000000000001,0.0003000000000000001,1,4.500000000000001,0.5000000000000001,0.0026,0.008000000000000002,0.0008000000000000001,0.0008000000000000001,0.07000000000000002,0.0004000000000000001,1,0.04000000000000001,0.4500000000000001,0.09000000000000002,0.0025,0.0003000000000000001,0.0003000000000000001,0.002,0.7500000000000002,0.016,0.02,0.02,0.01,0.005210000000000001,0.004500000000000001,0.106,0.106,0.005000000000000001,0.0008000000000000001,0.0008000000000000001,0.0008000000000000001,0.012,0.7500000000000001};
tradePrice = cell2mat(tradePrice);
BestTeststation = 2;
TeststationArray = 0;
TestHalfLifeArray = 0;
goodfitcount = 0;
hour = 4;
for i = 92:length(symbols)
    symboltotrain = symbols(i);
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
    SymbolNetCash = 0;
    dataOpen = data(1:length(data),1);
    dateforfints = strcat(dateforfints,{''});
    timeday = fints(dates_times,dataOpen);
    %timeday = fints(dateforfints,dataOpen);
    k = datenum([datestr(dates(1),formatOut);datestr(dates(length(dates)),formatOut)],formatOut);
    alltimes = k(1):1/(24/hour):k(2);
    alltimes = transpose(alltimes);
    A = repmat((NaN),length(alltimes),1);
    emptyfints = fints(alltimes,A);
    fullfints = merge(emptyfints,timeday);
    filledfints = fillts(fullfints,'linear');
    FtsOpenPrice = fts2mat(filledfints,'series1');
    FtsOpenPrice=FtsOpenPrice(~isnan(FtsOpenPrice));
    OpenCell = num2cell(FtsOpenPrice);
    %OpenCell = num2cell(dataOpen);
    FullOpenCell{i} = transpose(OpenCell);
end

 for j = 92:length(symbols)
    BestCoSymbol = 0;
    bestsharpeofTheSymbol = 0;
    bestkelly = 0;
    bestmcoofsymbollast = 0;
    bestmaximumdrawdown = 0;
    BestCashArrayofsymbol = 0;
    bestsizeofsymbollast = 0;
    bestnetlast = 0;
    BestwinArrayofsymbol = 0;     
    for feedi = 92:length(symbols)
        if feedi == j
            continue;
        end
        bestsharpeofsymbol = -5550;
        bestmcoofsymbol = 0;
        bestsizeofsymbol = 0;
        commis = tradePrice(j);
        OpenCell = FullOpenCell{j};
        OpenCellFeed = FullOpenCell{feedi};
        minDatalength = min(length(OpenCell),length(OpenCellFeed));
        if minDatalength < 3000
            continue;
        end
        OpenCell = OpenCell(size(OpenCell,2) - minDatalength+1:size(OpenCell,2));
        OpenCellFeed = OpenCellFeed(size(OpenCellFeed,2) - minDatalength+1:size(OpenCellFeed,2));
        OpenCellTest = OpenCell(size(OpenCell,2)-round(size(OpenCell,2)*0.30):size(OpenCell,2));
        OpenCellFeedTest = OpenCellFeed(size(OpenCellFeed,2)-round(size(OpenCellFeed,2)*0.30):size(OpenCellFeed,2));
        tsarray = cell2mat(OpenCell);
        tsarray = transpose(tsarray);
        [h,adftestOfSymbol] = adftest(tsarray);
        [h,vratiotestOfSymbol]=vratiotest(tsarray);
        halflifetest;    
        halflifeofSymbol = halflife;
        T = OpenCell;
        X = OpenCellFeed;
        for networksize=1:5
            bestnetcash = 0;
            bestnetsharpe = 0;
            % Create a Nonlinear Autoregressive Network
            inputDelays = 1:2;
            feedbackDelays = 1:2;
            hiddenLayerSize = networksize;
            trainFcn = 'trainlm';
            net = narxnet(inputDelays,feedbackDelays,hiddenLayerSize,'open',trainFcn);
            net.performFcn = 'mse';
            [x,xi,ai,t] = preparets(net,X,{},T);

            % Setup Division of Data for Training, Validation, Testing
            net.divideFcn = 'divideblock';
            net.divideParam.trainRatio = 55/100;
            net.divideParam.valRatio = 15/100;
            net.divideParam.testRatio = 30/100;
            net.trainParam.showWindow=0;
            % Train the Network
            [net,tr] = train(net,x,t,xi,ai);
            net = removedelay(net);
            OpenCellTrain = OpenCell(1:size(OpenCell,2)-round(size(OpenCell,2)*0.30));
            OpenCellFeedTrain = OpenCellFeed(1:size(OpenCellFeed,2)-round(size(OpenCellFeed,2)*0.30));
            %OpenCell = transpose(OpenCell);
            [xs,xis,ais,ts] = preparets(net,OpenCellFeedTrain,{},OpenCellTrain);
            y = net(xs,xis,ais);       
            trainout = cell2mat(OpenCellTrain);
            trainarray = cell2mat(y);
            for mco=0:5
                cash = 10000;
                CashArray = [];
                isLong = 0;
                isShort = 0;
                winArray = [];
                for i = 1:(length(trainarray)-1)
                    lastcash = cash;
                    if (((trainarray(i) - trainout(i)) > mco* commis))
                        cash = cash * (1 + ( trainout(i+1) - trainout(i) - (commis*~isLong))/trainout(i));
                        isLong = 1;
                        isShort = 0;
                    elseif (((trainarray(i) - trainout(i)) < (-1*mco)*commis))
                        cash = cash * (1+ (trainout(i) - trainout(i+1) - (commis*~isShort))/trainout(i+1));
                        isLong = 0;
                        isShort = 1;                    
                    else
                        isLong = 0;
                        isShort = 0;
                    end
                    CashArray(i) = cash;
                    winArray(i) =  (cash - lastcash)*100/lastcash;
                end
                winArrayMean = mean2(winArray);
                winArrayStd = std2(winArray);
                sharpeRatio =(winArrayMean*sqrt(252*(24/hour)))/winArrayStd;

                if (sharpeRatio > bestsharpeofsymbol)
                    bestsharpeofsymbol = sharpeRatio;
                    bestmcoofsymbol = mco;
                    bestnet = net;
                    bestsizeofsymbol = networksize;
                    bestdelayofsymbol = k;
                end
            end
        end        
        cash = 10000;
        CashArray = [];
        isLong = 0;
        isShort = 0;
        winArray = [];
        [xs,xis,ais,ts] = preparets(bestnet,OpenCellFeedTest,{},OpenCellTest);
        ys = bestnet(xs,xis,ais);
        tsarray = cell2mat(OpenCellTest);  
        ysarray = cell2mat(ys);
        for i = 1:(length(ysarray)-1)
            lastcash = cash;
            if (((ysarray(i) - tsarray(i)) > bestmcoofsymbol* commis))
                cash = cash * (1 + (tsarray(i+1) - tsarray(i) - (commis*~isLong))/tsarray(i));
                isLong = 1;
                isShort = 0;
            elseif (((ysarray(i) - tsarray(i)) < (-1*bestmcoofsymbol)*commis))
                cash = cash * (1+ (tsarray(i) - tsarray(i+1) - (commis*~isShort))/tsarray(i+1));
                isLong = 0;
                isShort = 1;                
            else
                isLong = 0;
                isShort = 0;
            end
            CashArray(i) = cash;
            winArray(i) =  (cash - lastcash)*100/lastcash;
        end
        winArrayMean = mean2(winArray);
        winArrayStd = std2(winArray);
        sharpeRatio =(winArrayMean*sqrt(252*(24/hour)))/winArrayStd;
        kelly = (winArrayMean * 0.01) / (winArrayStd * winArrayStd * 0.01 * 0.01);
        maximumdrawdown = maxdrawdown(CashArray); 
        if bestsharpeofTheSymbol < sharpeRatio
            bestsharpeofTheSymbol = sharpeRatio;
            BestCashArrayofsymbol = CashArray;
            BestwinArrayofsymbol = winArray;
            BestCoSymbol = symbols(feedi);
            bestmcoofsymbollast = bestmcoofsymbol;
            bestnetlast = bestnet;
            bestkelly = kelly;
            bestsizeofsymbollast = bestsizeofsymbol;
            bestmaximumdrawdown = maximumdrawdown;
        end
    end
    ListofProfits{j,1} = bestsharpeofTheSymbol;
    ListofProfits{j,2} = bestmcoofsymbollast;
    ListofProfits{j,4} = bestnetlast;
    ListofProfits{j,5} = bestsizeofsymbollast;
    ListofProfits{j,6} = BestCashArrayofsymbol;
    ListofProfits{j,7} = BestwinArrayofsymbol;
    ListofProfits{j,8} = symbols(j);   
    ListofProfits{j,9} = BestCoSymbol;
    ListofProfits{j,12} = bestmaximumdrawdown;
    ListofProfits{j,13} = bestkelly;    
 end
