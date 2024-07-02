# BLAST_TSG (Target-Specific Gene)
BLAST_TGS is a Bash scripts that semi-automatically searches for target-specific gene sequences based on data output from OrthoFinder (https://github.com/davidemms/OrthoFinder). Users can target organisms that already have genome assemblies, assisting them in the search for target-specific gene sequences.

## Installation
At the time of release, the related software was tested using the following versions:
<br>
* OrtoFinder v2.5.5
* FASTX_Toolkit v0.0.14
* Seqkit v2.6.1
* blast v2.15.0
* bedtools v2.31.1

## Usage
### OrthoFinder part
Run OrthoFinder with amino acid sequences of target and non-target species as input files.

### BLAST_TSG part
### 1. Extract target-specific genes.
Target-specific genes are extracted using ```Orthogroups.GeneCount.tsv``` file from OrthoFinder.
<br>
```Orthogroups.GeneCount.tsv``` is used to be put in ```/OrthoFinder/Result_XX/Orthogroups/```.
<br>
Change line 7 of script to ```$X==0``` for non-target species, and ```$X>=1``` for target species, depending on the data input by the users.
<br>
If you need high-copied target, increase the value at target species (e.x. ```$X>=3```).
<br>
### 2. BLAST for non-target species to exclude non-specific sequence.

<br>
<br>
<br>
<br>
<br>
<br>
## License
BLAST_TSG is licensed under GPL v3.0. 


## Citation
In preparation. 
