function [adftestOfSymbol,vratiotestOfSymbol,halflifeofSymbol] = StatTests(OpenCell)
    tsarray = cell2mat(OpenCell(2,:));
    tsarray = transpose(tsarray);
    [h,adftestOfSymbol] = adftest(tsarray);
    [h,vratiotestOfSymbol]=vratiotest(tsarray);
    %halflifeofSymbol = halflifetest(tsarray);
    halflifeofSymbol = 0;
end