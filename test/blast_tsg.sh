#!/bin/bash

#change the directory of following files depending on your environment
#Orthogroups.GeneCount.tsv
#genomic.fasta
#cds.fasta
#genomic.gff

#change number of theread depending on your environment


mkdir ./blast_results
mkdir ./gene_ranking
mkdir ./exon_ranking

#grep the target-specific Orthogroups ID
awk \
    '$2>=5 && $3==0 && $4==0 && $5==0 && $6==0 && $7==0 && $8==0 && $9==0 && $10==0 && $11==0 && $12==0 {print $1}' \
    ./Orthogroups.GeneCount.tsv \
    > ./target_specific_orthogroups.tsv

#grep the target-specific gene ID
grep \
    -f ./target_specific_orthogroups.tsv \
    ./Orthogroups.txt \
    | awk \
        '{$1=""; print}' \
        | awk \
            'gsub(" ","\n")' \
            | awk \
                'NF' \
                > ./target_specific_genes.txt

#Remove the CDS sequence wrapping
if [ -e ./cds_from_genomic_w0.fna ];then
    echo 'The CDS sequence is one liner. Skip removing wrap.'
    else (fasta_formatter \
            -i ./cds_from_genomic.fna \
            > ./cds_from_genomic_w0.fna)
fi

#grep the target-specific gene sequence
grep \
    -A 1 \
    -f ./target_specific_genes.txt \
    ./cds_from_genomic_w0.fna \
    > ./target_specific_gene_cds_sequences.fasta

#get 25 bp sliding sequences of the target-specific gene
seqkit sliding \
    -j 48 \
    -s 5 \
    -W 25 \
    ./target_specific_gene_cds_sequences.fasta \
    > ./target_specific_gene_cds_sliding_sequences.fasta

#makeblastdb
if [ -e ./IRGSP1.0_chr1.ndb ];then
    echo 'IRGSP1.0_chr1 blastdb files is exist. Skip makeblastdb.'
    else (makeblastdb \
            -in ./GCA_001433935.1_IRGSP-1.0_genomic_chr1_w0.fna \
            -dbtype nucl \
            -parse_seqids \
            -out ./IRGSP1.0_chr1)
fi

if [ -e ./IRGSP1.0_chr2.ndb ];then
    echo 'IRGSP1.0_chr2 blastdb files is exist. Skip makeblastdb.'
    else (makeblastdb \
            -in ./GCA_001433935.1_IRGSP-1.0_genomic_chr2_w0.fna \
            -dbtype nucl \
            -parse_seqids \
            -out ./IRGSP1.0_chr2)
fi

if [ -e ./IRGSP1.0_chr3.ndb ];then
    echo 'IRGSP1.0_chr3 blastdb files is exist. Skip makeblastdb.'
    else (makeblastdb \
            -in ./GCA_001433935.1_IRGSP-1.0_genomic_chr3_w0.fna \
            -dbtype nucl \
            -parse_seqids \
            -out ./IRGSP1.0_chr3)
fi

if [ -e ./IRGSP1.0_chr4.ndb ];then
    echo 'IRGSP1.0_chr4 blastdb files is exist. Skip makeblastdb.'
    else (makeblastdb \
            -in ./GCA_001433935.1_IRGSP-1.0_genomic_chr4_w0.fna \
            -dbtype nucl \
            -parse_seqids \
            -out ./IRGSP1.0_chr4)
fi

if [ -e ./IRGSP1.0_chr5.ndb ];then
    echo 'IRGSP1.0_chr5 blastdb files is exist. Skip makeblastdb.'
    else (makeblastdb \
            -in ./GCA_001433935.1_IRGSP-1.0_genomic_chr5_w0.fna \
            -dbtype nucl \
            -parse_seqids \
            -out ./IRGSP1.0_chr5)
fi

if [ -e ./IRGSP1.0_chr6.ndb ];then
    echo 'IRGSP1.0_chr6 blastdb files is exist. Skip makeblastdb.'
    else (makeblastdb \
            -in ./GCA_001433935.1_IRGSP-1.0_genomic_chr6_w0.fna \
            -dbtype nucl \
            -parse_seqids \
            -out ./IRGSP1.0_chr6)
fi

if [ -e ./IRGSP1.0_chr7.ndb ];then
    echo 'IRGSP1.0_chr7 blastdb files is exist. Skip makeblastdb.'
    else (makeblastdb \
            -in ./GCA_001433935.1_IRGSP-1.0_genomic_chr7_w0.fna \
            -dbtype nucl \
            -parse_seqids \
            -out ./IRGSP1.0_chr7)
fi

if [ -e ./IRGSP1.0_chr8.ndb ];then
    echo 'IRGSP1.0_chr8 blastdb files is exist. Skip makeblastdb.'
    else (makeblastdb \
            -in ./GCA_001433935.1_IRGSP-1.0_genomic_chr8_w0.fna \
            -dbtype nucl \
            -parse_seqids \
            -out ./IRGSP1.0_chr8)
fi

if [ -e ./IRGSP1.0_chr9.ndb ];then
    echo 'IRGSP1.0_chr9 blastdb files is exist. Skip makeblastdb.'
    else (makeblastdb \
            -in ./GCA_001433935.1_IRGSP-1.0_genomic_chr9_w0.fna \
            -dbtype nucl \
            -parse_seqids \
            -out ./IRGSP1.0_chr9)
fi

if [ -e ./IRGSP1.0_chr10.ndb ];then
    echo 'IRGSP1.0_chr10 blastdb files is exist. Skip makeblastdb.'
    else (makeblastdb \
            -in ./GCA_001433935.1_IRGSP-1.0_genomic_chr10_w0.fna \
            -dbtype nucl \
            -parse_seqids \
            -out ./IRGSP1.0_chr10)
fi

if [ -e ./IRGSP1.0_chr11.ndb ];then
    echo 'IRGSP1.0_chr11 blastdb files is exist. Skip makeblastdb.'
    else (makeblastdb \
            -in ./GCA_001433935.1_IRGSP-1.0_genomic_chr11_w0.fna \
            -dbtype nucl \
            -parse_seqids \
            -out ./IRGSP1.0_chr11)
fi

if [ -e ./IRGSP1.0_chr12.ndb ];then
    echo 'IRGSP1.0_chr12 blastdb files is exist. Skip makeblastdb.'
    else (makeblastdb \
            -in ./GCA_001433935.1_IRGSP-1.0_genomic_chr12_w0.fna \
            -dbtype nucl \
            -parse_seqids \
            -out ./IRGSP1.0_chr12)
fi

#BLAST_1 for the reference genomes of the non-target-species
blastn \
    -evalue 1e-2 \
    -num_threads 48 \
    -task blastn-short \
    -db "./IRGSP1.0_chr2 \
        ./IRGSP1.0_chr3 \
        ./IRGSP1.0_chr4 \
        ./IRGSP1.0_chr5 \
        ./IRGSP1.0_chr6 \
        ./IRGSP1.0_chr7 \
        ./IRGSP1.0_chr8 \
        ./IRGSP1.0_chr9 \
        ./IRGSP1.0_chr10 \
        ./IRGSP1.0_chr11 \
        ./IRGSP1.0_chr12" \
    -query ./target_specific_gene_cds_sliding_sequences.fasta \
    -outfmt 7 \
    -out ./blast_results/result_blast1.txt

#grep 25 bp sliding sequences ID that do not hit the reference genome of the non-target-species
grep \
    -B 3 \
    "# 0 hits found" \
    ./blast_results/result_blast1.txt \
    > ./blast_results/result_blast1_0_hit.txt

grep \
    "Query" \
    ./blast_results/result_blast1_0_hit.txt \
    | awk \
        'gsub("# Query: ","")' \
        > ./blast_results/result_blast1_0_hit_2.txt

#grep 25 bp sliding sequences that do not hit the reference genome of the non-target-species
grep \
    -A 1 \
    -f ./blast_results/result_blast1_0_hit_2.txt \
    ./target_specific_gene_cds_sliding_sequences.fasta \
    > ./blast_results/primer_candidate_blast1.txt

#BLAST_2 for the reference genome of the target-species
blastn \
    -evalue 1e-2 \
    -num_threads 48 \
    -task blastn-short \
    -db "./IRGSP1.0_chr1" \
    -query ./blast_results/primer_candidate_blast1.txt \
    -outfmt 7 \
    -out ./blast_results/result_blast2.txt

#grep 25 bp sliding sequences ID that do not hit the reference genome of the target-species
grep \
    -B 3 \
    "# 0 hits found" \
    ./blast_results/result_blast2.txt \
    > ./blast_results/result_blast2_0_hit.txt

#exclude 25 bp sliding sequences that do not hit the reference genome of the target-species
grep \
    -v \
    -f ./blast_results/result_blast2_0_hit.txt \
    ./blast_results/result_blast2.txt \
    > ./blast_results/result_blast2_2.txt

grep \
    "Query" \
    ./blast_results/result_blast2_2.txt \
    | awk \
        'gsub("# Query: ","")' \
        > ./blast_results/result_blast2_3.txt

#grep 25 bp sliding sequences that hit the reference genome of the target-species
grep \
    -A 1 \
    -f ./blast_results/result_blast2_3.txt \
    ./target_specific_gene_cds_sliding_sequences.fasta \
    > ./primer_candidate_target_specific_final.txt

#gene_ranking
stat_genes=$(awk \
                'gsub("_sliding.*","")' \
                ./primer_candidate_target_specific_final.txt \
                | uniq \
                | wc \
                    -l)

stat_primers=$(grep \
                ">" \
                ./primer_candidate_target_specific_final.txt \
                | wc \
                    -l)

top5=$(awk \
        'gsub("_sliding.*","")' \
        ./primer_candidate_target_specific_final.txt \
        | uniq \
            -c \
            | sort \
                -nr \
                | head \
                    -5 \
                    | tee \
                        ./gene_ranking/top5.txt)

orthogroup=$(for f in 1 2 3 4 5
        do
                awk \
                    'gsub(".*cds_","")' \
                    ./gene_ranking/top5.txt \
                    | awk \
                        'gsub("_.*","")' \
                        | awk \
                            "NR==${f}" \
                            > ./gene_ranking/top5_${f}.txt
                grep \
                    -f ./gene_ranking/top5_${f}.txt \
                    ./Orthogroups.txt \
                    > ./gene_ranking/top5_grep_${f}.txt
        done

                cat \
                    ./gene_ranking/top5_grep* \
                    | awk \
                        '{print "     " NR, $0}' \
                        | awk \
                            gsub'(":.*","")')

echo \
"******************************
 
    Target-specific gene search result
 
    Target-specific genes: $stat_genes
    Primer candidates:  $stat_primers

    Top 5 genes ranked by designed primer candidates
$top5

    Orthogroup of the Top5 genes belonging
$orthogroup
 
******************************" \
    | tee \
        ./gene_ranking_result.log

#exon_ranking
#extract CDS and exon positions from the genome annotation file.
if [ -e ./genomic_CDS_exon.gff ];then
    echo 'The annotation file is already filtered. Skip filtering.'
    else (grep \
            -e "CDS" \
            -e "exon" \
            ./genomic.gff \
            > ./genomic_CDS_exon.gff)
fi

cat \
    ./gene_ranking/top5_[1-5].txt \
    > ./gene_ranking/top5_gene_ID.txt

#extract the exon positions of the top5 genes from the annotation file.
grep \
    -f ./gene_ranking/top5_gene_ID.txt \
    ./genomic_CDS_exon.gff \
    | awk \
        '{print $1":"$4"-"$5}' \
        > ./exon_ranking/top5_exon_pos.txt

#extract the exon positions of the top5 genes and their gene ID from the annotation file.
grep \
    -f ./gene_ranking/top5_gene_ID.txt \
    ./genomic_CDS_exon.gff \
    | awk \
        '{print $1,$4,$5,$9}' \
        | sed \
            's/ID=exon-//g' \
            | sed \
                's/ID=cds-//g' \
                | sed \
                    's/-.*//g' \
                    | sed \
                        's/;.*//g' \
                        > ./exon_ranking/top5_exon_gene_ID.txt

#
for f in {1..5}
    do
        grep \
            -f ./gene_ranking/top5_${f}.txt \
            ./genomic_CDS_exon.gff \
            | awk \
                '{print $1"\t"$4"\t"$5"\t"$9}' \
                | sed \
                    's/ID=exon-//g' \
                    | sed \
                        's/ID=cds-//g' \
                        | sed \
                            's/-.*//g' \
                            | sed \
                                's/;.*//g' \
                                > ./exon_ranking/top5_${f}_exon_gene_ID.txt
    done

#extract the exon sequences of the top5 genes
seqkit \
    faidx \
    --infile-list ./exon_ranking/top5_exon_pos.txt \
    ./GCA_001433935.1_IRGSP-1.0_genomic.fna \
    > ./exon_ranking/top5_exon.fasta

#filter <90 nt of the exon
seqkit \
    seq \
    -m 90 \
    ./exon_ranking/top5_exon.fasta \
    > ./exon_ranking/top5_exon_m90.fasta

#makeblastdb
makeblastdb \
    -in ./exon_ranking/top5_exon_m90.fasta \
    -dbtype nucl \
    -out ./exon_ranking/top5_exon_m90

#BLAST target-specific primers derived from the top5 gene individually to each exon of top5
for f in {1..5}
    do
        grep \
            -A 1 \
            -f ./gene_ranking/top5_${f}.txt \
            ./primer_candidate_target_specific_final.txt \
            > ./exon_ranking/primer_candidate_target_specific_final_${f}.txt

        blastn \
            -evalue 1e-2 \
            -num_threads 48 \
            -task blastn-short \
            -db ./exon_ranking/top5_exon_m90 \
            -query ./exon_ranking/primer_candidate_target_specific_final_${f}.txt \
            -outfmt 6 \
            -out ./exon_ranking/result_top5_exon_m90_${f}.txt

        awk \
            '{print $2}' \
            ./exon_ranking/result_top5_exon_m90_${f}.txt \
            | awk \
                'gsub(":","\t")' \
                | awk \
                    'gsub("-","\t")' \
                    > ./exon_ranking/result_top5_exon_m90_${f}_v2.txt

        bedtools \
            intersect \
            -a ./exon_ranking/top5_${f}_exon_gene_ID.txt \
            -b ./exon_ranking/result_top5_exon_m90_${f}_v2.txt \
            > ./exon_ranking/result_top5_exon_m90_${f}_v3.txt

        cat \
            ./exon_ranking/result_top5_exon_m90_${f}_v3.txt \
            | sort \
            | uniq \
                -c \
                | sort \
                    -nr \
                    > ./exon_ranking/result_top5_exon_m90_${f}_v4.txt
    done

cat \
    ./exon_ranking/result_top5_exon_m90_*_v4.txt \
    > ./exon_ranking/final_top5_exon_m90_individual.txt

awk \
    '{print $0}' \
    ./exon_ranking/final_top5_exon_m90_individual.txt \
    | sort \
        -nr \
        > ./exon_ranking/final_top5_exon_m90_individual_count.txt

#calculate the theoretical number of sliding sequences generated from each exon.
awk \
    '{print ($4-$3-19)/5}' \
    ./exon_ranking/final_top5_exon_m90_individual_count.txt \
    | sed \
        's/\..*//g' \
        > ./exon_ranking/top5_theor_value.txt

awk \
    'NR==FNR {top5[NR]=$1; next} {print $0, top5[FNR]}' \
    ./exon_ranking/top5_theor_value.txt \
    ./exon_ranking/final_top5_exon_m90_individual_count.txt \
    > ./exon_ranking/final_top5_exon_m90_individual_count_v2.txt

#calculate the cover rate of each exon.
awk \
    '{printf "%.1f\n", $1/$6*100}' \
    ./exon_ranking/final_top5_exon_m90_individual_count_v2.txt \
    > ./exon_ranking/top5_cover_rate.txt

awk \
    'NR==FNR {top5[NR]=$1; next} {printf "%5s %10s %10s %10s %5s %5s %1s %5s\n", $1, $2, $3, $4, $5, $6, $7, top5[FNR]}' \
    ./exon_ranking/top5_cover_rate.txt \
    ./exon_ranking/final_top5_exon_m90_individual_count_v2.txt \
    > ./final_exon_ranking.txt

exon_ranking=$(cat \
                ./final_exon_ranking.txt \
                | head \
                    -5 \
                    | awk \
                        '{print "     " NR, $0}')

echo \
"******************************

    Target-specific exon search result

    No. HIT Chromosome   Start      End      Protein ID   Theor Cover rate (%)
$exon_ranking

******************************" \
    | tee exon_ranking_result.log
