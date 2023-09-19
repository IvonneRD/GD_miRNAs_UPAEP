#!/bin/bash

# define the input and output dirs
fqDir=../02_trimmed_fq_files

outDir=${fqDir}/trm-fq_qc_reports
mkdir -p ${outDir}

# get fastqc reports for trimmed fq samples
fastqc ${fqDir}/*.fastq.gz \
 -o ${outDir} \
 -t 10

#move trimmomatic logs to trimmed fq qc reports
mv ${fqDir}/*.log ${outDir}


# get multiqc report (from fastqc reports) for trimmed fq samples
multiqc \
	-n trm_EB-UPAEP_multiqc-report_v2 \
	-i trm_Ctrl_vs_PXS_v2 \
	-o ${outDir} \
	${outDir}
