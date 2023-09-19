#!/bin/bash

# start at 0 for execution time calculation
SECONDS=0

# create necessary dirs for output
fcOutDir=../03_output/fc_output
mkdir -p ${fcOutDir}


# create path variables for inputs and outputs
gtfDir=../gencode_ref_anno_hg38/
starBamDir=../03_output/UPAEP_star_hg38_alignment/all-bams



# use featureCounts (from subread conda env)
# for  single pair data
featureCounts \
	-a ${gtfDir}/gencode.v43.annotation.gtf \
	-o ${fcOutDir}/UPAEP-project_fc-output-table_v2.multimap.txt \
	-T 10 \
	-M \
	${starBamDir}/*.bam


# print execution time in new file
duration=${SECONDS}
echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed" > \
${fcOutDir}/executiontime.log
