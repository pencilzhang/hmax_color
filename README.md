Three demos illustrate the biologically inspired grayscale/Single-Opponent(SO)/Double-Opponent(DO) HMAX model for object recognition
===============

HMAX model was successfully used in real data, see details in:
Serre, T., Wolf, L., Bileschi, S.M., Riesenhuber, M., Poggio, T. Robust object
recognition with cortex-like mechanisms.TPAMI, 2007.

demoRelease  : grayscale Hmax
demoSoRelease: SOHmax (For most cases, two orientations of SO is sufficient due to the weekly oriented property)
demoDoRelease: DOHmax


dataset: soccer team dataset (color-predominant)
The dataset consists of 280 images falling into 7 classes, and was originally introduced in:
van de Weijer, J., Schmid, C. Coloring local feature extraction. In: ECCV, 2006.



c1 prototypes:  randomly extracted from 250 patches of 4 patch sizes (1000 patches in total)

We provided three types of C1 patches:
dict_250_patches_4_sizes  : grayscale 
dictSo_250_patches_4_sizes: SO
dictDo_250_patches_4_sizes: DO



For comments or questions please contact Jun Zhang (zhangjun1126@gmail.com)


Publications:
Zhang J., Barhomi Y., and Serre T. A new biologically inspired color image descriptor.In: ECCV, Florence, Italy, October 2012. 
Serre, T., Wolf, L., Bileschi, S.M., Riesenhuber, M., Poggio, T.: Robust object recognition with cortex-like mechanisms. TPAMI, 2007.
