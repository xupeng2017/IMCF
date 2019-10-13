DE_limma<-function(rawexprSet,group){
#DGE for microarray by limma
#By XuPeng 2019/10/03
  #rawexprSet<-miRNAdataProcessing
  #ncancer<-102  
  #rawexprSet<-miRNAdataProcessing
  #ncancer<-102
library('gplots')
library('limma')
#library(gcrma)
foldChange=0.5 #fold change=1意思是差异是两倍
padj=0.01#padj=0.05意思是矫正后P值小于0.05
#rawexprSet=read.csv("express-counts2.csv",header=TRUE,row.names=1,check.names = FALSE)  


exprSet=log2(rawexprSet)
#par(mfrow=c(1,2))
#boxplot(data.frame(exprSet),col="blue") ## 画箱式图，比较数据分布情况
#exprSet[1:5,1:5]

#group <- read.csv("datTraits.csv",header=TRUE,row.names=1,check.names = FALSE)
group <- group[,1] #定义比较组，按照癌症和正常样品数目修改#



#group <- c(rep("cancer", times=ncancer),rep("normal", times=nnormal))


design <- model.matrix(~0+factor(group))#把group设置成一个model matrix#
colnames(design)=levels(factor(group))
rownames(design)=colnames(exprSet)


fit <- lmFit(exprSet,design)
#cont.matrix<-makeContrasts(paste0(unique(group),collapse = "-"),levels = design)
cont.matrix<-makeContrasts("cancer-normal",levels = design)
fit2=contrasts.fit(fit,cont.matrix)
fit2 <- eBayes(fit2)  ## default no trend !!!
##eBayes() with trend=TRUE
tempOutput = topTable(fit2,coef=1,n=Inf,adjust="BH") 
nrDEG = na.omit(tempOutput) 

diff <- nrDEG

diffSig = diff[(diff$P.Value < padj & (diff$logFC>foldChange | diff$logFC<(-foldChange))),]#筛选有显著差异的#


}

