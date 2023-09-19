#!/bin/bash

starFcDir=../03_output/fc_output/
FCreportOutDir=../03_output/fc_output/fc_multiqc_report

mkdir -p ${FCreportOutDir}

#For a unique summary file
	multiqc -n UPAEP-project_STAR-FeatCounts_multiqc_report \
	-i STAR_FeatureCounts-report \
	-o ${FCreportOutDir} \
	${starFcDir}/UPAEP-project_fc-output-table.txt.summary

