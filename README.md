# LarmorD: A Distance-Based Chemical Shift Predictor
 
- Currently predicts 1H, 13C and 15N RNA chemical shifts

## Install
```shell
$ cd /path/to/LarmorD/
$ make clean
$ make 
```

## Usage manual
```shell
$ bin/larmord -h
====================================================
LARMORD Chemical Shift Predictor v1.00
(c) 2014 Aaron T. Frank and University of Michigan.
====================================================
Usage:   larmord [-options] <PDBfile>
Options: [-csfile CSfile]
         [-parmfile PARAMfile]
         [-reffile REFfile]
         [-accfile ACCfile]
         [-corrfile CORRfile]
         [-cutoff CUToff]
         [-printError]
         [-residueSelection]
         [-nucleusSelection]
         [-residueBasedWeights]
         [-mismatchCheck]
         [-noself]
         [-ring] [-cutoffRing (9999.0 Å)]
         [-trj TRAJfile]
         [-skip frames] [-start frame] [-stop frame]
         [-identification ID]

```
## Examples
```shell

# initialize
$ export LarmorD_New=/your/path/to/larmord/ # edit
$ parameters=${LarmorD_New}/data/larmorD_alphas_betas_rna.dat
$ reference=${LarmorD_New}/data/larmorD_reference_shifts_rna.dat
$ csfile=${LarmorD_New}/tests/measured_shifts.dat

$ # predict chemical shifts from a coordinate file (PDB format)
$ ${LarmorD_New}/bin/larmord -parmfile ${parameters} -reffile ${reference} -csfile ${csfile} -identification 1SCL tests/file.pdb 

$ # predict chemical shifts from a trajectory file (DCD format) 
$ ${LarmorD_New}/bin/larmord -parmfile ${parameters} -reffile ${reference} -csfile ${csfile} -identification 1SCL -trj tests/file.dcd tests/file.pdb
```

## output
### format
_processor, trajectory-frame, residue-number, residue-name, nucleus, predicted-shifts, measured-shifts, random-coil-shifts, id-tag_

### example
```shell
$ bin/larmord -csfile tests/measured_shifts.dat -identification 1SCL tests/file.pdb
  
  0 1 1 GUA C4' 83.3042 80.854 83.1 1SCL
  0 1 1 GUA H4' 4.46852 4.533 4 1SCL
  0 1 1 GUA C1' 91.9503 89.246 93.1 1SCL
  0 1 1 GUA H1' 5.73867 5.826 5.05 1SCL
  0 1 1 GUA C8 139.384 136.761 137.9 1SCL
  0 1 1 GUA H8 7.88394 8.154 7.69 1SCL
  0 1 1 GUA C3' 74.5986 72.559 73.9 1SCL
  0 1 1 GUA H3' 4.58187 4.927 4.14 1SCL
  0 1 1 GUA C2' 75.7191 72.732 76.3 1SCL
  0 1 1 GUA H2' 4.60956 4.467 4.02 1SCL
  0 1 2 GUA C4' 82.4796 79.711 83.1 1SCL
  0 1 2 GUA H4' 4.4962 4.548 4 1SCL
  0 1 2 GUA C1' 92.4939 90.258 93.1 1SCL
  0 1 2 GUA H1' 5.7539 5.932 5.05 1SCL
  0 1 2 GUA C8 137.111 134.495 137.9 1SCL
  0 1 2 GUA H8 7.4922 7.556 7.69 1SCL
  0 1 2 GUA C3' 73.1824 70.475 73.9 1SCL
  0 1 2 GUA H3' 4.57466 4.559 4.14 1SCL
  0 1 2 GUA C2' 75.5983 72.954 76.3 1SCL
  0 1 2 GUA H2' 4.67613 4.718 4.02 1SCL
  ...
```

## Chemical shift list file
### file format
_residue-name, _residue-number, _nucleus, _measured-shifts, _error

### example
```shell
$ head -10 tests/measured_shifts.dat
  
  CYT 6 C1' 91.438 0.00
  URA 7 C1' 92.388 0.00
  CYT 8 C1' 89.297 0.00
  ADE 9 C1' 85.504 0.00
  GUA 10 C1' 81.3 0.00
  GUA 1 C1' 89.246 0.00
  GUA 2 C1' 90.258 0.00
  GUA 3 C1' 90.657 0.00
  URA 4 C1' 90.835 0.00
  GUA 5 C1' 89.925 0.00
  ...
```

## LarmorD parameter file
### file format
_resname, _nucleus, _neighbor-residue-name, _neighbor-atom-name, _alpha, _beta

### example for H5''
```shell
$ head -68 ${LarmorD_New}/data/larmorD_alphas_betas_rna.dat
 UNK H5'' GUA C1' 3.67815480447 -3
 UNK H5'' GUA C2' 1.63100734262 -3
 UNK H5'' GUA C3' 2.89281770448 -3
 UNK H5'' GUA C4' 2.3548429102 -3
 UNK H5'' GUA C5' 0.0321335101989 -3
 UNK H5'' GUA P -0.171617457218 -3
 UNK H5'' GUA O5' 1.57702037737 -3
 UNK H5'' GUA O3' 0.326168827858 -3
 UNK H5'' GUA C2 -6.64414148375 -3
 UNK H5'' GUA C4 -14.2514277865 -3
 UNK H5'' GUA C5 -18.4752206521 -3
 UNK H5'' GUA C6 -23.3660033205 -3
 UNK H5'' GUA C8 11.2256815971 -3
 UNK H5'' GUA N1 -15.0357687755 -3
 UNK H5'' GUA N2 18.8071249973 -3
 UNK H5'' GUA N3 7.49438758708 -3
 UNK H5'' GUA N7 6.47382380489 -3
 UNK H5'' GUA N9 -1.33876233081 -3
 UNK H5'' GUA O6 13.3592994749 -3
 UNK H5'' ADE C1' -6.87501637071 -3
 UNK H5'' ADE C2' -0.125715293229 -3
 UNK H5'' ADE C3' 0.934354550638 -3
 UNK H5'' ADE C4' 0.256912097145 -3
 UNK H5'' ADE C5' 0.571155032105 -3
 UNK H5'' ADE P -0.433798841887 -3
 UNK H5'' ADE O5' 1.5556382895 -3
 UNK H5'' ADE O3' 0.852536186953 -3
 UNK H5'' ADE C2 19.465835991 -3
 UNK H5'' ADE C4 -2.63457000853 -3
 UNK H5'' ADE C5 -6.20431462114 -3
 UNK H5'' ADE C6 -5.52564589385 -3
 UNK H5'' ADE C8 3.72779586352 -3
 UNK H5'' ADE N1 8.97415774656 -3
 UNK H5'' ADE N3 -3.65500648528 -3
 UNK H5'' ADE N6 -21.6733704635 -3
 UNK H5'' ADE N7 0.39668878159 -3
 UNK H5'' ADE N9 1.89834133117 -3
 UNK H5'' URA C1' -7.8361401694 -3
 UNK H5'' URA C2' -1.05475191362 -3
 UNK H5'' URA C3' -1.23351633568 -3
 UNK H5'' URA C4' 4.8561240664 -3
 UNK H5'' URA C5' 0.0 -3
 UNK H5'' URA P 1.86617611577 -3
 UNK H5'' URA O5' 1.01063675972 -3
 UNK H5'' URA O3' 0.949438715561 -3
 UNK H5'' URA C2 3.44987727435 -3
 UNK H5'' URA C4 -7.50237209988 -3
 UNK H5'' URA C5 -14.857005414 -3
 UNK H5'' URA C6 3.44656331225 -3
 UNK H5'' URA N1 2.71399930928 -3
 UNK H5'' URA N3 19.9073925365 -3
 UNK H5'' URA O4 23.4150612805 -3
 UNK H5'' CYT C1' 0.706640452452 -3
 UNK H5'' CYT C2' 0.166171606825 -3
 UNK H5'' CYT C3' -3.1035073294 -3
 UNK H5'' CYT C4' -1.57037444807 -3
 UNK H5'' CYT C5' 1.32626298398 -3
 UNK H5'' CYT P -0.440649244862 -3
 UNK H5'' CYT O5' -2.63138895134 -3
 UNK H5'' CYT O3' 1.92397549643 -3
 UNK H5'' CYT C2 8.20045630532 -3
 UNK H5'' CYT C4 1.29679400155 -3
 UNK H5'' CYT C5 4.77736668512 -3
 UNK H5'' CYT C6 1.05351000601 -3
 UNK H5'' CYT N1 2.78643038779 -3
 UNK H5'' CYT N3 6.38091065052 -3
 UNK H5'' CYT N4 -12.0144974986 -3
 UNK H5'' CYT O2 -2.71778957123 -3
 ...
```

## LARMORD-Q: 
Using a database of DFT-derived shielding, a set of parameters were derived that enables LARMORD to be used to compute DFT-like shielding values directly from structure.
```
# initialize
pdb=2N1Q
pdbfile=${LarmorD_New}/tests/${pdb}_1_min.pdb

# run LarmorD with AFNMR shielding parameters
parameters=${LarmorD_New}/data/afnmr_shielding/larmorD_alphas_betas_rna.dat
reference=${LarmorD_New}/data/afnmr_shielding/larmorD_reference_shifts_rna.dat
${LarmorD_New}/bin/larmord -residueBased -identification ${pdb} -parmfile ${parameters} -reffile ${reference} -cutoff 9999.0 ${pdbfile}
```
should return
```
0 1 1 GUA C5' 114.672 0 92.1 2N1Q
0 1 1 GUA H5' 27.1543 0 24.01 2N1Q
0 1 1 GUA H5'' 27.4311 0 27.46 2N1Q
0 1 1 GUA C4' 97.393 0 80.71 2N1Q
0 1 1 GUA H4' 27.3647 0 26.55 2N1Q
0 1 1 GUA C1' 81.3965 0 63.86 2N1Q
0 1 1 GUA H1' 25.6492 0 23.12 2N1Q
0 1 1 GUA C8 50.2403 0 34.99 2N1Q
0 1 1 GUA H8 23.7317 0 21.35 2N1Q
0 1 1 GUA C5 64.1613 0 55.53 2N1Q
0 1 1 GUA C6 28.4471 0 14.8 2N1Q
0 1 1 GUA N1 99.621 0 78.29 2N1Q
0 1 1 GUA H1 20.1546 0 7.39 2N1Q
0 1 1 GUA C2 36.7171 0 16.04 2N1Q
0 1 1 GUA N3 69.8271 0 52.79 2N1Q
0 1 1 GUA C3' 107.127 0 77.9 2N1Q
0 1 1 GUA H3' 26.9366 0 20.96 2N1Q
0 1 1 GUA C2' 103.223 0 85.27 2N1Q
0 1 1 GUA H2' 26.5614 0 30.26 2N1Q
0 1 2 GUA C5' 115.788 0 92.1 2N1Q
0 1 2 GUA H5' 27.1019 0 24.01 2N1Q
0 1 2 GUA H5'' 27.7028 0 27.46 2N1Q
0 1 2 GUA C4' 97.7252 0 80.71 2N1Q
0 1 2 GUA H4' 27.3499 0 26.55 2N1Q
0 1 2 GUA C1' 81.8945 0 63.86 2N1Q
0 1 2 GUA H1' 25.6148 0 23.12 2N1Q
0 1 2 GUA C8 51.1202 0 34.99 2N1Q
...
```
