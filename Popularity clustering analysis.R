#seen as there is no apparent linear relationship we will try classification 
#lets first check that the data is shuffled 
head(SpotifyData)
#data is already shuffled 

#now we split out data set into testing and training 
#this is quite a large data set, and we want to maximise the training data so we will do a 80:20 split 
train_size = 0.8
Spotify_train<-SpotifyData[1:(train_size*nrow(SpotifyData)),]
Spotify_test<-SpotifyData[nrow(Spotify_train)+1:nrow(SpotifyData),]

train_size2 = 0.7
SpotifyAverages_train<-SpotifyAverages[1:(train_size2*nrow(SpotifyAverages)),]
SpotifyAverages_test<-SpotifyAverages[nrow(Spotify_train)+1:nrow(SpotifyAverages),]
#we will visualize with a graph of independent variables, where popularity is represented by the size of the points 
ggplot(data=Spotify_train,
       aes(x=instrumentalness, y=valence))+
  geom_point(aes(colour = popularity))+
  scale_color_gradient()

ggplot(data=SpotifyAverages_train,
       aes(x=instrumentalness_mean, y=valence_mean))+
  geom_point(aes(colour = popularity_mean), size=3)+
  scale_color_gradient()

#it is much easier to visualize with the averaged data set so we will use that one for our clustering 
#try with some other variables
ggplot(data=SpotifyAverages_train,
       aes(x=duration_ms_mean, y=danceability_mean))+
  geom_point(aes(colour = popularity_mean), size=3)+
  scale_color_gradient()

ggplot(data=SpotifyAverages_train,
       aes(x=duration_ms_mean, y=energy_mean))+
  geom_point(aes(colour = popularity_mean), size=3)+
  scale_color_gradient()

ggplot(data=SpotifyAverages_train,
       aes(x=duration_ms_mean, y=key_mean))+
  geom_point(aes(colour = popularity_mean), size=3)+
  scale_color_gradient()

ggplot(data=SpotifyAverages_train,
       aes(x=duration_ms_mean, y=loudness_mean))+
  geom_point(aes(colour = popularity_mean), size=3)+
  scale_color_gradient()

ggplot(data=SpotifyAverages_train,
       aes(x=duration_ms_mean, y=mode_mean))+
  geom_point(aes(colour = popularity_mean), size=3)+
  scale_color_gradient()
#seeing some correlation between mode and duration, and key and duration so lets get cor values 
cor(SpotifyAverages$duration_ms_mean, SpotifyAverages$mode_mean)
cor(SpotifyAverages$duration_ms_mean, SpotifyAverages$loudness_mean)    
#a lot higher correlations here than we've seen before 



