function [bestnet,bestmcoofsymbol,bestsizeofsymbol,besttestInd,bestdelay] = TrainTimeSeries(OpenCell,commis,hour)
    T = OpenCell(2,:);
    bestdailywin = -4000;
    for networksize = 1:1
        for k = 1
            % Create a Nonlinear Autoregressive Network
            feedbackDelays = 1:k;
            hiddenLayerSize = networksize;
            net = narnet(feedbackDelays,hiddenLayerSize);
            [x,xi,ai,t] = preparets(net,{},{},T);
            % Setup Division of Data for Training, Validation, Testing
            net.divideFcn = 'divideind';
            [trainInd,valInd,testInd] = dividerand(size(OpenCell,2),60/100,20/100,20/100);
            net.divideParam.trainInd = trainInd;
            net.divideParam.valInd = valInd;
            net.divideParam.testInd = testInd;
            %net.trainParam.showWindow=0;
            % Train the Network
            [net,tr] = train(net,x,t,xi,ai);
            net = removedelay(net);
            OpenCellTrain = OpenCell;%(:,1:round(size(OpenCell,2)*0.70));
            %OpenCell = transpose(OpenCell);
            [xs,xis,ais,ts] = preparets(net,{},{},OpenCellTrain(2,:));
            y = net(xs,xis,ais);
            trainout = cell2mat(OpenCellTrain(2,:));
            trainarray = cell2mat(y);
            for mco = 0
                cash = 10000;
                CashArray = [];
                isLong = 0;
                isShort = 0;
                winArray = [];
                for u = 1:(length(trainInd)-k)
                    i = trainInd(u);
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
                    CashArray(u) = cash;
                    winArray(u) =  (cash - lastcash)*100/lastcash;
                end
                winArrayMean = mean2(winArray);
                winArrayStd = std2(winArray);
                kelly = (winArrayMean) / (winArrayStd * winArrayStd);
                if kelly > 100
                    kelly = 100;
                end
                dailywin = (winArrayMean * (24/hour) * kelly);

                if (dailywin > bestdailywin && kelly < 50)
                    bestdailywin = dailywin;
                    bestmcoofsymbol = mco;
                    bestnet = net;
                    bestsizeofsymbol = networksize;
                    besttestInd = testInd;
                    bestdelay = k;
                end
            end
        end
    end
end