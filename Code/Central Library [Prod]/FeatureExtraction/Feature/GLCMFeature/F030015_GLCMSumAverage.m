classdef F030015_GLCMSumAverage < GLCMFeature
    %F030015_GLCMSumAverage
    %
    % ROI GLCM sum average calculation.
    
    % Primary Author: Ryan Alfano
    % Created: October 16, 2019
    
    
    % *********************************************************************   ORDERING: 1 Abstract        X.1 Public       X.X.1 Not Constant
    % *                            PROPERTIES                             *             2 Not Abstract -> X.2 Protected -> X.X.2 Constant
    % *********************************************************************                               X.3 Private
     
    properties (Constant = true, GetAccess = public)
        sFeatureName = "F030015"
        sFeatureDisplayName = "GLCM Sum Average"
    end    
    
    
    
    % *********************************************************************   ORDERING: 1 Abstract     -> X.1 Not Static 
    % *                          PUBLIC METHODS                           *             2 Not Abstract    X.2 Static
    % *********************************************************************
         
    methods (Access = public)
        
        function obj = F030015_GLCMSumAverage()
        end
    end
    
    
    
    % *********************************************************************   ORDERING: 1 Abstract     -> X.1 Not Static 
    % *                        PROTECTED METHODS                          *             2 Not Abstract    X.2 Static
    % *********************************************************************
    
    methods (Access = protected, Static = true)
        
        function dValue = ExtractGLCMFeature(m2dGLCM, oFeatureExtractorParameters)
            % dValue = ExtractGLCMFeature(m2dGLCM, oFeatureExtractorParameters)
            %
            % SYNTAX:
            % dValue = ExtractGLCMFeature(m2dGLCM, oFeatureExtractorParameters)
            %
            % DESCRIPTION:
            %  Extracts the gray level co-occurence matrix sum average feature value.
            %
            % INPUT ARGUMENTS:
            %  m2dGLCM: Gray level co-occurence matrix of the ROI
            %  oFeatureExtractorParameters: Object containing all
            %   feature extraction parameterrs.
            %
            % OUTPUTS ARGUMENTS:
            %  dValue: Resulting feature value.

            % Primary Author: Ryan Alfano
            % Created: October 16, 2019
            
            % Get the row and column subsbstripts (i,j in Aerts et al. Nat Commun. 2014;5:4006) of the normalized GLCM.
            % Haralick, Robert & Shanmugam, K & Dinstein, Ih. (1973). Textural Features for Image Classification. IEEE Trans Syst Man Cybern. SMC-3. 610-621. 
            
            vdDims = size(m2dGLCM);
            [vdCols, vdRows] = meshgrid(1:vdDims(1),1:vdDims(2));
            vdRows = vdRows(:);
            vdCols = vdCols(:);
            
            vdTerm1 = vdRows + vdCols;
            % Sort term 1 in ascending order
            [vdTerm1,vdIndices] = sort(vdTerm1);
            
            vdTerm2 = m2dGLCM(:);
            vdTerm2 = vdTerm2(vdIndices);
            
            dValue = sum(vdTerm1.*vdTerm2);
        end
    end
    
    
    
    % *********************************************************************   ORDERING: 1 Abstract     -> X.1 Not Static
    % *                         PRIVATE METHODS                           *             2 Not Abstract    X.2 Static
    % *********************************************************************
    
    methods (Access = private, Static = true) % None
    end
    
    
    
    % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    
    
    
    % *********************************************************************
    % *                        UNIT TEST ACCESS                           *
    % *                  (To ONLY be called by tests)                     *
    % *********************************************************************
    
    methods (Access = {?matlab.unittest.TestCase}, Static = false)        
    end
    
    
    methods (Access = {?matlab.unittest.TestCase}, Static = true)        
    end
end

