function cPatches = generate_c1soPatches(cI)


     
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
numPhases = 1; 
numChannel = 8; %numbers of opponent color channels
% C(cyan) = G+B, Y(yellow) = R+G 
% numChannel=8, R+/G-,G+/R-,R+/C-,C+/R-,Y+/B-/B+/Y-,Wh,Bl; 
% numChannel=6, then close the Wh-Bl channel.


%%-------------------------------------------------------------------------
%       The c1 prototypes are extracted from the training images
% -------------------------------------------------------------------------
cPatches = extractRandC1SoPatches(cI{1}, numPatchSizes, ...
            numPatchesPerSize, patchSizes,numChannel,numPhases);   

% save the c1 prototypes
save(fullfile(outDir,sprintf('dictSo_%i_patches_%i_sizes.mat', ...
     numPatchesPerSize, length(patchSizes))) ,'cPatches','-v7.3');
 
return



