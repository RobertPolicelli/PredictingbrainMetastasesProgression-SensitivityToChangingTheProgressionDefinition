function m2iGLCM = CalculateGLCM_BinOnTheFly_single(m3sgMatrix, m3bRoiMask, i64OffsetVector, sgFirstBinEdge, sgBinSize, ui64NumBins)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes her

m2iGLCM = CalculateGLCM_BinOnTheFly_NonIntegerMatrix(...
    m3sgMatrix, m3bRoiMask,...
    i64OffsetVector,...
    sgFirstBinEdge, sgBinSize,...
    ui64NumBins);

end

