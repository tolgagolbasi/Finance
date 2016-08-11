function [ output_args ] = buyOrSell( Open, lastClose, saveToFile )
%buyOrSell Summary of this function goes here
%   Detailed explanation goes here
    S = load('pretrained_network.mat');
    nets = S.nets;
    CloseCellTest = S.CloseCellTest;
    if (nargin > 1)    
        CloseCellTest(length(CloseCellTest)+1) = num2cell(lastClose);
    end

    [xs,xis,ais,ts] = preparets(nets,{},{},CloseCellTest);
    ys = nets(xs,xis,ais);
    ysarray = cell2mat(ys);
    if (ysarray(length(ys)) - Open > 0.0002)
        output_args = 'Buy';
    end
    if (Open - ysarray(length(ys)) > 0.0002)
        output_args = 'Sell';
    end
    if (nargin > 2)
        if (saveToFile)
            save pretrained_network.mat;
        end
    end
end

