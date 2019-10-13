#compute the impact on cell fate genes
computeImpact<-function(shortest_Network,miRNA_FC){
  #shortest_Network<-shortestNetwork
  #miRNA_FC<-breast_miRNA_FC
  miRNA_shortestNet<-merge(miRNA_FC,shortest_Network,by.x="Gene",by.y="GeneName")
  for (i in 1:125) {
    
    miRNA_shortestNet[,i+3]<-(-miRNA_shortestNet[,3])/miRNA_shortestNet[,i+3]
    
  }
miRNA_shortestNet[miRNA_shortestNet==Inf|miRNA_shortestNet==-Inf]<-0  
CellFate_Impact<-data.frame(colSums(miRNA_shortestNet[,c(4:128)]))
miRNA_shortestNet1<-miRNA_shortestNet[,c(-1,-3)]
miRNA_Impact<-aggregate(miRNA_shortestNet1[,-1],data.frame(miRNA_shortestNet1$miRNA),sum)

resultlist<-list(CellFate_Impact,miRNA_Impact)

}

miRNA_shortestNet[miRNA_shortestNet==Inf|miRNA_shortestNet==-Inf]<-0
