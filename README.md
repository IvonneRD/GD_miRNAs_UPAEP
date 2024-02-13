# Analysis of the impact of gestational diabetes (GD) on gene regulation and clinical aspects of neurodevelopment.

[![Ubuntu](https://img.shields.io/badge/ubuntu-%E2%89%A518.04-orange.svg)](https://releases.ubuntu.com/18.04/)
[![Miniconda](https://img.shields.io/badge/Miniconda-%E2%89%A523.5-green.svg)](https://docs.anaconda.com/free/miniconda/index.html)
[![R](https://img.shields.io/badge/R-%E2%89%A54.2.2-blue.svg)](https://cran.r-project.org/bin/windows/base/old/4.2.2/)

---
### The aim of this project was to perform a comparative analysis of miRNA expression and to relate them to aspects of neurodevelopment in order to understand the pathophysiology of the disease. The study consisted in the analysis of two groups of newborns, the first one exposed in-utero to GD and the second one was a control group. Neurodevelopmental assessment was performed between 6 and 12 months of age and the extraction of mirNAs from heel blood sample, to later perform next-generation sequencing and miRNA-Seq Analysis.
---
## miRNA-Seq Analysis Workflow Summary

1. fastq quality control (`fastqc`)
2. fastq trimming (`trimmomatic`)
3. Genome Alignment (`star`)
4. Gene counts estimation (`featureCounts`)
5. Differential Expression Analysis (`DESeq2 (DS2.R)`)
6. Differential Expression Analysis Visualizations (`DS2-Vis.R`)

## Workflow overview
![General Workflow](docs/Workflow.png) 
---

## Requirements

### Compatible OS

-   [Ubuntu 18.04 ](http://releases.ubuntu.com/18.04/)
-   [Ubuntu 20.04 ](http://releases.ubuntu.com/20.04/)


### Software:
| Requirement | Version  | Required Commands * |
|:---------:|:--------:|:-------------------:|
| [Miniconda] | > 23.5 | conda env create, conda activate, conda deactivate, conda env list, conda list (https://docs.conda.io/projects/conda/en/latest/commands/index.html) |
|fastqc|||
|trimmomatic|||
|STAR|||
|featureCounts|||
|R|||




#### R packages needed:

|                    Requirement                     |          Use in workflow   |  
|:--------------------------------------------------:|:--------------------------:|
|        [vroom](https://www.tidyverse.org/blog/2019/05/vroom-1-0-0/)        | Dataframe reading |
|        [stringr](https://cran.r-project.org/web/packages/stringr/index.html)        | Regular expression manipulation |
|          [ggplot2](https://cran.r-project.org/web/packages/ggplot2/index.html)          |   PBS calculation; plots development |
|          [tidyr](https://cran.r-project.org/web/packages/tidyr/index.html)          |   preprocessing and PBS calculation; data frame manipulation |
|        [scales](https://scales.r-lib.org/)        | Results visualization |



\* Miniconda is required to install all the software needed; the commands from all the software is accesible from Miniconda `$PATH` (*i.e.* you should be able to invoke them from your command line).  
\* These commands must be accessible from your `$PATH` (*i.e.* you should be able to invoke them from your command line).  
