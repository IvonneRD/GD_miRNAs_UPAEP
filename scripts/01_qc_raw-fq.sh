#!/bin/bash

fqDir=../fq/

outDir=../fq/UPAEP_raw-fq_qc-reports

mkdir -p ${outDir}



fastqc ${fqDir}/*.fastq.gz \
 -o ${outDir} \
 -t 10


multiqc \
        -n UPAEP_raw-fq-qc_multiQC-report \
        -i UPAEP_raw-fq-qc \
        -o ${outDir} \
        ${outDir}
