normalization_function<-function(dataset,logFoldchange){
  
  #样本内标准化
  sum_col<-apply(dataset, 2, sum)
  
  sum_col1<-sum_col
  for (i in 1:(length(dataset[,1])-1)) {
    sum_col<-rbind(sum_col,sum_col1)
  }
  dataset<-1000*dataset/sum_col
  
  #筛选FC大的基因
  dataset$mean1<-apply(dataset[,c(1:(length(dataset)/2))],1,mean)
  dataset$mean2<-apply(dataset[,c((1+(length(dataset)-1)/2):(length(dataset)-1))],1,mean)
  dataset$log2FC<-abs(log2(dataset$mean1/dataset$mean2))
  dataset<-dataset[dataset$log2FC>logFoldchange,]
  dataset<-dataset[,c(1:(ncol(dataset)-3))]
  
  
  #样本间标准化
  dataset$mean<-rowMeans(dataset)
  dataset$sd<-apply(dataset[,c(1:(length(dataset)-1))],1,sd)
  dataset_means<-as.matrix(dataset$mean)
  for (i in 1:(ncol(dataset)-3)) {
    dataset_means<-cbind(dataset_means,as.matrix(dataset$mean))
  }
  
  dataset_sds<-as.matrix(dataset$sd)
  for (i in 1:(ncol(dataset)-3)) {
    dataset_sds<-cbind(dataset_sds,as.matrix(dataset$sd))
  }
  
  dataset_nor<-dataset[,c(1:(length(dataset)-2))]-dataset_means
  dataset_nor<-dataset_nor/dataset_sds
  dataset_nor[dataset_nor>3]<-3
  dataset_nor[dataset_nor<(-3)]<-(-3)
  dataset_nor1<-dataset_nor
  
  
  
  
  
  
  
}