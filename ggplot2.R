#check and set the directory
getwd()
setwd("/Users/shashismac/Downloads")
getwd()

#install packages
library(ggplot2)
library(readxl)

#Read the data
chromosome = read_xls("Dataset_GGPLOT.xls")

#view/checking the data
View(chromosome)
str(chromosome)
summary(chromosome)
is.na(chromosome)

##plotting the graph
#setting the base
graph = ggplot(chromosome,aes(x=Chromosome,y=Count_in_millions)) +
  labs(x="Chromosomes",y="cytosine count(millions)",title="CYTOSINE DISTRIBUTION")
graph

#adding geom
graph1 = graph + geom_col()
graph1

#adding depth to data
graph2 = graph1 + aes(fill=Context)
graph2

#additional modifications
graph3 = graph + geom_col(position = "dodge") + aes(fill=Context)
graph3

#faceting
graph4 = graph3 + facet_grid(~Context)
graph4

#using predefined colours
graph5 = graph4 + scale_fill_manual(values=c("red","black","brown"))
print(graph5)

#modify background and fonts size
graph6 = graph5 + theme_bw(base_size = 9) + 
  theme(panel.background = element_rect(fill="lightblue"))
graph6

#all in one step
graph_final = ggplot(chromosome,aes(x=Chromosome,y=Count_in_millions)) +
  labs(x="Chromosomes",y="cytosine count(millions)",title="CYTOSINE DISTRIBUTION") +
  geom_col(position = "dodge") + 
  aes(fill=Context) + 
  facet_grid(~Context) +
  scale_fill_manual(values=c("red","black","brown")) + 
  theme_bw(base_size = 20) + 
  theme(panel.background = element_rect(fill="lightblue"))
print(graph_final)
 


