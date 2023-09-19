#!/bin/bash

starLogsDir=../03_output/UPAEP_star_hg38_alignment/

find \
	${starLogsDir} -name "*_Log.final.out" -o -name "*_ReadsPerGene.out.tab" | xargs \
		multiqc -n UPAEP-proyect_STAR-alignment-report \
		-i STAR-alignment-report \
		-o ${starLogsDir}/multiqc_alignment_report

# based on:
# https://unix.stackexchange.com/questions/15308/how-to-use-find-command-to-search-for-multiple-extensions#:~:text=find%20.%2F%20%2Dtype%20f%20%5C(,or%20it%20won't%20work.
# https://www.biostars.org/p/216898/
