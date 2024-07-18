# BLAST_TSN (Target-Specific Nucleotide sequence)
## Overview
BLAST_TSN is a Bash script that semi-automatically searches for target-specific gene sequences based on data outputted from OrthoFinder (https://github.com/davidemms/OrthoFinder). Users can target organisms that already have genome assemblies, assisting them in the search for target-specific gene sequences.

## Requirement
At the time of release, the related software was tested using the following versions:
<br>
* OrthoFinder v2.5.5
* FASTX-Toolkit v0.0.14
* SeqKit v2.6.1
* BLAST+ v2.15.0
* bedtools v2.31.1

## Usage
### OrthoFinder part
First, OrthiFinder is used to search for target-specific genes. Run OrthoFinder with amino acid sequences of target and non-target species as input files.

### BLAST_TSG part
### 1. Extract the target-specific genes.
The target-specific genes are extracted using ```Orthogroups.GeneCount.tsv``` and ```Orthogroups.txt``` files from OrthoFinder. These files are generally outputted to ```/OrthoFinder/Result_XX/Orthogroups/```. Change line 7 of script to ```$X==0``` for the non-target species, and ```$X>=2``` for the target species, depending on your data. If you need high-copied targets, increase the value at target species.
```
Orthogroup	protein_Os01g_w0	protein_Os02g_w0	protein_Os03g_w0	protein_Os04g_w0	protein_Os05g_w0	protein_Os06g_w0	protein_Os07g_w0	protein_Os08g_w0	protein_Os09g_w0	protein_Os10g_w0	protein_Os11g_w0	protein_Os12g_w0	Total
OG0000840	8	0	0	0	0	0	0	0	0	0	0	0	8
OG0001175	6	0	0	0	0	0	0	0	0	0	0	0	6
OG0001196	6	0	0	0	0	0	0	0	0	0	0	0	6
OG0001209	6	0	0	0	0	0	0	0	0	0	0	0	6
OG0001457	5	0	0	0	0	0	0	0	0	0	0	0	5
OG0001549	5	0	0	0	0	0	0	0	0	0	0	0	5
OG0001616	5	0	0	0	0	0	0	0	0	0	0	0	5
OG0001619	5	0	0	0	0	0	0	0	0	0	0	0	5
```
### 2. BLAST for the non-target species to exclude the non-specific sequences.
Extract target-specific sequence from target-specific genes. BLAST1 is performed for non-target species to exclude non-specific sequences. Here, blastdb name that are non-target species should be specified in ```-db```.

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
Finally, extract the exon sequences of the top 5 genes and ranked by the number of target-specific sequences. The exons with primer candidates designed over their full length (i.e. with high cover rate) may potentially be appropriate for targeting by qPCR. Note that, splicing variants that share the same exons (e.g. BAS70124.1, BAS70126.1 and BAS70127.1) cause over-estimation of cover rate (%). If known in advance, exon ranking should be run by excluding it from the top5 genes.
```
Before ex splicing variants
******************************

    Target-specific exon search result

    No. HIT Chromosome   Start      End      Protein ID   Theor Cover rate (%)
    1   279 AP014957.1    1178202    1178683 BAS70127.1    92   303.3
    2   279 AP014957.1    1178202    1178683 BAS70126.1    92   303.3
    3   279 AP014957.1    1178202    1178683 BAS70124.1    92   303.3
    4   273 AP014957.1    1497686    1499131 BAS70182.1   285    95.8
    5   213 AP014957.1    1176905    1177273 BAS70127.1    69   308.7

******************************
```

```
After ex splicing variants
******************************

    Target-specific exon search result

    No. HIT Chromosome   Start      End      Protein ID   Theor Cover rate (%)
    1   273 AP014957.1    1497686    1499131 BAS70182.1   285    95.8
    2   175 AP014957.1   42685394   42686203 BAS76397.1   158   110.8
    3   160 AP014957.1   28495251   28496112 BAS73789.1   168    95.2
    4    93 AP014957.1    1178202    1178683 BAS70124.1    92   101.1
    5    89 AP014957.1    1172179    1172687 BAS70124.1    97    91.8

******************************
```

## License
BLAST_TSN is licensed under GPL v3.0.

## Citation
In preparation.
