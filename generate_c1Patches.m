function cPatches = generate_c1Patches(datapath,cI)


     
outDir = sprintf('../results');
if ~exist(outDir)
    mkdir(outDir);
end

% cI = loadAllImages(datapath,numTrain,numTest,trn,tst);
  
if isempty(cI{1})
    error(['No training images were loaded -- did you remember to' ...
	       ' change the path names?']);
end     



%%
patchSizes = [4 8 12 16];
numPatchSizes = length(patchSizes);
numPatchesPerSize = 250;



%%-------------------------------------------------------------------------
%       The c1 prototypes are extracted from the training images
% -------------------------------------------------------------------------
cPatches = extractRandC1Patches(cI{1}, numPatchSizes, ...
            numPatchesPerSize, patchSizes,numChannel,numPhases);   

% save the c1 prototypes
save(fullfile(outDir,sprintf('dict_%i_patches_%i_sizes.mat', ...
     numPatchesPerSize, length(patchSizes))) ,'cPatches','-v7.3');
 
return



