function m2ui64GLCM = CalculateGLCM_BinningPreComputed(m3ui32Matrix, m3bRoiMask, vi64OffsetVector, ui64NumBins)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes her


CalculateGLCM_InputValidation(m3ui32Matrix, m3bRoiMask, vi64OffsetVector, uint8(1), uint8(1), ui64NumBins);

if any(m3ui32Matrix(:) == 0) || any(m3ui32Matrix(:) > ui64NumBins)
    error(...
        'CalculateGLCM_BinningPreComputed:InvalidBinning',...
        'The provided pre-binned matrix must contain only values ranging from 1 to the provided number of bins.');
end


[...
    m2ui64GLCM, vi32Dims, i64Numel,...
    i64Index, i64OffsetIndex,...
    i32RowIndex, i32ColIndex, i32SliceIndex,...
    i32RowOffsetStart, i32ColOffsetStart,...
    i32RowOffsetIndex, i32ColOffsetIndex, i32SliceOffsetIndex,...
    bRowLowWatch, bRowHighWatch,...
    bColLowWatch, bColHighWatch,...
    bSliceLowWatch, bSliceHighWatch,...
    vbDimsValid] =...
    ...
    CalculateGLCM_Setup(...
    ...
    m3ui32Matrix, vi64OffsetVector, ui64NumBins);



while i64Index <= i64Numel
    
    if all(vbDimsValid) && m3bRoiMask(i64Index) && m3bRoiMask(i64OffsetIndex)
        uiRowValue = m3ui32Matrix(i64Index);
        uiColValue = m3ui32Matrix(i64OffsetIndex);  
                
        m2ui64GLCM(uiRowValue, uiColValue) = m2ui64GLCM(uiRowValue, uiColValue) + uint64(1);        
    end    
    
    [...
        i64OffsetIndex, i64Index,...
        i32RowIndex, i32ColIndex, i32SliceIndex,...
        i32RowOffsetIndex, i32ColOffsetIndex, i32SliceOffsetIndex,...
        vbDimsValid] =...
        ...
        CalculateGLCM_LoopIndicesUpdate(...
        ...
        vi32Dims, i64OffsetIndex, i64Index,...
        i32RowIndex, i32ColIndex, i32SliceIndex,...
        i32RowOffsetStart, i32ColOffsetStart,...
        i32RowOffsetIndex, i32ColOffsetIndex, i32SliceOffsetIndex,...
        bRowLowWatch, bRowHighWatch,...
        bColLowWatch, bColHighWatch,...
        bSliceLowWatch, bSliceHighWatch,...
        vbDimsValid);
end


end

