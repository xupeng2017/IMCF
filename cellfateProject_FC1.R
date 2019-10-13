cellfateProject_FC1<-function(miRNAdataset,sample_group){
  
  source('F:/xupeng/R_work/DE_limma.R')
  source('F:/xupeng/R_work/Ï¸°ûÃüÔËÆ½ºâ/cellfateProject20191007/miRNAdataProcessing2.R')
  
  
  miRNAdataProcessing<-miRNAdataProcessing2(miRNAdataset)
  DE_limma1<-DE_limma(rawexprSet=miRNAdataProcessing,sample_group)
  
  DE_miRNA_FC<-data.frame(row.names(DE_limma1),DE_limma1[,1])
  colnames(DE_miRNA_FC)<-c("miRNA","log2FC")
  
  #merge miRNA and targets database
  DE_miRNA_FC<-merge(DE_miRNA_FC,miRNAtargets,by.x = "miRNA",by.y = "miRNA")
  
  #merge 
  DE_miRNA_FC<-merge(DE_miRNA_FC,GeneInCellFateNet,by.x = "Gene",by.y = "GeneName")
  
  DE_miRNA_FC<-data.frame(DE_miRNA_FC[,c(2,3,1)])
}

