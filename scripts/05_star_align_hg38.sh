#!/bin/bash

# input and output  dirs
indexDir=../03_output/gencode_star_index_hg38
gtfDir=../gencode_ref_anno_hg38
fqDir=../02_trimmed_fq_files

# create general out dir

outDir=../03_output/UPAEP_star_hg38_alignment
mkdir -p ${outDir}


# shared Input Dirs if necessary
#sharedIndexDir=/mnt/shared_ubu20/star_index_hg19
#sharedTrimFqDir=/mnt/shared_ubu20/trimmed_no-poly-A-G_fq


# do star alignment

for fq in ${fqDir}/*001.trim.fastq.gz
       do


		fqbase="$(basename ${fq} _001.trim.fastq.gz)"

		echo "[DEBUG] Sample ${fqbase} ready for alignment"


		# create OutDir for individual alignment samples
		alignOutDir=${outDir}/${fqbase}_star_hg38_alignment
		mkdir -p ${alignOutDir}

		echo "[DEBUG] Alignment OutDir for ${fqbase} is ${alignOutDir}"

		# do STAR alignment
		echo "[DEBUG] Executing STAR Alignment process in fq samples: ${fqbase}"
		# start time at 0
		SECONDS=0

		# do STAR alignment for miRNAs
		STAR \
		--runMode alignReads \
		--runThreadN 10 \
		--genomeDir ${indexDir} \
		--readFilesIn ${fq} \
		--readFilesCommand zcat \
		--sjdbGTFfile ${gtfDir}/gencode.v43.annotation.gtf \
		--twopassMode Basic \
		--outFilterMismatchNoverLmax 0.05 \
		--outFilterMatchNmin 16 \
		--outFilterScoreMinOverLread 0 \
		--outFilterMatchNminOverLread 0 \
		--alignIntronMax 1 \
		--outFileNamePrefix ${alignOutDir}/${fqbase}_ \
		--outSAMtype BAM SortedByCoordinate \
		--quantMode TranscriptomeSAM GeneCounts

		# calculate execution time
		duration=${SECONDS}
		echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed" > \
		 ${alignOutDir}/${fqbase}_star_hg38_alignment_executiontime.txt

	done


# References
# https://www.biostars.org/p/9507364/

