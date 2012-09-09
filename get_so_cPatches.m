function cPatches = get_so_cPatches(dataPath)

% generate the Single-Opponent color dictionary from training set


datapath = '/gpfs/data/tserre/jzhang/general_color_image_processing_functions/Joost_Weijer/ColorDescriptors/soccer_data/soccer';
numTest = 15;
numTrain = 25;
datasplits = load('/gpfs/data/tserre/jzhang/object_recognition/results/soccer/datasplits.mat');

trn = datasplits.trn1;
tst = datasplits.tst1;

cPatches =  generate_c1soPatches(datapath,numPhases,numTrain,numTest,trn,tst)

% save the c1 prototypes
save(fullfile(outDir,sprintf('dictSo_%i_patches_%i_sizes.mat', ...
     numPatchesPerSize, length(patchSizes))) ,'cPatches','-v7.3');
 
return
 