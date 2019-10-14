# IMCF
## Introduction
* IMCF is Influence of MiRNAs on Cell Fate genes, which is computed based on shortest path method on the cell fate gene regulatory network.
## Overview of the IMCF pipelines service
* #input miRNAs expression matrix(Liver_miRNAraw1), file about the groups of each sample(Liver_group)
* Liver_FC<-cellfateProject_FC1(Liver_miRNAraw1,Liver_group)
* #compute the influence of miRNA on cell fate genes
* Liver_impact<-computeImpact(shortestNetwork,Liver_FC)
