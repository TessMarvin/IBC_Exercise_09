#Exercise 9 -- Tess Marvin 
#Problem 1
library("ggplot2")
library("cowplot")
#The following is a data set of brain weight and organism body weight in kg 
brainbody <- read.table(file="brainbody.txt", header = TRUE)
#scatter plot with trendline 
scatter_plot <- ggplot(data=brainbody)+geom_point(aes(x=brain,y=body))+theme_classic()+
  stat_smooth(method = "lm", aes(x=brain,y=body))+ xlab("Organismal Brain Mass (kg)")+
  ylab("Organismal Total Body Mass")

#Problem 2
#Load the data set 
obervs <- read.csv(file="data.txt", header = TRUE)
#Bar plot of the means of the four regions (N,E,S,W)
a = ggplot(data=obervs, aes(x=region, y=observations))+ 
  xlab("Region") + ylab("Observation") + theme_bw()+
  stat_summary(geom="bar", fun.y = "mean")
#Scatter plot of all the observations per region 
b= ggplot(data=obervs, aes(x=region, y=observations))+
  geom_jitter(aes(x=region, y=observations)) +theme_bw()+
  xlab("Region") + ylab("Observation")
plot_grid(a, b, ncol = 2)
# Analysis: we can see from the bar graph that all the regions have similar means at around 15
# The scatter plots of the region indicate that they all have very different distributions. The
# east appears to have a large standard deviation around the mean while the north region 
# has a very small standard deviation. The south region has a bimodal distribution around the mean
# but none of the observations capture the mean. The West distribution is even more spread than 
# the east distribution. 
#Here is the bar graph with standard deviation to demonstrate the differences in error/deviation
c = ggplot(data=obervs, aes(x=region, y=observations))+ 
  xlab("Region") + ylab("Observation") + theme_bw()+
  stat_summary(geom="bar", fun.y = "mean")+
  stat_summary(geom= "errorbar", fun.data="mean_se", width=0.3)
