library(tidyverse)
SpotifyData<- read_csv("dataset.csv")
View(SpotifyData)

summary(SpotifyData)
#at first glance we seem to have quite a few normally distributed variables 
#lets plot some variables against each other to get an idea of distribution 

ggplot(SpotifyData, aes(popularity,duration_ms,colour=track_genre))+ 
         geom_point()
       
#make averages by genre as graph is too confusing 
SpotifyAverages<-SpotifyData%>%group_by(track_genre)%>%summarise(across(where(is.numeric), mean, .names="{col}_mean"))
View(SpotifyAverages)

#jjj column with the count of how many tracks are in each genre 
SpotifyAverages$count<-SpotifyData%>%group_by(track_genre)%>%summarise(count=n())

#check count function was done correctly by checking the same for artists
count_artist<-SpotifyData%>%group_by(artists)%>%summarise(count=n())
View(count_artists)

#Check if new graphs are more readable 
ggplot(SpotifyAverages, aes(popularity_mean,duration_ms_mean))+ 
  geom_point()+labs(title = 'Duration and Probability test graph', x='Popularity Mean', y='Duration Mean')

#Check for normality 
hist(SpotifyAverages$popularity_mean)
shapiro.test(SpotifyAverages$popularity_mean)
#normal distribution

hist(SpotifyAverages$duration_ms_mean)
shapiro.test(SpotifyAverages$duration_ms_mean)
#not normal distribution

hist(SpotifyAverages$danceability_mean)
shapiro.test(SpotifyAverages$danceability_mean)
#not normal 

hist(SpotifyAverages$energy_mean)
shapiro.test(SpotifyAverages$energy_mean)
#not normal 

hist(SpotifyAverages$key_mean)
shapiro.test(SpotifyAverages$key_mean)
#not normal 

hist(SpotifyAverages$loudness_mean)
shapiro.test(SpotifyAverages$loudness_mean)
#not normal

hist(SpotifyAverages$mode_mean)
shapiro.test(SpotifyAverages$mode_mean)
#normal 

hist(SpotifyAverages$speechiness_mean)
shapiro.test(SpotifyAverages$speechiness_mean)
#not normal 

hist(SpotifyAverages$acousticness_mean)
shapiro.test(SpotifyAverages$acousticness_mean)
#not normal

hist(SpotifyAverages$instrumentalness_mean)
shapiro.test(SpotifyAverages$instrumentalness_mean)
#not normal

hist(SpotifyAverages$liveness_mean)
shapiro.test(SpotifyAverages$liveness_mean)
#not normal

hist(SpotifyAverages$valence_mean)
shapiro.test(SpotifyAverages$valence_mean)
#normal 

hist(SpotifyAverages$tempo_mean)
shapiro.test(SpotifyAverages$tempo_mean)
#not normal 





#check for correlation 
cor.test(SpotifyAverages$popularity_mean, SpotifyAverages$duration_ms_mean)
#no correlation 

ggplot(SpotifyAverages, aes(popularity_mean,danceability_mean))+ 
  geom_point()
hist(SpotifyAverages$danceability_mean)
#not normally distributed, so use spearman test for correlation instead of default
cor.test(SpotifyAverages$popularity_mean, SpotifyAverages$danceability_mean, method = "spearman", exact=FALSE)
#no correlation 

ggplot(SpotifyAverages, aes(popularity_mean,energy_mean))+ 
  geom_point()
hist(SpotifyAverages$energy_mean)
#not normally distributed so use spearman test for correlation 
cor.test(SpotifyAverages$popularity_mean, SpotifyAverages$energy_mean, method = "spearman", exact = FALSE)
#no correlation 

ggplot(SpotifyAverages, aes(popularity_mean,key_mean))+ 
  geom_point()
hist(SpotifyAverages$key_mean)
shapiro.test(SpotifyAverages$key_mean)
#not normal so use spearman test for correlation 
cor.test(SpotifyAverages$popularity_mean, SpotifyAverages$energy_mean, method = "spearman", exact = FALSE)
#no correlation 

ggplot(SpotifyAverages, aes(popularity_mean,loudness_mean))+ 
  geom_point()
hist(SpotifyAverages$loudness_mean)
#not normally distributed so use spearman test for correlation 
cor.test(SpotifyAverages$popularity_mean, SpotifyAverages$loudness_mean, method = "spearman", exact = FALSE)
#no correlation 

ggplot(SpotifyAverages, aes(popularity_mean,speechiness_mean))+ 
  geom_point()
hist(SpotifyAverages$speechiness_mean)
#not normally distributed so use spearman test for correlation 
cor.test(SpotifyAverages$popularity_mean, SpotifyAverages$speechiness_mean, method = "spearman", exact = FALSE)
#no correlation 

ggplot(SpotifyAverages, aes(popularity_mean,acousticness_mean))+ 
  geom_point()
hist(SpotifyAverages$acousticness_mean)
#not normally distributed so use spearman test for correlation 7
cor.test(SpotifyAverages$popularity_mean, SpotifyAverages$acousticness_mean, method = "spearman", exact = FALSE)
#no correlation 

ggplot(SpotifyAverages, aes(popularity_mean,instrumentalness_mean))+ 
  geom_point()
hist(SpotifyAverages$instrumentalness_mean)
#not normally distributed so use spearman test for correlation 7
cor.test(SpotifyAverages$popularity_mean, SpotifyAverages$instrumentalness_mean, method = "spearman", exact = FALSE)
#no correlation 

ggplot(SpotifyAverages, aes(popularity_mean,liveness_mean))+ 
  geom_point()
hist(SpotifyAverages$liveness_mean)
shapiro.test(SpotifyAverages$liveness_mean)
#not normally distributed so use spearman test for correlation 7
cor.test(SpotifyAverages$popularity_mean, SpotifyAverages$liveness_mean, method = "spearman", exact = FALSE)

ggplot(SpotifyAverages, aes(popularity_mean,valence_mean))+ 
  geom_point()
hist(SpotifyAverages$valence_mean)
shapiro.test(SpotifyAverages$valence_mean)
#normally distributed so use standard cor test 
cor.test(SpotifyAverages$popularity_mean, SpotifyAverages$valence_mean)
#no correlation 

#as there is no correlation between any of these variables and popularity it 
#is not recommended to use regression modelling as a technique, the next step could be 
#one of the following: explore clustering models, use not averaged data to see if there
#is more correlation there, or try to subset the data, or to investigate a different variable as our dependent 

#First, I will check the correlation of my highest correlated variables, when not averaged 
ggplot(SpotifyData, aes(popularity,valence))+ 
  geom_point()
hist(SpotifyData$valence)
#normally distributed so use standard cor test 
cor.test(SpotifyData$popularity, SpotifyData$valence)
#still no correlation 

ggplot(SpotifyData, aes(popularity,instrumentalness))+ 
  geom_point()
hist(SpotifyData$instrumentalness)
#not normally distributed so use Spearman test for correlation 7
cor.test(SpotifyData$popularity, SpotifyData$instrumentalness, method = "spearman", exact = FALSE)
#still no correlation 

#now we will check for correlation within the interquartile range 
#lets make some box plots to check for outliers 
#box plot of popularity by genre 
ggplot(SpotifyData, aes(track_genre, popularity))+
  geom_boxplot(varwidth=TRUE, fill='lightblue')+
  theme(axis.text.x = element_text(angle = 90))+
  labs(Title='Poluatity by genre Boxplots', x='Track Genre', y='Popularity ')
#from making this box plot we can see that the skew, range and outliers within this data set have no consistency
#this suggests that correlation would show similar results even if we only considered the IQR, but we will check anyway
#I will first define outliers to be anything outside of the IQR

Q1<-quantile(SpotifyData$popularity, 0.25)
Q3<-quantile(SpotifyData$popularity, 0.75)
IQR<-IQR(SpotifyData$popularity)
IQR_only<-subset(SpotifyData, SpotifyData$popularity<Q3 & SpotifyData$popularity>Q1)

View(IQR_only)

#now we can see if any correlation is present in just the songs of middle popularity 
#i will again check with  the highest previous correlated 

ggplot(IQR_only, aes(popularity,valence))+ 
  geom_point()
hist(IQR_only$valence)
cor.test(IQR_only$popularity, IQR_only$valence, method = "spearman", exact = FALSE)
#still no correlation 

ggplot(IQR_only, aes(popularity,instrumentalness))+ 
  geom_point()
hist(IQR_only$instrumentalness)
#not normally distributed so use Spearman test for correlation 7
cor.test(IQR_only$popularity, IQR_only$instrumentalness, method = "spearman", exact = FALSE)
#still no correlation 

#this means that popularity is not a good dependent variable for linear regression. Clustering has been tried on a differnet page 
##but more correlation were retrieved to find a different and more useable dependent variable.