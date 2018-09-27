#Annotation of the Peromyscus_leucopus genome

##Runing blast:
/data/users/gbalderr/ncbi-blast-2.7.1+/bin/blastx  -query 1.fa -db landmarkdb/landmark -out 1.xml -evalue 0.001 -outfmt 5 -num_threads 32

##Run Blast2Go


##PFam from the protein sequences
  Selecting longer transcript

  Running Pfam 
module load hmmer/3.1b2

hmmscan -E 0.000001 --domE 0.001 --tblout Peromyscus.table.txt --domtblout Peromyscus.domains.txt --noali --cpu 32 Pfam-A.hmm /
share/samdata/gbalderr/peromyscus/blast/Peromyscus_Protein.fasta

![PFam](https://github.com/GabyBG/Peromyscus_leucopus/blob/master/FIGURES_GBG/Slide3.JPG)




##Repeat analysis using a mammalian database


module load mchakrab/repeatmodeler/1.0.11
module load mchakrab/repeatmasker/4.0.7

RepeatMasker -pa 8 -xsmall -gff -s --species mammal -dir RMoutGBG -e ncbi peromyscus_assembly_scaffolds.fasta

![Repeats](https://github.com/GabyBG/Peromyscus_leucopus/blob/master/FIGURES_GBG/Slide1.JPG)





