moments={mean(winArray), std(winArray), ...
skewness(winArray), kurtosis(winArray)};
numSampleAvgretBetterOrEqualObserved=0;
lookback = 1700;
for sample=1:10000
	winArray_sim=pearsrnd(moments{:}, length(winArray), 1);
	cl_sim=cumprod(1+winArray_sim)-1;
	longs_sim=cl_sim > backshift(lookback, cl_sim) ;
	shorts_sim=cl_sim < backshift(lookback, cl_sim) ;
	pos_sim=zeros(length(cl_sim), 1);
	for h=0:holddays-1
		long_sim_lag=backshift(h, longs_sim);
		long_sim_lag(isnan(long_sim_lag))=false;
		long_sim_lag=logical(long_sim_lag);
		short_sim_lag=backshift(h, shorts_sim);
		short_sim_lag(isnan(short_sim_lag))=false;
		short_sim_lag=logical(short_sim_lag);
		pos_sim(long_sim_lag)=pos_sim(long_sim_lag)+1;
		pos_sim(short_sim_lag)=pos_sim(short_sim_lag)-1;
	end
	ret_sim=backshift(1, pos_sim).*winArray_sim/holddays;
	ret_sim(~isfinite(ret_sim))=0;
	if (mean(ret_sim)>= mean(ret))
		numSampleAvgretBetterOrEqualObserved=numSampleAvgret
		BetterOrEqualObserved+1;
	end
end