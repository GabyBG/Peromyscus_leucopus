# Annotation of the Peromyscus_leucopus genome

## Runing blast:
> /data/users/gbalderr/ncbi-blast-2.7.1+/bin/blastx  -query Transcripts.fa -db landmarkdb/landmark -out 1.xml -evalue 0.001 -outfmt 5 -num_threads 32

## Run Blast2Go


## PFam from the protein sequences
Protein domain analysis was performed with the PFam database v.31(https://pfam.xfam.org/) and HMMR
3.1b2 (http://hmmer.org/) on the longest isoform per gene of the predicted Peromyscus proteome using default
settings and profile reporting threshold of 1e -06. The analysis was repeated on the mouse genome (GRCm38)
with the same parameters.

  ### _Selecting longer transcript_
  
After obtaining the AA squencences we had to modify the headers to get rid of the patterns and be able to get rid of duplicates

> sed 's/.t*.g* ---NA---/ /g' Protein_seq_Peromyscus.fasta > Protein_A.fasta

> sed 's/.t../ /' Protein_A.fasta > Protein_B.fasta

Then I used an script I found a script to remove duplicates by keep the longest sequence [Keep longest transcript](https://gist.github.com/mkweskin/8869358)
And my version can be found in []()


  ### _Running Pfam_ 
> module load hmmer/3.1b2

>hmmscan -E 0.000001 --domE 0.001 --tblout Peromyscus.table.txt --domtblout Peromyscus.domains.txt --noali --cpu 32 Pfam-A.hmm /share/samdata/gbalderr/peromyscus/blast/Peromyscus_Protein.fasta

![PFam](https://github.com/GabyBG/Peromyscus_leucopus/blob/master/FIGURES_GBG/Slide3.JPG)




## Repeat analysis using a mammalian database
Protein domain analysis was performed with the PFam database v.31(https://pfam.xfam.org/) and HMMR
3.1b2 (http://hmmer.org/) on the longest isoform per gene of the predicted Peromyscus proteome using default
settings and profile reporting threshold of 1e -06. The analysis was repeated on the mouse genome (GRCm38)
with the same parameters.


> module load mchakrab/repeatmodeler/1.0.11
> module load mchakrab/repeatmasker/4.0.7

> RepeatMasker -pa 8 -xsmall -gff -s --species mammal -dir RMoutGBG -e ncbi peromyscus_assembly_scaffolds.fasta

![Repeats](https://github.com/GabyBG/Peromyscus_leucopus/blob/master/FIGURES_GBG/Slide1.JPG)





