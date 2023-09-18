#!/bin/bash

# set duration time var
SECONDS=0

# DIR FOR INPUTS
fqDir=../01_fq
adapDir=/home/epigen/miniconda3/pkgs/trimmomatic-0.39-hdfd78af_2/share/trimmomatic-0.39-2/adapters

# DIR FOR OUTPUTS
outDir=../02_trimmed_fq_files

mkdir -p ${outDir}

# DEBUG echo comments
echo "[DEBUG] trimmomatic process started"


# for loop trimmomatic process
for fq in ${fqDir}/*1.fastq.gz
	do
	#	echo ${fq}
		fqbase=$(basename ${fq} .fastq.gz)
# print fq filename
		echo "[DEBUG] Trimming file ${fqbase}"

# do trimming
# on simple end fq files
		trimmomatic SE \
		-threads 10 \
		-phred33 \
		${fqDir}/${fqbase}.fastq.gz \
		${outDir}/${fqbase}.trim.fastq.gz \
		ILLUMINACLIP:${adapDir}/TruSeq3-SE.fa:2:30:10 \
		SLIDINGWINDOW:4:15 \
		MINLEN:4 \
	 &> ${outDir}/${fqbase}_trimmomatic.log

	duration=${SECONDS}
	echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed." \
	> ${outDir}/${base}_execution_time.txt

	done

# References:
# https://www.biostars.org/p/288031/
# https://datacarpentry.org/wrangling-genomics/03-trimming.html
