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
The target-specific genes are extracted using ```Orthogroups.GeneCount.tsv``` file from OrthoFinder. ```Orthogroups.GeneCount.tsv``` is genellary output to ```/OrthoFinder/Result_XX/Orthogroups/```. Change line 7 of script to ```$X==0``` for the non-target species, and ```$X>=1``` for the target species, depending on the data input by the users. If you need high-copied targets, increase the value at target species (e.g. ```$X>=3```). Change the CDS sequence on 27 and 35 lines depend on your target species.

### 2. BLAST for the non-target species to exclude the non-specific sequences.
Extract target-specific sequence from target-specific genes. All genomes used in analysis need to be made blast database in advance. BLAST1 is performed for non-target species to exclude non-specific sequences. Here, blastdb name that are non-target species should be specified in ```-db```.

### 3. BLAST for target species to extract target-specific sequences.
BLAST2 is performed for target species to extract target-specific sequences. Here, blastdb name that are target species should be specified in ```-db```. For group-specific sequence extraction, run BLAST3 or later for other target species. Finally, extracted candidate sequences of primers are recorded in ```./primer_candidates_target_specific_final.txt```.

### 4. Rank the genes for the most target-specific sequences designed.
After BLAST step, genes are ranked by the number of target-specific sequences, and record in ```./result.log```.
```
******************************

    Target-specific gene search result

    Target-specific genes: 46
    Primer candidates:  8093

    Top 5 genes ranked by designed primer candidates
    536 >lcl|AP014957.1_cds_BAS70124.1_217
    463 >lcl|AP014957.1_cds_BAS70126.1_219
    370 >lcl|AP014957.1_cds_BAS70127.1_220
    329 >lcl|AP014957.1_cds_BAS70182.1_275
    327 >lcl|AP014957.1_cds_BAS73789.1_3882

    Orthogroup of the Top5 genes belonging
     1 OG0001175
     2 OG0001175
     3 OG0001175
     4 OG0001457
     5 OG0001549

******************************
```

### 5. Rank the exons for the most target-specific sequences designed.
Finally, 
```
******************************

No. of primers  Chr     Start   End     Gene ID Theor   Cover rate (%)
1     279 AP014957.1    1178202 1178683 BAS70127.1 92 303.261
2     279 AP014957.1    1178202 1178683 BAS70126.1 92 303.261
3     279 AP014957.1    1178202 1178683 BAS70124.1 92 303.261
4     273 AP014957.1    1497686 1499131 BAS70182.1 285 95.7895
5     213 AP014957.1    1176905 1177273 BAS70127.1 69 308.696

******************************
```

## License
BLAST_TSG is licensed under GPL v3.0.

## Citation
In preparation.
