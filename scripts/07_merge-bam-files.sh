#!/bin/bash
starOutDir=/home/epigen/projects/proyecto_Dra-Elizabeth/03_output/UPAEP_star_hg38_alignment
bamOutDir=${starOutDir}/all-bams
mkdir -p ${bamOutDir}

find \
        ${starOutDir} -name "*_Aligned.sortedByCoord.out.bam" \
	-exec ln -s {} ${bamOutDir} \;
