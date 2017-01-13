Osnove programiranja u programskom jeziku R
========================================================
author: Igor Hut
date: 14.11.2016
autosize: true

Relacioni operatori
========================================================
type: sub-section

## ==, !=, <, >, <= i >=

== i !=
====================================================

## Jednako  ==


```r
TRUE == TRUE
```

```
[1] TRUE
```

```r
TRUE == FALSE
```

```
[1] FALSE
```

```r
1 == 1
```

```
[1] TRUE
```

```r
1 == 2
```

```
[1] FALSE
```

```r
"isto" == "isto"
```

```
[1] TRUE
```

```r
"isto" == "razlicito"
```

```
[1] FALSE
```

***
## Razlicito  !=


```r
TRUE != TRUE
```

```
[1] FALSE
```

```r
TRUE != FALSE
```

```
[1] TRUE
```

```r
1 != 1
```

```
[1] FALSE
```

```r
1 != 2
```

```
[1] TRUE
```

```r
"isto" != "isto"
```

```
[1] FALSE
```

```r
"isto" != "razlicito"
```

```
[1] TRUE
```


<, >, <= i >=
========================================================
## < i >


```r
1 < 2
```

```
[1] TRUE
```

```r
1 > 2
```

```
[1] FALSE
```

```r
1 > 1
```

```
[1] FALSE
```

```r
"Dobar dan !" > "Zdravo!" # Abecedni poredak
```

```
[1] FALSE
```

```r
TRUE > FALSE # TRUE = 1, FALSE = 0
```

```
[1] TRUE
```

***
## <= i >=


```r
1 >= 1
```

```
[1] TRUE
```

```r
"Cao!" <= "Cao!"
```

```
[1] TRUE
```

```r
TRUE >= 1 # ispod haube TRUE = 1
```

```
[1] TRUE
```

Relacioni operatori i vektori (matrice)
==============================================


```r
a <- c(3:7, 23, 11:9, 99, 0, -5)
a
```

```
 [1]  3  4  5  6  7 23 11 10  9 99  0 -5
```

```r
b <- c(4:6, 32, 12, 1, 67, -9, 3, 22, 1, -5)
b
```

```
 [1]  4  5  6 32 12  1 67 -9  3 22  1 -5
```

```r
a >= b
```

```
 [1] FALSE FALSE FALSE FALSE FALSE  TRUE FALSE  TRUE  TRUE  TRUE FALSE
[12]  TRUE
```

```r
a[a>=b] #izdvaja elemente vektora a koji zadovoljavaju dati uslov!
```

```
[1] 23 10  9 99 -5
```
Logicki operatori
===================================
type: sub-section

* Logicko *I* (*AND*) - **&**
* Logicko *ILI* (*OR*) - **|**
* Logicko *NE* (*NOT*) - **!**

Operator &
==================================

```r
TRUE & TRUE # iskaz je tacan akko su obe tvrdnje tacne
```

```
[1] TRUE
```

```r
TRUE & FALSE
```

```
[1] FALSE
```

```r
FALSE & TRUE
```

```
[1] FALSE
```

```r
FALSE & FALSE
```

```
[1] FALSE
```

```r
2 > 1 & 2 <= 2
```

```
[1] TRUE
```

Operator |
====================================

```r
TRUE | TRUE # dovoljno je da samo jedan od clanova u iskazu bude tacan
```

```
[1] TRUE
```

```r
TRUE | FALSE
```

```
[1] TRUE
```

```r
FALSE | TRUE
```

```
[1] TRUE
```

```r
FALSE | FALSE # iskaz je netacan akko su obe tvrdnje netacne
```

```
[1] FALSE
```

```r
1 > 3 | 5 ==5
```

```
[1] TRUE
```

Operator !
=====================================


```r
!TRUE
```

```
[1] FALSE
```

```r
!FALSE
```

```
[1] TRUE
```

```r
!(3 > 5)
```

```
[1] TRUE
```
***

```r
is.character(5)
```

```
[1] FALSE
```

```r
!is.character(5)
```

```
[1] TRUE
```

```r
is.numeric("string")
```

```
[1] FALSE
```

```r
!is.numeric("string")
```

```
[1] TRUE
```

Logicki operatori i vektori (matrice)
========================================


```r
c(TRUE, FALSE, TRUE) & c(TRUE, TRUE, TRUE)
```

```
[1]  TRUE FALSE  TRUE
```

```r
c(TRUE, FALSE, TRUE) | c(TRUE, TRUE, TRUE)
```

```
[1] TRUE TRUE TRUE
```

```r
!c(TRUE, FALSE, FALSE)
```

```
[1] FALSE  TRUE  TRUE
```
& vs &&, | vs ||
=========================================

**`&&` i `||` porede samo prve elemente vektora!**

```r
c(TRUE, FALSE, TRUE) & c(TRUE, TRUE, TRUE)
```

```
[1]  TRUE FALSE  TRUE
```

```r
c(TRUE, FALSE, TRUE) | c(TRUE, TRUE, TRUE)
```

```
[1] TRUE TRUE TRUE
```

```r
c(TRUE, FALSE, TRUE) && c(TRUE, TRUE, TRUE)
```

```
[1] TRUE
```

```r
c(TRUE, FALSE, TRUE) || c(TRUE, TRUE, TRUE)
```

```
[1] TRUE
```

Uslovni iskazi i grananje
=============================================
type: sub-section

if
=============================================

`if(condition) {`

  `expr`

  `}`


```r
 x <- 5

if(x < 0) {

  print("x je negativan broj")

  } # FALSE => kod se ne izvrsava, odn. u ovom slucaju poruka nece biti ispisana.

if(x > 0) {

  print("x je pozitivan broj")

  } # u ovom slucaju uslov je zadovoljen (TRUE) i poruka biva ispisana u konzoli.
```

```
[1] "x je pozitivan broj"
```
else
======================================

`if(condition) {`

  `expr1`

  `} else {`

  `expr2`

  `}`


```r
x <- -3

if(x < 0) {

  print("x je negativan broj")

  } else {

  print("x je pozitivan broj ili nula")

  }
```

```
[1] "x je negativan broj"
```
else (nastavak)
======================================

`if(condition) {`

  `expr1`

  `} else {`

  `expr2`

  `}`


```r
x <- 3

if(x < 0) {

  print("x je negativan broj")

  } else {

  print("x je pozitivan broj ili nula")

  }
```

```
[1] "x je pozitivan broj ili nula"
```

else if
=====================================

`if(condition1) {`

  `expr1`

  `} else if(condition2) {`

  `expr2`

  `} else {`

  `expr3`
`}`
***


```r
x <- -3

if(x < 0) {

  print("x je negativan broj")

  } else if(x == 0) {

    print("x je nula")

    } else {

    print("x je pozitivan broj")
    }
```

```
[1] "x je negativan broj"
```

else if (nastavak)
=====================================

`if(condition1) {`

  `expr1`

  `} else if(condition2) {`

  `expr2`

  `} else {`

  `expr3`
`}`
***


```r
x <- 0

if(x < 0) {

  print("x je negativan broj")

  } else if(x == 0) {

    print("x je nula")

    } else {

    print("x je pozitivan broj")
    }
```

```
[1] "x je nula"
```

else if (nastavak)
=====================================

`if(condition1) {`

  `expr1`

  `} else if(condition2) {`

  `expr2`

  `} else {`

  `expr3`
`}`
***


```r
x <- 3

if(x < 0) {

  print("x je negativan broj")

  } else if(x == 0) {

    print("x je nula")

    } else {

    print("x je pozitivan broj")
    }
```

```
[1] "x je pozitivan broj"
```
if, else if, else
======================================

```r
 x <- 6

if((x %% 2 == 0)&(x %% 3 == 0 )) {

  print("deljivo sa 2 i sa 3")

  } else if (x %% 2 == 0) {

    print("deljivo sa 2")

    } else if (x %% 3 == 0) {

      print("deljivo sa 3 ")

    } else {

      print("nije deljivo ni sa 2 ni sa 3...")

    }
```

```
[1] "deljivo sa 2 i sa 3"
```
***

```r
 x <- 4

if((x %% 2 == 0)&(x %% 3 == 0 )) {

  print("deljivo sa 2 i sa 3")

  } else if (x %% 2 == 0) {

    print("deljivo sa 2")

    } else if (x %% 3 == 0) {

      print("deljivo sa 3 ")

    } else {

      print("nije deljivo ni sa 2 ni sa 3...")

    }
```

```
[1] "deljivo sa 2"
```
Petlje
==================================================
type: section

'while' petlja
==============================================
type: sub-section

`while(condition) {`

  `expr`

  `}`

'while' petlja - primer
==============================================


**`while(condition) {`**

  **`expr`**

  **`}`**
***

```r
ctr <- 1

while(ctr <= 7) {

  print(paste("ctr je jednako", ctr))

  ctr <- ctr + 1

  }
```

```
[1] "ctr je jednako 1"
[1] "ctr je jednako 2"
[1] "ctr je jednako 3"
[1] "ctr je jednako 4"
[1] "ctr je jednako 5"
[1] "ctr je jednako 6"
[1] "ctr je jednako 7"
```

```r
ctr # obrati paznju, nakon poslednje iteracije "ctr" ce imati vrednost 8 i nece ispunjavati uslov da bude ispisano
```

```
[1] 8
```
beskonacna 'while' petlja
==========================================

* Ovaj 'chunk' koda se nece izvrsiti (eval=FALSE), u suprotnom bismo imali beskonacnu petlju.
* 'while' petlja se izuzetno retko koristi u R-u.
* Ako je koristite vodite racuna da valjano definisete kontrolnu promenljivu.



```r
ctr <- 1

while(ctr <= 7) {

  print(paste("ctr je jednako", ctr))

 }
```
break
==================================================


```r
ctr <- 1

## prekini izvrsavanje ako je 'ctr' deljivo sa 5
while(ctr <= 7) {

  if(ctr %% 5 == 0) { #ako je ovo tacno (TRUE) prekida se izvrsavanje petlje

    break

    }

  print(paste("ctr je jednako", ctr))

  ctr <- ctr + 1

}
```

```
[1] "ctr je jednako 1"
[1] "ctr je jednako 2"
[1] "ctr je jednako 3"
[1] "ctr je jednako 4"
```
'for' petlja
===============================================
type: sub-section

`for(var in seq) {`

  `expr`

  `}`

'for' petlja
=============================================

`for(var in seq) {`

  `expr`

  `}`
***

```r
gradovi <- c("Beograd", "New York", "Paris", "London", "Tokyo", "Prnjavor")

for(grad in gradovi) {

  print(grad)

}
```

```
[1] "Beograd"
[1] "New York"
[1] "Paris"
[1] "London"
[1] "Tokyo"
[1] "Prnjavor"
```
'break' u 'for' petlji
===============================================

```r
gradovi <- c("Beograd", "New York", "Paris", "London", "Tokyo", "Prnjavor")

for(grad in gradovi) {

   if(nchar(grad) == 6) { #ako tekuci string ima duzinu od 6 karaktera prekida se izvrsavanje petlje (u nasem slucaju to ce se desiti kada na red dodje "London")

     break

   }

  print(grad)

}
```

```
[1] "Beograd"
[1] "New York"
[1] "Paris"
```
'next'
===============================================

**Naredba `next` nam omogucava da preskocimo iteraciju.**

```r
for(grad in gradovi) {

   if(nchar(grad) == 6) { #ako tekuci string ima duzinu od 6 karaktera nece biti izvrsen kod u datoj iteraciji (u nasem slucaju to ce se desiti kada na red dodje "London")

     next

   }

  print(grad)

}
```

```
[1] "Beograd"
[1] "New York"
[1] "Paris"
[1] "Tokyo"
[1] "Prnjavor"
```

```r
# Kao sto vidite "London" nije ispisan.
```

'for' petlja v.2
======================================================

```r
gradovi <- c("Beograd", "New York", "Paris", "London", "Tokyo", "Prnjavor")

for(grad in gradovi) {

  print(grad)

}
```

```
[1] "Beograd"
[1] "New York"
[1] "Paris"
[1] "London"
[1] "Tokyo"
[1] "Prnjavor"
```
***

```r
gradovi <- c("Beograd", "New York", "Paris", "London", "Tokyo", "Prnjavor")

for(i in 1:length(gradovi)) {

  print(gradovi[i])

}
```

```
[1] "Beograd"
[1] "New York"
[1] "Paris"
[1] "London"
[1] "Tokyo"
[1] "Prnjavor"
```
'for' petlja v.2 (nastavak)
======================================================

```r
gradovi <- c("Beograd", "New York", "Paris", "London", "Tokyo", "Prnjavor")

for(i in 1:length(gradovi)) {

  print(paste(gradovi[i], "je na poziciji", i, "u vektoru 'gradovi'."))

}
```

```
[1] "Beograd je na poziciji 1 u vektoru 'gradovi'."
[1] "New York je na poziciji 2 u vektoru 'gradovi'."
[1] "Paris je na poziciji 3 u vektoru 'gradovi'."
[1] "London je na poziciji 4 u vektoru 'gradovi'."
[1] "Tokyo je na poziciji 5 u vektoru 'gradovi'."
[1] "Prnjavor je na poziciji 6 u vektoru 'gradovi'."
```

Poredjenje: 'for' petlja v.1 vs v.2
====================================================
## v.1
* **+** Koncizno
* **+** Razumljivo i "citljivo"
* **-** Nemamo pristupu indeksu petlje


```r
gradovi <- c("Beograd", "New York", "Paris", "London", "Tokyo", "Prnjavor")

for(grad in gradovi) {

  print(grad)

}
```

```
[1] "Beograd"
[1] "New York"
[1] "Paris"
[1] "London"
[1] "Tokyo"
[1] "Prnjavor"
```
***
## v.2
* **-** Teze za razumevanje i citanje
* **+** Raznovrsnija primena ("mocnija" konstrukcija)


```r
gradovi <- c("Beograd", "New York", "Paris", "London", "Tokyo", "Prnjavor")

for(i in 1:length(gradovi)) {

  print(gradovi[i])

}
```

```
[1] "Beograd"
[1] "New York"
[1] "Paris"
[1] "London"
[1] "Tokyo"
[1] "Prnjavor"
```
Funkcije
=============================================================
type: section

Funkcije
=======================================================
type: sub-section

- Neke ste vec upoznali, npr. `list()`, `sum()`, `c()`, `head()` itd.
- "Black box" princip (funkcije se ponasaju kao "crna kutija")
![Funkcija kao "crna kutija"](Black_box.jpg)
![sd](sd.jpg)

Dokumentacija
=======================================================

- `help(sd)`

- `?sd`

***
![sd_help](sd_help.png)

Argumenti funkcije
=======================================================


```r
args(sd)
```

```
function (x, na.rm = FALSE) 
NULL
```
- argumenti koji se prosledjuju f-ji `sd()` su vektor brojnih vrednosti `x` i `na.rm` koji ukazuje na to da li ce se vrsiti uklanjanje `NA` vrednosti prilikom racunajna standardne devijacije ili ne.
  - Obratite paznju na to da argument `x` nema podrazumevanu vrednost, dok je `na.rm = FALSE` podrazumevano!

- Argumenti mogu da se prosledjuju na dva nacina:
  - po poziciji - "matching by position"
  - po imenu - "matching by name"

Agrumenti funkcije (2)
====================================================


```r
vec <- c(1,2,3,4,5,NA)

sd(vec)
```

```
[1] NA
```

```r
sd(vec, TRUE) # "matching by position"
```

```
[1] 1.581139
```

```r
sd(na.rm = TRUE, x = vec) # "matching by name"
```

```
[1] 1.581139
```

```r
sd(TRUE, vec) # sta je ovde problem?
```

```
[1] NA
```

Ugnezdjene funkcije
======================================================

```r
vek_1 <- c(16, 9, 13, 5, NA, 17, 14)
vek_2 <- c(17, NA, 5, 16, 8, 13, 14)

# Izracunajte srednje apsolutno odstupanje
mean(abs(vek_1 - vek_2), na.rm=TRUE)
```

```
[1] 4.8
```

Pisanje funkcija
===================================================
type: sub-section

`ime_f-je <- function(arg1, arg2, ...) {`

  `telo f-je`

`}`

**Primer:**

```r
# F-ja sum_abs() koja racuna sumu apsolutnih vrednosti dva broja
sum_abs<-function(x,y){

  abs(x)+abs(y)

  }

# Primer upotrebe
sum_abs(-2,3)
```

```
[1] 5
```

Funkcije bez ulaznih argumenata
=====================================================

**Primer:**

```r
baci_kockicu <- function() {

  broj <- sample(1:6, size = 1)
  broj
}

baci_kockicu()
```

```
[1] 3
```

Ulazni arumenti sa podrazumevanom vrednoscu
=======================================================

` ime_f <- function(arg1, arg2 = val2) {`

  `body`

`}`
***

```r
kv_info <- function(x, print_info = TRUE) {

  y <- x ^ 2

  if (print_info) {

      print(paste(x, "na kvadrat daje", y))
  }

  return(y)
}

kv_info(5)
```

```
[1] "5 na kvadrat daje 25"
```

```
[1] 25
```

```r
kv_info(3, print_info = FALSE)
```

```
[1] 9
```

Function scoping
=====================================================

- Promenljive definisane unutar funkcije, tj. u telu funkcije, nisu dostupne van te iste funkcije!

**Primer:**

```r
kv <- function(x){

  y <- x ^ 2

  return(y)

}

kv(4)
```

```
[1] 16
```

```r
# x
# y
```
***
- `y` je definisano unutar funkcije `kv()` te s' toga nije dostupno van prostora promenljivih same funkcije.
- Vrednost argumenta`x` takodje nije dostupna van prostora promenljivih same funkcije `kv()`.

R prosledjuje argumente po vrednosti (passing by value)
=========================================================
- U kontekstu funkcija ovo znaci da primenom funkcije na neku promenljivu ne mozemo promeniti vrednost te iste promenljive!

- "Passing by reference" - promena vrednosti promenljive u telu funkcije se prenosi i u globalni prostor promenljivih.


```r
triple <- function(x) {
  x <- 3*x
  x
}
a <- 5
triple(a)
```

```
[1] 15
```

```r
a
```

```
[1] 5
```

Passing by value - vezba
===============================================
Koja je od sledecih izjava *netacna* vezano za prikazani blok koda:

1. 'a' i 'b' su jednaki 7 i 6, respektivno, nakon izvrsenja ovog koda.
2. Nakon prvog pozivanja f-je `increment()`, u kome je vrednost `a` definisana, `a` je jednako 7 dok `count` ima vrednost 5.
3. Po izvrsenju celog bloka `count` ce imati vrednost 10.
4. U poslednjoj liniji koda vrednost promenljive `count` je izmenjena jer je izvresena eksplicitna dodela vrednosti.

***


```r
increment <- function(x, inc = 1) {
  x <- x + inc
  x
}
count <- 5
a <- increment(count, 2)
b <- increment(count)
count <- increment(count, 2)
```
Pisanje funkcija u R-u - Zadatak za vezbanje 1
==========================================================

- Formirajte "data frame" `pritisak` koji sadrzi kolone `pritisak_sist` i `pritisak_dijast` u kojima se nalaze vrednosti odgovarajucih parametara tj. sistolnog i dijastolnog krvnog pritiska za pojedinacne pacijente. Unesite vrednosti za 10 pacijenata.

- Dovrsite zapocetu funkciju `interpret` koja daje odgovarajuci odziv u zavisnosti od vrednosti ovih parametara:
  - funkcija ima dva argumenta `prit_s` i `prit_d` koji se odnose na sistolni i dijastolni krvni pritisak za konkretnog pacijenta.
  - Ako je vrednost `prit_s` veca od 120 f-ja a manja od 190 ispisuje poruku "Povisen gornji pritisak!", ako je `prit_d` veca od 80 i manja od 100 fja ispisuje poruku "Povisen donji pritisak!", ako je `prit_s` manji od 120 i veci od 90 ispisuje poruku "Normalan gornji pritisak.", ako je `prit_d` manji od 80 i veci od 60 ispisuje poruku "Normalan donji pritisak", ako `prit_s` ima vrednost izmedju 70 i 90 ispisuje "Nizak gornji pritisak!", ako `prit_d` ima vrednost u rasponu 40-60 ispisuje "Nizak donji pritisak!", a ako nijedan od ovih uslova nije zadovoljen ispisuje poruku "Svaka cast!".
- Pozovite ovu funkciju dva puta, prvi put za pacijenta br.1 drugi put za pacijenta br.5.



***

```r
interpret <- function(prit_s, prit_d) {

  if (prit_s > 120 & prit_s < 190) {
    print("Povisen gornji pritisak!")

  } else if (prit_s < 120 & prit_s > 90){
      print("Normalan gornji pritisak!")
  } else if (){
      ...
    }
...

}
```
Pisanje funkcija u R-u - Zadatak za vezbanje 2
==========================================================
- Dopunite funkciju iz prethodnog zadatka tako da kao ulazne argumente prima vektore sa vrednostima sistolnog i dijastolnog pritiska i vraca listu `dijagnoza` sa odgovarajucim porukama definisanim kao u proslom zadatku.
- Takodje ova funkcija treba i da vrati podatke o broju pacijenata sa snizenim, normalnim i povisenim vrednostima pritisaka, ukoliko opcioni argument `return_sum` ima vrednost `TRUE`. Neka `TRUE` bude podrazumevana vrednost ovog argumenta.
- Koristite "data frame" formiran u prethodnom zadatku
- Jedan od mogucih pristupa je da koristite "for" petlje
- Efikasniji nacin je koriscenje konsturkcije tipa `sum(vekt > prag)` gde je "prag" konkretna brojna vrednost.

***


```r
interpret_sum <- function(prit_s, prit_d, ______) {

  dijagnoza <- list(prit_sis = "", prit_dijast = "")

  for( i in 1:length(prit_s)){

    if (prit_s > 120 & prit_s < 190) {
    dijagnoza_prit_sis[i] <- ("Povisen gornji pritisak!")

  } else if (prit_s < 120 & prit_s > 90){
      ...
  } else if (){
      ...
  }
  }
...
  if(______){

    sum_g = 0
    ...

    for(i in prit_s > 120){
      sum_g <- sum_g + 1
    }
    ...
     paste("Broj pacijenata sa povisenim sistolnim pritiskom je:", sum_g)
     ...

  }
}
```

'apply' familija funkcija
===============================================================
type: section

- Omogucavaju da se izbegne koriscenje klasicnih petlji "for" i "while"
- U skladu sa paradigmom vektorizacije koda
  - **lapply()**: Izvrsava zadatu funkciju nad svakim od elemenata liste ili vektora i vraca listu
  - **sapply()**: Isto kao `lapply` ali pokusava da uprosti rezultat.
  - **apply()**: Izvrsava zadatu funkciju po odredjenim dimenzijama niza (npr. po vrstama u slucaju 2d niza)
  - **tapply()**: Izvrsava zadatu funkciju nad elementima podskupa datog vektora
  - **mapply()**: Multivarijantna verzija f-je `lapply`
   - **vaply()**: robusna verzija funkcije `sapply`


lapply
=========================================
type: sub-section

`lapply(X, FUN, ...)`

- `X` je niz ili vektor nad cijim elementima zelima da izvrsimo funkciju `FUN`
- Ako funkcija `FUN` zahteva upotrebu dodatnih argumenata oni se prosledjuju nakon njenog pozivanja (`...`)

lapply - primer 1
===============================================


```r
# Podaci za New York
nyc <- list(pop = 8405837,
            boroughs = c("Manhattan", "Bronx", "Brooklyn","Queens", "Staten Island"),
            capital = FALSE)

# Interesuje nas kojoj klasi pripadaju elementi liste 'nyc'

# Resenje pomocu 'for' petlje
for(info in nyc) {
print(class(info))
}
```

```
[1] "numeric"
[1] "character"
[1] "logical"
```

```r
#resenje primenom funkcije 'lapply()`
lapply(nyc, class)
```

```
$pop
[1] "numeric"

$boroughs
[1] "character"

$capital
[1] "logical"
```

lapply - primer 2
====================================================

```r
gradovi <- c("New York", "Paris", "London", "Tokyo","Beograd", "Rio de Janeiro", "Cape Town")

# Interesuje nas broj karaktera za svaki clan ovog vektora

# Resenje koriscenjem 'for' petlje
num_chars <- c()

for(i in 1:length(gradovi)) {
  num_chars[i] <- nchar(gradovi[i])
  }
num_chars
```

```
[1]  8  5  6  5  7 14  9
```
***

```r
# Resenje koriscenjem funkcije 'lapply'
lapply(gradovi, nchar)
```

```
[[1]]
[1] 8

[[2]]
[1] 5

[[3]]
[1] 6

[[4]]
[1] 5

[[5]]
[1] 7

[[6]]
[1] 14

[[7]]
[1] 9
```

```r
#Da bismo dobili vektor a ne listu
unlist(lapply(gradovi, nchar))
```

```
[1]  8  5  6  5  7 14  9
```
Digresija - poredjenje sa 'sapply'
======================================

```r
# Uporedi sa sapply

sapply(gradovi, nchar)
```

```
      New York          Paris         London          Tokyo        Beograd 
             8              5              6              5              7 
Rio de Janeiro      Cape Town 
            14              9 
```

```r
str(sapply(gradovi, nchar))
```

```
 Named int [1:7] 8 5 6 5 7 14 9
 - attr(*, "names")= chr [1:7] "New York" "Paris" "London" "Tokyo" ...
```

Upotreba 'lapply' sa korisnickim (user-defined) funkcijama (1)
===============================================================

```r
lista_onako <- list(2.37, 2.49, 2.18, 2.22, 2.47, 2.32)

triple <- function(x) {
  3 * x
  }
res <- lapply(lista_onako, triple)
str(res)
```

```
List of 6
 $ : num 7.11
 $ : num 7.47
 $ : num 6.54
 $ : num 6.66
 $ : num 7.41
 $ : num 6.96
```

```r
unlist(res)
```

```
[1] 7.11 7.47 6.54 6.66 7.41 6.96
```

Upotreba 'lapply' sa korisnickim (user-defined) funkcijama (2)
===============================================================

```r
mnozenje <- function(x, faktor) {
  faktor * x
  }
res_3 <- lapply(lista_onako, mnozenje, 3)
unlist(res_3)
```

```
[1] 7.11 7.47 6.54 6.66 7.41 6.96
```

```r
res_4 <- lapply(lista_onako, mnozenje, 4)
unlist(res_4)
```

```
[1] 9.48 9.96 8.72 8.88 9.88 9.28
```

Upotreba 'lapply' sa anonimnim funkcijama
=================================================

```r
res_an <- lapply(lista_onako, function(x){x * 3})
unlist(res_an)
```

```
[1] 7.11 7.47 6.54 6.66 7.41 6.96
```

```r
res_an_mn <- lapply(lista_onako, function(x, faktor){x * faktor}, 3)
unlist(res_an_mn)
```

```
[1] 7.11 7.47 6.54 6.66 7.41 6.96
```

Biblioteka 'purr' i 'map' funkcije
================================================

```r
library(purrr)

res_map <- map(lista_onako, mnozenje, 3) #vraca listu ili data frame
str(res_map)
```

```
List of 6
 $ : num 7.11
 $ : num 7.47
 $ : num 6.54
 $ : num 6.66
 $ : num 7.41
 $ : num 6.96
```

```r
res_map_dbl <- map_dbl(lista_onako, mnozenje, 3) #vraca vektor tipa numeric (double)
str(res_map_dbl)
```

```
 num [1:6] 7.11 7.47 6.54 6.66 7.41 6.96
```
