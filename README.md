# Annotation of the Peromyscus_leucopus genome

## Runing BLAST:
> /data/users/gbalderr/ncbi-blast-2.7.1+/bin/blastx  -query Transcripts.fa -db landmarkdb/landmark -out 1.xml -evalue 0.001 -outfmt 5 -num_threads 32

## Annotation with BLAST2Go
The xml output files generated by BLAST were the input to get the annotation with [BLAST2Go](https://www.blast2go.com/) a functional annotation tool 

## PFam from the protein sequences
We used exonerate to map mouse protein coding genes to the peromyscus genome in order to compare mouse domain prevalence with maximum sensitivity. We predicted the Peromyscus proteome using TransDecoder on on the longest isoform per exonerate gene model and predicted protein domains using the PFAM database v.31(https://pfam.xfam.org/) and HMMR 3.1b2 (http://hmmer.org/)  run with default settings and profile reporting threshold of 1e -06. We also did the PFAM analysis on the mouse proteome (GRCm38) with the same parameters. 

  ### _Selecting longer transcript_
  
After obtaining the AA squencences we had to modify the headers to get rid of the patterns and be able to get rid of duplicates

> sed 's/.t*.g* ---NA---/ /g' Protein_seq_Peromyscus.fasta > Protein_A.fasta

> sed 's/.t../ /' Protein_A.fasta > Protein_B.fasta

Then I used an script I found in Github a script  [Keep-longest.py](https://gist.github.com/mkweskin/8869358) to remove duplicates by keep the longest sequence
And my version can be found in []()
> python removedup.py Protein_B.fasta > Peromyscus_Protein.fasta



  ### _Running Pfam_ 
We downloaded the PFam database PFam-A.hmm, so we could match our sequences with the domains. The original script can be found here []()

> module load hmmer/3.1b2

>hmmscan -E 0.000001 --domE 0.001 --tblout Peromyscus.table.txt --domtblout Peromyscus.domains.txt --noali --cpu 32 Pfam-A.hmm /share/samdata/gbalderr/peromyscus/blast/Peromyscus_Protein.fasta

![PFam](https://github.com/GabyBG/Peromyscus_leucopus/blob/master/Figures_GBG/Pfam_vsMouse2.jpeg)




## Repeat analysis using a mammalian database
We used RepeatMasker version opne-4.0.7 (http://repeatmasker.org/) on the Peromyscus, mouse (GRCm38)
and rabbit (OryCun2.0) genomes to annotate interspersed repeats and low complexity DNA sequences. The
search engine used was NCBI/RMBLASTE (2.2.23+) in combination with the option -mammal for indicating the
database to be used.


> module load mchakrab/repeatmodeler/1.0.11
> module load mchakrab/repeatmasker/4.0.7

> RepeatMasker -pa 8 -xsmall -gff -s --species mammal -dir RMoutGBG -e ncbi peromyscus_assembly_scaffolds.fasta

![Repeats](https://github.com/GabyBG/Peromyscus_leucopus/blob/master/Figures_GBG/Repeats.JPG)





