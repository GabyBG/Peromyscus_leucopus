#!/bin/bash
#$ -N repMaskMod
#$ -pe openmp 32
#$ -R Y
#$ -q sam,bio,som

module load mchakrab/repeatmodeler/1.0.11
module load mchakrab/repeatmasker/4.0.7


RepeatMasker -pa 8 -xsmall -gff -s --species mammal -dir RMoutGBG -e ncbi peromyscus_assembly_scaffolds.fasta
