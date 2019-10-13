miRNAdataProcessing2<-function(miRNAdata,topmiRNA)
{
  #miRNAcancer<-miRNAbreastTumor
  #miRNAnormal<-miRNAbreastNormal
  #topmiRNA<-top50miRNA_breast
  #library(sqldf)
  #读入miRNA前体与成熟体对照表
  preMatureMiRNA<-read.table('F:/xupeng/Biological data/pre-mature-miRNA.txt',header = TRUE)
  colnames(preMatureMiRNA)[]<-c("premiRNA","maturemiRNA")
  
  #DEmiRNA<-GeneDESeq2(miRNAcancer,miRNAnormal)
  #DEmiRNA1<-data.frame(DEmiRNA[c(1:50),1])
  #miRNA_expression<-merge(miRNAcancer,miRNAnormal,by.x ="Keys",by.y = "Keys" )
  colnames(miRNAdata)[1]<-c("miRNA")
  miRNA_expression<-merge(preMatureMiRNA,miRNAdata,by.x="premiRNA",by.y="miRNA")
  miRNA_expression<-miRNA_expression[,c(-1)]
  miRNA_expression<-merge(topmiRNA,miRNA_expression,by.x="miRNA",by.y="maturemiRNA")
  miRNA_expression<-aggregate(miRNA_expression[,-1],data.frame(miRNA_expression$miRNA),sum)
  
  #miRNA_expression1<-miRNA_expression[!duplicated(miRNA_expression),]
  #DEmiRNA_expression<-sqldf("SELECT * from miRNA_expression where Keys in (select * from DEmiRNA1)")
  
  rownames(miRNA_expression)<-miRNA_expression[,1]
  miRNA_expression<-miRNA_expression[,-1]
  #colnames(miRNA_expression)[1:(ncol(miRNA_expression)/2)]<-paste("cancer",1:(ncol(miRNA_expression)/2),sep = "")
  #colnames(miRNA_expression)[(ncol(miRNA_expression)/2+1):ncol(miRNA_expression)]<-paste("normal",1:(ncol(miRNA_expression)/2),sep = "")
  source('F:/xupeng/R_work/细胞命运平衡/normalization_function.R')
  miRNAdata<-normalization_function(miRNA_expression,logFoldchange = 0)
  
}
