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
### 1. Extract the target-specific genes.
The target-specific genes are extracted using ```Orthogroups.GeneCount.tsv``` file from OrthoFinder.
<br>
```Orthogroups.GeneCount.tsv``` is genellary output to ```/OrthoFinder/Result_XX/Orthogroups/```.
<br>
Change line 7 of script to ```$X==0``` for the non-target species, and ```$X>=1``` for the target species, depending on the data input by the users.
<br>
If you need high-copied targets, increase the value at target species (e.g. ```$X>=3```).
<br>
Change the CDS sequence on 27 and 35 lines depend on your target species.
<br>
### 2. BLAST for the non-target species to exclude the non-specific sequences.
Extract target-specific sequence from target-specific genes.
<br>
All genomes used in analysis need to be made blast database in advance.
<br>
BLAST1 is performed for non-target species to exclude non-specific sequences.
<br>
Here, blastdb name that are non-target species should be specified in ```-db```.
<br>
### 3. BLAST for target species to extract target-specific sequences.
BLAST2 is performed for target species to extract target-specific sequences.
<br>
Here, blastdb name that are target species should be specified in ```-db```.
<br>
For group-specific sequence extraction, run BLAST3 or later for other target species.
<br>
## License
BLAST_TSG is licensed under GPL v3.0. 


## Citation
In preparation. 
