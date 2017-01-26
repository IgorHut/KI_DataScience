libs <- c("dplyr", "ggplot2")
lapply(libs, require, character.only = TRUE)


# 1.  a. Obavestite se o sadrzaju seta podataka: `help("esoph")` ili `?esoph` 
# Koristeci odgovarajuce naredbe proverite strukturu seta podataka, sadrzaj 6
# prvih vrsta kao i 6 poslednjih vrsta. 
#    b. Ispisite sumarnu statistiku za dati skup podataka.

#a.
?esoph
str(esoph)
head(esoph)
tail(esoph)

# b.
summary(esoph)

# 2.Kolika je verovatnoca, u okviru datog skupa podataka (uzorka), da posmatrani
# subjekt ima karcinom a kolika da nema? (*Napomena: termin "case" se odnosi na
# prisustvo karcinoma a "control" na kontrolni subjekat koji nema karcinom*)
prob_case <- sum(esoph$ncases)/sum(esoph$ncases + esoph$ncontrols)
prob_case #verovatnoca da pacijent ima karcinom (procenat obolelih od karcinoma)
          #je 0.1702 odn. 17.02%

prob_contr <- 1 - prob_case
prob_contr #verovatnoca da posmatrani pacijent nema karcinom je 0.8297 odn. 82.97%

#3.
# a. Kolika je verovatnoca da je subjekt koji konzumira vise od 39g alkohola
# na dan ili vise od 30g duvana na dan oboleo od karcinoma?
esoph %>% 
  filter(alcgp == "40-79" | alcgp == "80-119" | alcgp == "120+" | tobgp == "30+") %>% 
  summarise(sum_case = sum(ncases), sum_contr = sum(ncontrols), 
            prob = sum_case / (sum_contr + sum_case))

# U grupi ispitanika koja zadovolja postavljene uslove ucestalost obolevanja od
# karcinoma je 23.03%

# b.Koja je verovatnoca da subjekt konzumira vise od 119g alkohola na dan?

pijanci_n <- esoph %>% 
            filter(alcgp == "120+") %>% 
            summarise(n = sum(ncontrols + ncases))
pijanci_n

pijanci_ver <- pijanci_n$n/sum(esoph$ncases + esoph$ncontrols)

pijanci_ver #0.095 odn. 9.5%

# 4.Iscrtati histograme broja obolelih pacijenata u zavisnosti od njihovog godista.
ggplot(esoph, aes( x = ncases)) +
  geom_bar(fill = "steelblue", color = "black") +
  facet_wrap(~ agegp)

# 5.Iscrtati histograme broja obolelih pacijenata u zavisnosti od kolicine
# konzumiranog alkohola.
ggplot(esoph, aes( x = ncases)) +
  geom_bar(fill = "darkorange", color = "black") +
  facet_wrap(~ alcgp)
  