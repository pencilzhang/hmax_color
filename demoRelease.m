function  C2res = demoRelease(cI)

% demonstrates how to use C2 features in a pattern classification framework
% on soccer team dataset (color predominant)
% cI is a cell of length 2: training and testing set
% More details please refer to Serre et al.2007



% creat a directory to store the results
outDir = sprintf('../results');
if ~exist(outDir,'dir')
    mkdir(outDir);
end





%% ---------------------------------------------------------------
%           load C1 prototypes if exsits or extract your own prototypes
% -------------------------------------------------------------------------
READPATCHESFROMFILE = 1;
patchSizes = [4 8 12 16];
numPatchSizes = length(patchSizes);
numPatchesPerSize = 250;


if ~READPATCHESFROMFILE
    %take more time to compute
    fprintf('extracting random patches');
    cPatches = extractRandC1Patches(cI{1}, numPatchSizes, ...
        numPatchesPerSize, patchSizes);
    
    save(fullfile(outDir,sprintf('dict_%i_patches_%i_sizes.mat', ...
        numPatchesPerSize, length(patchSizes))) ,'cPatches','-v7.3');
    
else
    fprintf('reading patches');
    cPatches = load(sprintf('dict_%i_patches_%i_sizes.mat', ...
        numPatchesPerSize, length(patchSizes)) ,'cPatches');
    cPatches = cPatches.cPatches;
    
end




%% ---------------------------------------------------------------
%                            compute C2 features
% -------------------------------------------------------------------------

%----Settings for Testing --------%
rot       = [0 90];
c1ScaleSS = 1:2:18;
RF_siz    = 7:2:39;
c1SpaceSS = 8:2:22;
div       = 4:-.05:3.2;
Div       = div;
% --- END Settings for Testing --------%


fprintf(1,'Initializing color gabor filters -- full set...');
%creates the gabor filters use to extract the S1 layer
[fSiz,filters,c1OL,numSimpleFilters] = init_gabor(rot, RF_siz, Div);
fprintf(1,'done\n');


% % The actual C2 features are computed below for each one of the training/testing directories
C2res = cell(1,2);
tic
for i = 1:2,
    C2res{i} = extractC2forcell(filters,fSiz,c1SpaceSS,c1ScaleSS,...
        c1OL,cPatches,cI{i},numPatchSizes,numSimpleFilters);
    toc
end
totaltimespectextractingC2 = toc;

% --------save C2DO features-------&
save(fullfile(outDir,sprintf('c2_%i_patches_%i_sizes.mat', ...
    numPatchesPerSize, length(patchSizes))), 'C2res','-v7.3');

end


%
