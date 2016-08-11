function [sharpeRatio,kelly,maximumdrawdown,CashArray,dailywin,swaps] = SimulateTimeSeries(OpenCell,bestnet,bestmcoofsymbol,commis,hour,testInd,delay)
    cash = 10000;
    CashArray = [];
    isLong = 0;
    isShort = 0;
    winArray = [];
    OpenCellTest = OpenCell;%(:,size(OpenCell,2)-round(size(OpenCell,2)*0.30):size(OpenCell,2));
    [xs,xis,ais,ts] = preparets(bestnet,{},{},OpenCellTest(2,:));
    ys = bestnet(xs,xis,ais);
    tsarray = cell2mat(OpenCellTest(2,:));  
    ysarray = cell2mat(ys);
    swaps = 0;
    for u = 1:(length(testInd)-1)
        i = testInd(u);
        lastcash = cash;
        %time = datetime(OpenCellTrain{1,i},'ConvertFrom','datenum');
        %DateVector = datevec(time);
        %&& (DateVector(3) ~= 23 && DateVector(4) ~= 0)
        if (((ysarray(i) - tsarray(i)) > bestmcoofsymbol* commis))
            cash = cash * (1 + (tsarray(i+1) - tsarray(i) - (commis*~isLong))/tsarray(i));
            if(~isLong)
                swaps = swaps + 1;
            end
            isLong = 1;
            isShort = 0;
        elseif (((ysarray(i) - tsarray(i)) < (-1*bestmcoofsymbol)*commis))
            cash = cash * (1+ (tsarray(i) - tsarray(i+1) - (commis*~isShort))/tsarray(i+1));
            if(~isShort)
                swaps = swaps + 1;
            end
            isLong = 0;
            isShort = 1;                
        else
            isLong = 0;
            isShort = 0;
        end
        CashArray(u) = cash;
        winArray(u) =  (cash - lastcash)*100/lastcash;
    end
    winArrayMean = mean2(winArray);
    winArrayStd = std2(winArray);
    sharpeRatio =(winArrayMean*sqrt(252*(24/hour)))/winArrayStd;
    kelly = (winArrayMean * 0.01) / (winArrayStd * winArrayStd * 0.01 * 0.01);
    dailywin = (winArrayMean * (24/hour) * kelly);
    maximumdrawdown = maxdrawdown(CashArray); 
end