# RECOMPOSE
QSM pipepeline used in reproducing DECOMPOSE results. Implemented in Julia thanks to the [QSM.jl](https://github.com/kamesy/QSM.jl) toolbox by Christian Kames.

This is the algorithm as applied to the three dimensional acquisition (GRE/MPM) datasets.
It assumes magnitude and phase to be available in the same folder as the script as ```M.nii.gz``` and ```P.nii.gz``` as well as TE times available in a matrix ```TEs.mat``` and voxel sizes ```vsz.mat```.
