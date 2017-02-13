# Finance
Nonlinear autoregressive neural network training scripts for MATLAB also generating predictions in Metatrader in realtime.

DataForMatlab script will generate 2 files containing spreads and symbol list as arrays for Matlab scripts. Also it will generate the data for symbols such as EURUSD etc. for each symbol. To change time frequency you can edit the PERIOD_H4 enum as you wish.

Then in Matlab you use ReadPrices.m to read price data into a table. nartestwithfints.m script to read this data and train networks. You will have to configure symbols lists and spreads list as needed for scripts. They dont read from the symbols or spreads file. nartestwithfints will generate a large ListofProfits table showing the various properties of the chosen neural network performance on the test data this table also contains the best neural network which you can save to a .mat file

buyOrSellfints.m script will work concurently with EURUSD script in Metatrader while doing live trading. It will use the network you chosen on previous step to generate a current price estimation. Metatrader does buy or sell depending on price is lower or higher than the estimation.

EURUSD script will read buyOrSell.txt file continuously to compare current price and do trades and also updates the data for Matlab. Matlab uses this data to generate buyOrSell.txt file. This interaction i tried to perfect but it might have some syncronization issues still about writing reading from files.

I would suggest going over them step by step. I put most of my time to be  able to get results. Also i figured it is troublesome for matlab and metatrader to communicate and i simply used a file interface as it was easiest and fastest to implement.
