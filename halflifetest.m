function halflife = halflifetest(tsarray)
    ylag=delayseq(tsarray, 1); % lag is a function in the jplv7
    % (spatial-econometrics.com) package.
    deltaY=tsarray-ylag;
    deltaY(1)=[]; 
    ylag(1)=[];
    regress_results=ols(deltaY, [ylag ones(size(ylag))]);
    halflife=-log(2)/regress_results.beta(1);
end