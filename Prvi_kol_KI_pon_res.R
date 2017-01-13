libs <- c("dplyr", "ggplot2")
lapply(libs, require, character.only = TRUE)

str(esoph)
head(esoph)

summary(esoph)

prob_case <- sum(esoph$ncases)/sum(esoph$ncases + esoph$ncontrols)
prob_contr <- 1 - prob_case

esoph %>% 
  filter(alcgp != "0-39" & tobgp == "30+") %>% 
  summarise(n = n(), sum_case = sum(ncases), sum_contr = sum(ncontrols), prob = sum_case / sum_contr)




ggplot(esoph, aes( x = ncases)) +
  geom_histogram(fill = "steelblue", color = "black", binwidth = 1) +
  facet_wrap(~ agegp)
  