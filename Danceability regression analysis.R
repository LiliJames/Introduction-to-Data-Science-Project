#the first thing to do before starting any predictive analysis is to set test and training data 

train_size2 = 0.7
SpotifyAverages_train<-SpotifyAverages[1:(train_size2*nrow(SpotifyAverages)),]
SpotifyAverages_test<-SpotifyAverages[nrow(SpotifyAverages_train)+1:nrow(SpotifyAverages),]

#we can create linear regression models for each independent variable and plot them using ggplot

mod_energy<-lm(
  formula = danceability_mean~energy_mean, 
  data = SpotifyAverages_train
)
summary(mod_energy)
#the r squared value for this is very low 

#we can now use this summary to add a regression line to our initial scatter plot
ggplot(
  data=SpotifyAverages_train,
  aes(x=danceability_mean, y=energy_mean)
) + geom_point()+geom_smooth(method = 'lm')+
  labs(title = 'mod_energy',caption='Scatter plot representing mod_energy including regression line and confidence intervals')


mod_loudness<-lm(
  formula = danceability_mean~loudness_mean, 
  data = SpotifyAverages_train
)
summary(mod_loudness)
#slightly better R-squared value 
ggplot(
  data=SpotifyAverages_train,
  aes(x=danceability_mean, y=loudness_mean)
) + geom_point()+geom_smooth(method = 'lm')+
  labs(title = 'mod_loudness',caption='Scatter plot representing mod_loudness including regression line and confidence intervals')


mod_speechiness<-lm(
  formula = danceability_mean~speechiness_mean, 
  data = SpotifyAverages_train
)
  summary(mod_speechiness)
#again a very low R-squared value 
  ggplot(
    data=SpotifyAverages_train,
    aes(x=danceability_mean, y=speechiness_mean)
  ) + geom_point()+geom_smooth(method = 'lm')+
    labs(title = 'mod_speechiness',caption='Scatter plot representing mod_speechiness including regression line and confidence intervals')
  
  
mod_valence<-lm(
    formula = danceability_mean~valence_mean, 
    data = SpotifyAverages_train
  )
summary(mod_valence)
#really good R-squared value for just one variable 
ggplot(
  data=SpotifyAverages_train,
  aes(x=danceability_mean, y=valence_mean)
) + geom_point()+geom_smooth(method = 'lm')+
  labs(title = 'mod_valence',caption='Scatter plot representing mod_valence including regression line and confidence intervals')


mod_liveness<-lm(
  formula = danceability_mean~liveness_mean, 
  data = SpotifyAverages_train
  )
summary(mod_liveness)

ggplot(
  data=SpotifyAverages_train,
  aes(x=danceability_mean, y=liveness_mean)
) + geom_point()+geom_smooth(method = 'lm')+
  labs(title = 'mod_liveness',caption='Scatter plot representing mod_liveness including regression line and confidence intervals')


mod_mode<-lm(
  formula = danceability_mean~mode_mean, 
  data = SpotifyAverages_train
)
summary(mod_mode)

ggplot(
  data=SpotifyAverages_train,
  aes(x=danceability_mean, y=mode_mean)
) + geom_point()+geom_smooth(method = 'lm')+
  labs(title = 'mod_mode',caption='Scatter plot representing mod_mode including regression line and confidence intervals')

#this has shown varying levels of success, but with linear regression adding variables to a model can only make 
#the model more accurate not less, therefore we will use a mulitple linear regression using all these variables 
#loudness and energy have too high correlation so one will have to be removed from the model 
#energy has a lower R-squared value so we will remove this from our model 

model_danceability1<-lm(
  formula= danceability_mean~loudness_mean+speechiness_mean+valence_mean+liveness_mean+mode_mean,
  data=SpotifyAverages_train
)
summary(model_danceability1)
#0.6728 adjusted R-squared value 

#lets see some predictions 
model_danceability_test<-SpotifyAverages_test
model_danceability_test$predicted<-predict(model_danceability1, newdata = SpotifyAverages_test)
model_danceability_test$redisduals<-model_danceability_test$predicted - model_danceability_test$danceability_mean
View(model_danceability_test)

#even though we have used multiple linear regression we can still plot our predicted against our residual values 
plot(model_danceability1)

#we want to see our coefficients in the model to see which variables are the most impactful on predictions
coef(model_danceability1)
#by studying the significance codes returned by this we see that loudness has no significance on the model so it is the best one to remove

model_danceability2<-lm(
  formula= danceability_mean~speechiness_mean+valence_mean+liveness_mean+mode_mean,
  data=SpotifyAverages_train
)
summary(model_danceability2)
#our asjusted R-squared barely changed so this will now become our main model 

#the next lowest significance level is is for speechiness so we will see how much the R-squared value chnages by removing it 

model_danceability3<-lm(
  formula= danceability_mean~valence_mean+liveness_mean+mode_mean,
  data=SpotifyAverages_train
)
summary(model_danceability3)

#removing speechiness lowered our asjusted R-squared value by around 0.05 so it is worth keeping it in 
#therefore, model_danceability2 will be our final model 
#valence has our lowest p-value so it has the most significant effect on the model 

model_danceability_test<-SpotifyAverages_test
model_danceability_test$predicted<-predict(model_danceability2, newdata = SpotifyAverages_test)
model_danceability_test$redisduals<-model_danceability_test$predicted - model_danceability_test$danceability_mean
View(model_danceability_test)

plot(model_danceability2)
plot(model_danceability_test$danceability_mean, model_danceability_test$redisduals)
plot(model_danceability_test$danceability_mean, model_danceability_test$predicted)

