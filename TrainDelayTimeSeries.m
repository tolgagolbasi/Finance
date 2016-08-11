function [bestnet,bestmcoofsymbol,bestsizeofsymbol,bestdelay] = TrainDelayTimeSeries(OpenCell,commis,hour)
    T = OpenCell(2,:);
    bestdailywin = -4000;
    for networksize=1:1
        for k = 1
            % Create a Nonlinear Autoregressive Network
            feedbackDelays = 1:1;
            hiddenLayerSize = networksize;
            net = narnet(feedbackDelays,hiddenLayerSize);
            [x,xi,ai,t] = preparets(net,{},{},T);
            % Setup Division of Data for Training, Validation, Testing
            net.divideFcn = 'divideblock';
            net.divideParam.trainRatio = 55/100;
            net.divideParam.valRatio = 15/100;
            net.divideParam.testRatio = 30/100;
            %net.trainParam.showWindow=0;
            % Train the Network
            [net,tr] = train(net,x,t,xi,ai);
            %net = removedelay(net);
            OpenCellTrain = OpenCell(:,round(size(OpenCell,2)*0.55):round(size(OpenCell,2)*0.70));
            %OpenCell = transpose(OpenCell);
            [xs,xis,ais,ts] = preparets(net,{},{},OpenCellTrain(2,:));
            y = net(xs,xis,ais);
            trainout = cell2mat(OpenCellTrain(2,:));
            trainarray = cell2mat(y);
            for mco=0
                cash = 10000;
                CashArray = [];
                isLong = 0;
                isShort = 0;
                winArray = [];
                for i = 1:(length(trainarray))
                    lastcash = cash;
                    %time = datetime(OpenCellTrain{1,i},'ConvertFrom','datenum');
                    %DateVector = datevec(time);
                    %&& (DateVector(3) ~= 23 && DateVector(4) ~= 0)
                    if (((trainarray(i) - trainout(i)) > mco* commis) )
                        cash = cash * (1 + ( trainout(i+1) - trainout(i) - (commis*~isLong))/trainout(i));
                        isLong = 1;
                        isShort = 0;
                    elseif (((trainarray(i) - trainout(i)) < (-1*mco)*commis) )
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
                %sharpeRatio =(winArrayMean*sqrt(252*24/hour))/winArrayStd;
                kelly = (winArrayMean) / (winArrayStd * winArrayStd);
                dailywin = (winArrayMean * (24/hour) * kelly);

                if (dailywin > bestdailywin)
                    bestdailywin = dailywin;
                    bestmcoofsymbol = mco;
                    bestnet = net;
                    bestsizeofsymbol = networksize;
                    bestdelay = k;
                end
                if dailywin > 0
                    break;
                end
            end
        end
    end
end