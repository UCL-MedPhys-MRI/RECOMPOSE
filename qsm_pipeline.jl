using QSM: bet, erode_mask, unwrap_laplacian, vsharp, rts
using NIfTI: niread, niwrite
using MAT: matread

mag = niread("M.nii.gz")
phas = niread("P.nii.gz")

phas = ( phas ./ maximum(phas) ) .* 2*pi

γ     = 267.52     # gyromagnetic ratio
B0    = 3          # main magnetic field strength
TEs   = matread(TEs)
vsz   = matread(vsz)
bdir  = (0,0,1)

# extract brain mask from last echo using FSL's bet
mask0 = bet(@view(mag[:,:,:,end]), vsz, "-m -n -f 0.5")
# erode mask
mask1 = erode_mask(mask0, 3)

# Unwrapping
uphas = unwrap_laplacian(phas, mask1, vsz)

# Background Field Removal
fl, mask2 = vsharp(uphas, mask1, vsz)

# Dipole Inversion
χ = rts(fl, mask2, vsz)
niwrite("qsm_rts.nii", NIVolume(magnii.header, χ))
