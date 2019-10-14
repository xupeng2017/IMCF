# IMCF
## Introduction
* IMCF is the Influence of MiRNAs on Cell Fate genes, which is computed based on shortest path method .
## Overview of the IMCF pipelines service
* #Step 1: compute the FC of miRNAs in cancer versus that in normal samples;
  * #Liver_miRNAraw1 is miRNAs the expression matrix;
  * #Liver_group is the group information about the samples in the expression matrix.
  * Liver_FC<-cellfateProject_FC1(Liver_miRNAraw1,Liver_group)
* #Step 2: compute the influence of miRNA on cell fate genes
  * Liver_impact<-computeImpact(shortestNetwork,Liver_FC)
