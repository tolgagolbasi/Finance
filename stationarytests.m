ylag=lag(dataClose, 1); % lag is a function in the jplv7
% (spatial-econometrics.com) package.
deltaY=dataClose-ylag;
deltaY(1)=[]; % Regression functions cannot handle the NaN
in the first bar of the time series.
ylag(1)=[];
regress_results=ols(deltaY, [ylag ones(size(ylag))]);
halflife=-log(2)/regress_results.beta(1);