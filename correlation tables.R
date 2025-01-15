
#make a correlation table between all average variables 
hist(SpotifyAverages$danceability_mean)
cor(SpotifyAverages$duration_ms_mean, SpotifyAverages$danceability_mean, method = "spearman")

hist(SpotifyAverages$energy_mean)
cor(SpotifyAverages$duration_ms_mean, SpotifyAverages$energy_mean, method = "spearman")

hist(SpotifyAverages$key_mean)
cor(SpotifyAverages$duration_ms_mean, SpotifyAverages$key_mean, method = "spearman")

hist(SpotifyAverages$acousticness_mean)
cor(SpotifyAverages$duration_ms_mean, SpotifyAverages$acousticness_mean, method = "spearman")

hist(SpotifyAverages$instrumentalness_mean)
cor(SpotifyAverages$duration_ms_mean, SpotifyAverages$instrumentalness_mean, method = "spearman")

hist(SpotifyAverages$liveness_mean)
cor(SpotifyAverages$duration_ms_mean, SpotifyAverages$liveness_mean, method = "spearman")

hist(SpotifyAverages$valence_mean)
shapiro.test(SpotifyAverages$valence_mean)
cor(SpotifyAverages$duration_ms_mean, SpotifyAverages$valence_mean, method = "spearman")

hist(SpotifyAverages$tempo_mean)
cor(SpotifyAverages$duration_ms_mean, SpotifyAverages$tempo_mean, method = "spearman")

cor(SpotifyAverages$energy_mean, SpotifyAverages$danceability_mean, method = "spearman")

cor(SpotifyAverages$danceability_mean, SpotifyAverages$key_mean, method = "spearman")

cor(SpotifyAverages$danceability_mean, SpotifyAverages$loudness_mean, method = "spearman")

cor(SpotifyAverages$danceability_mean, SpotifyAverages$mode_mean, method = "spearman")

cor(SpotifyAverages$danceability_mean, SpotifyAverages$speechiness_mean, method = "spearman")

cor(SpotifyAverages$danceability_mean, SpotifyAverages$acousticness_mean, method = "spearman")

cor(SpotifyAverages$danceability_mean, SpotifyAverages$instrumentalness_mean, method = "spearman")

cor(SpotifyAverages$danceability_mean, SpotifyAverages$liveness_mean, method = "spearman")

cor(SpotifyAverages$danceability_mean, SpotifyAverages$valence_mean, method = "spearman")

cor(SpotifyAverages$danceability_mean, SpotifyAverages$tempo_mean, method = "spearman")

cor(SpotifyAverages$energy_mean, SpotifyAverages$key_mean, method = "spearman")

cor(SpotifyAverages$energy_mean, SpotifyAverages$loudness_mean, method = "spearman")

cor(SpotifyAverages$energy_mean, SpotifyAverages$mode_mean, method = "spearman")

cor(SpotifyAverages$energy_mean, SpotifyAverages$speechiness_mean, method = "spearman")

cor(SpotifyAverages$energy_mean, SpotifyAverages$acousticness_mean, method = "spearman")

cor(SpotifyAverages$energy_mean, SpotifyAverages$instrumentalness_mean, method = "spearman")

cor(SpotifyAverages$energy_mean, SpotifyAverages$liveness_mean, method = "spearman")

cor(SpotifyAverages$energy_mean, SpotifyAverages$valence_mean, method = "spearman")

cor(SpotifyAverages$energy_mean, SpotifyAverages$tempo_mean, method = "spearman")

cor(SpotifyAverages$key_mean, SpotifyAverages$loudness_mean, method = "spearman")

cor(SpotifyAverages$key_mean, SpotifyAverages$mode_mean, method = "spearman")

cor(SpotifyAverages$key_mean, SpotifyAverages$speechiness_mean, method = "spearman")

cor(SpotifyAverages$key_mean, SpotifyAverages$acousticness_mean, method = "spearman")

cor(SpotifyAverages$key_mean, SpotifyAverages$instrumentalness_mean, method = "spearman")

cor(SpotifyAverages$key_mean, SpotifyAverages$liveness_mean, method = "spearman")

cor(SpotifyAverages$key_mean, SpotifyAverages$valence_mean, method = "spearman")

cor(SpotifyAverages$key_mean, SpotifyAverages$tempo_mean, method = "spearman")

cor(SpotifyAverages$loudness_mean, SpotifyAverages$mode_mean, method = "spearman")

cor(SpotifyAverages$loudness_mean, SpotifyAverages$speechiness_mean, method = "spearman")

cor(SpotifyAverages$loudness_mean, SpotifyAverages$acousticness_mean, method = "spearman")

cor(SpotifyAverages$loudness_mean, SpotifyAverages$instrumentalness_mean, method = "spearman")

cor(SpotifyAverages$loudness_mean, SpotifyAverages$liveness_mean, method = "spearman")

cor(SpotifyAverages$loudness_mean, SpotifyAverages$valence_mean, method = "spearman")

cor(SpotifyAverages$loudness_mean, SpotifyAverages$tempo_mean, method = "spearman")

cor(SpotifyAverages$mode_mean, SpotifyAverages$speechiness_mean, method = "spearman")

cor(SpotifyAverages$mode_mean, SpotifyAverages$acousticness_mean, method = "spearman")

cor(SpotifyAverages$mode_mean, SpotifyAverages$instrumentalness_mean, method = "spearman")

cor(SpotifyAverages$mode_mean, SpotifyAverages$valence_mean, method = "spearman")

cor(SpotifyAverages$mode_mean, SpotifyAverages$tempo_mean, method = "spearman")

cor(SpotifyAverages$speechiness_mean, SpotifyAverages$acousticness_mean, method = "spearman")

cor(SpotifyAverages$speechiness_mean, SpotifyAverages$instrumentalness_mean, method = "spearman")

cor(SpotifyAverages$speechiness_mean, SpotifyAverages$liveness_mean, method = "spearman")

cor(SpotifyAverages$speechiness_mean, SpotifyAverages$valence_mean, method = "spearman")

cor(SpotifyAverages$speechiness_mean, SpotifyAverages$tempo_mean, method = "spearman")

cor(SpotifyAverages$acousticness_mean, SpotifyAverages$liveness_mean, method = "spearman")

cor(SpotifyAverages$acousticness_mean, SpotifyAverages$instrumentalness_mean, method = "spearman")

cor(SpotifyAverages$acousticness_mean, SpotifyAverages$valence_mean, method = "spearman")

cor(SpotifyAverages$acousticness_mean, SpotifyAverages$tempo_mean, method = "spearman")

cor(SpotifyAverages$instrumentalness_mean, SpotifyAverages$liveness_mean, method = "spearman")

cor(SpotifyAverages$instrumentalness_mean, SpotifyAverages$valence_mean, method = "spearman")

cor(SpotifyAverages$instrumentalness_mean, SpotifyAverages$tempo_mean, method = "spearman")

cor(SpotifyAverages$liveness_mean, SpotifyAverages$valence_mean, method = "spearman")

cor(SpotifyAverages$liveness_mean, SpotifyAverages$tempo_mean, method = "spearman")

cor(SpotifyAverages$tempo_mean, SpotifyAverages$valence_mean, method = "spearman")
