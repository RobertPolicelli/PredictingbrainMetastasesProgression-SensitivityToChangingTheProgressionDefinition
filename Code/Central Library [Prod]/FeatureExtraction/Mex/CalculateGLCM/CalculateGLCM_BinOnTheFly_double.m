function m2iGLCM = CalculateGLCM_BinOnTheFly_double(m3dMatrix, m3bRoiMask, i64OffsetVector, dFirstBinEdge, dBinSize, ui64NumBins)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes her

m2iGLCM = CalculateGLCM_BinOnTheFly_NonIntegerMatrix(...
    m3dMatrix, m3bRoiMask,...
    i64OffsetVector,...
    dFirstBinEdge, dBinSize,...
    ui64NumBins);

end

