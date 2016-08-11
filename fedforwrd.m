%function [] = nartestwithfints()
symbols = {'#ALIBABA','#AMAZON','#AMERICAN_E','#APPLE','#AT&T','#BERKSHIRE','#BOA','#BOEING','#CAC40`','#CAT','#CHEVRON','#CISCO','#CITIGROUP','#COCA-COLA','#DAX30`','#DISNEY','#DJ30`','#DJ_EUR50`','#DOLLAR_IND','#EXXONMOBIL','#FACEBOOK','#FERRARI','#FTSE100`','#GE','#GM','#GOOGLE','#GS','#INTEL','#JNJ','#JP_MORGAN','#MCDONALDS','#MICROSOFT','#MORGAN_STA','#NASDAQ100`','#NIKKEI225','#PAYPAL','#PFIZER','#PG','#POTASH','#S&P500`','#TWITTER','#VERIZON','#WAL_MART','#YAHOO','#YANDEX','10Y_T-NOTES','30Y_T-BOND','5Y_T-NOTES','AUDCAD`','AUDCHF`','AUDJPY`','AUDNZD`','AUDUSD`','BRENT_OIL`','CADCHF`','CADJPY`','CHFJPY`','COPPER`','CORN`','COTTON#2`','CrudeOIL`','EURAUD`','EURCAD`','EURCHF`','EURDKK`','EURGBP`','EURHUF`','EURILS`','EURJPY`','EURNOK`','EURNZD`','EURPLN`','EURSEK`','EURTRY`','EURUSD','EURUSD`','EURZAR`','GASOLINE`','GAUTRY`','GAUUSD`','GBPAUD`','GBPCAD`','GBPCHF`','GBPJPY`','GBPNZD`','GBPSGD`','GBPTRY`','GBPUSD','GBPUSD`','GOLDEUR`','GOLDTRY`','GOLD`','HEAT_OIL`','NAT_GAS`','NZDCAD`','NZDCHF`','NZDJPY`','NZDUSD`','PLATINUM`','SILVER`','SOYBEAN`','SUGAR#11','TRYBASK`','USDCAD`','USDCHF`','USDDKK`','USDHUF`','USDILS`','USDJPY','USDJPY`','USDMXN`','USDNOK`','USDPLN`','USDRUB.','USDRUB`','USDSEK`','USDSGD`','USDTRY','USDTRY`','USDZAR`','WHEAT`'};
tradePrice = {0.4200000000000001,1.81,0.13,0.9700000000000002,0.13,0.3900000000000001,0.13,0.16,4.5,0.14,0.14,0.13,0.13,0.13,3,0.14,7,5,0.11,0.14,0.13,0.17,3,0.13,0.13,2.180000000000001,0.24,0.13,0.14,0.13,0.15,0.13,0.13,2.450000000000001,35,0.13,0.13,0.13,0.21,0.8500000000000002,0.13,0.13,0.14,0.13,0.3100000000000001,0.07000000000000001,0.09000000000000002,0.07000000000000001,0.0007000000000000002,0.0007000000000000002,0.07000000000000002,0.0015,0.0003000000000000001,0.08000000000000002,0.0008000000000000001,0.07000000000000002,0.05000000000000001,0.006200000000000002,0.7500000000000001,0.28,0.04000000000000001,0.0007000000000000002,0.0007000000000000002,0.0004000000000000001,0.003000000000000001,0.0003000000000000001,0.7500000000000002,0.01601,0.03000000000000001,0.004830000000000001,0.002,0.005000000000000001,0.005000000000000001,0.0013,0.0002,0.0002,0.025,0.0021,0.2,0.02,0.0015,0.0015,0.0007000000000000002,0.05000000000000001,0.0025,0.007000000000000002,0.0025,0.0003000000000000001,0.0003000000000000001,1,4.500000000000001,0.5000000000000001,0.0026,0.008000000000000002,0.0008000000000000001,0.0008000000000000001,0.07000000000000002,0.0004000000000000001,1,0.04000000000000001,0.4500000000000001,0.09000000000000002,0.0025,0.0003000000000000001,0.0003000000000000001,0.002,0.7500000000000002,0.016,0.02,0.02,0.01,0.006070000000000002,0.004500000000000001,1.1495,1.1495,0.005000000000000001,0.0008000000000000001,0.0008000000000000001,0.0008000000000000001,0.012,0.7500000000000001};
tradePrice = cell2mat(tradePrice);
BestTeststation = 2;
TeststationArray = 0;
TestHalfLifeArray = 0;
goodfitcount = 0;
bestcash = 0;
bestsharpe = -5000;

%for j = 1:length(symbols)
j = 10;
%     if j < 45
%         continue;
%     end
    %for j = transpose(candidateStationTest)
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
    %dates = datetime(b(1:length(b), 1),'InputFormat','yyyy.MM.dd');
    %timeforfints = cell2mat(b(1:length(b), 2));
    %e = strcat(b(1:length(b), 1),{' '},b(1:length(b), 2));
    %combineddate = datenum(strcat(b(1:length(b), 1),b(1:length(b), 2)),'yyyy.MM.ddHH:mm');
    %formatOut = 'mmm.dd,yy';
    %dateforfints = datestr(dates,formatOut);
    %dateforfints = datenum(dates);    
    % dates_times = strcat(dateforfints,{' '},timeforfints);
    data = cell2mat(a(1,2));
    dataClose = data(1:length(data),4);
    delayeddata = delayseq(dataClose,-1);
    %timeday = fints(dates_times,dataClose);
    %timeday = fints(dateforfints,dataClose);
    %k = datenum([datestr(dates(1),formatOut);datestr(dates(length(dates)),formatOut)],formatOut);
    %alltimes = k(1):1:k(2);
    %alltimes = transpose(alltimes);
    %A = repmat((NaN),length(alltimes),1);
    %emptyfints = fints(alltimes,A);
    %fullfints = merge(emptyfints,timeday);
    %filledfints = fillts(fullfints,'linear');
    %FtsClosePrice = fts2mat(filledfints,'series1');
    %FtsClosePrice=FtsClosePrice(~isnan(FtsClosePrice));
    %CloseCell = num2cell(FtsClosePrice);
    CloseCell = num2cell(dataClose);
    CloseCell = transpose(CloseCell);
    if length(CloseCell) < 1000
        continue;
    end
    CloseCellTest = num2cell(dataClose(size(dataClose,1)-300:size(dataClose,1)));
    %CloseCellTest2 = num2cell(FtsClosePrice(size(FtsClosePrice,1)-round(size(FtsClosePrice,1)*0.30):size(FtsClosePrice,1)-round(size(FtsClosePrice,1)*0.15)));

    CloseCellTest = transpose(CloseCellTest);
    tsarray = cell2mat(CloseCell);
    tsarray = transpose(tsarray);
    [h,adftestOfSymbol] = adftest(tsarray);
    [h,vratiotestOfSymbol]=vratiotest(log(tsarray));    
    testOfStation = adftestOfSymbol + vratiotestOfSymbol;
    halflifetest;    
    halflifeofSymbol = halflife;
    %CloseCellTest2 = transpose(CloseCellTest2);
    x = dataClose';
    t = delayeddata';

    for networksize=10:5:20
       % for o=1:5
        FullCash = 0;
        %for k=1:5
        cash = 0;
        CashArray = [];
        winArray = [];
        % Choose a Training Function
        % For a list of all training functions type: help nntrain
        % 'trainlm' is usually fastest.
        % 'trainbr' takes longer but may be better for challenging problems.
        % 'trainscg' uses less memory. Suitable in low memory situations.
        trainFcn = 'trainlm';  % Levenberg-Marquardt backpropagation.

        % Create a Nonlinear Autoregressive Network
        feedbackDelays = 1:1;
        hiddenLayerSize = networksize;
        net = feedforwardnet(hiddenLayerSize,trainFcn);
        net.performFcn = 'crossentropy';
        net.performParam.regularization = 0.1;
        net.performParam.normalization = 'none';
        net.input.processFcns = {'removeconstantrows','mapminmax'};
        net.output.processFcns = {'removeconstantrows','mapminmax'};
        % Setup Division of Data for Training, Validation, Testing
        net.divideFcn = 'divideblock';
        net.divideParam.trainRatio = 70/100;
        net.divideParam.valRatio = 15/100;
        net.divideParam.testRatio = 15/100;

        % Train the Network
        [net,tr] = train(net,x,t);
        y = net(x);

        ys = nets(CloseCellTest);
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
        sharpe = winArrayMean / winArrayStd;
        cash,symboltotrain
        if (sharpe > bestsharpe)
            bestsharpe = sharpe;
            bestcash = cash;
            bestnet = nets;
            bestsize = networksize;
            BestCashArray = CashArray;
            BestwinArray = winArray;
            BestSymbol = symboltotrain;
        end
        %  end
        if (testOfStation < 0.6 && halflifeofSymbol < 300) 
            goodfitcount = goodfitcount + 1;
            TeststationArray(goodfitcount,1) = testOfStation;
            TeststationArray(goodfitcount,2) = halflifeofSymbol;
            TeststationArray(goodfitcount,3) = j;
        end   
      %  end
    end
%end
%candidateStationTest = TeststationArray(1:goodfitcount,3);
%end