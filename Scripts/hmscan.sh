#! /bin/bash/
#$ -N hmmscan_pfamv31
#$ -pe openmp 32
#$ -q bio

module load hmmer/3.1b2

hmmscan -E 0.000001 --domE 0.001 --tblout Peromyscus.table.txt --domtblout Peromyscus.domains.txt --noali --cpu 32 Pfam-A.hmm /share/samdata/gbalderr/peromyscus/blast/Peromyscus_Protein.fasta
