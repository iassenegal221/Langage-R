Introduction au package dplyr
================

![](https://i.ytimg.com/vi/M2QuERvxwm0/maxresdefault.jpg)

# Avantage de dplyr

-   La granmmaire de la manipulation des données (sur R)

-   `dplyr` est un package de R conçue pour rendre l’analyse des données
    rapide et facile

-   La philosophie de `dplyr` est de restreindre la manipulation des
    données à quelques fonctions simples qui correspondent aux tâches
    les plus courantes.

-   Des commandes assez intuitives et proches du language courant
    (`select()`, `filter()`,`arrange()`, `summarize()`, etc.)

![](https://miro.medium.com/max/2000/1*NXRsFH_12sfj79W-P4qI0Q.png)

-   des packages utilisants du dplyr: `dtplyr` (backend data.table pour
    `dplyr`), `sparklyr` ( backend dplyr pour spark)

# Intallation de dplyr et présentation du jeu de données

``` r
# install.packages("dplyr")
library(dplyr)
```

Nous utiliserons des jeux de données intégrés dans R ou des packages de
R dans le but de faciliter la reproductibité des exemples pratiques.

# La commande `select()`

-   choisit des variables en fonction de leurs noms.
-   On peut aussi renommer les variables à l’aide de `select`

``` r
starwars %>% select(name,height,mass)
```

    ## # A tibble: 87 x 3
    ##    name               height  mass
    ##    <chr>               <int> <dbl>
    ##  1 Luke Skywalker        172    77
    ##  2 C-3PO                 167    75
    ##  3 R2-D2                  96    32
    ##  4 Darth Vader           202   136
    ##  5 Leia Organa           150    49
    ##  6 Owen Lars             178   120
    ##  7 Beru Whitesun lars    165    75
    ##  8 R5-D4                  97    32
    ##  9 Biggs Darklighter     183    84
    ## 10 Obi-Wan Kenobi        182    77
    ## # ... with 77 more rows

``` r
starwars %>% select(Nom=name,Taille=height,Poids=mass)
```

    ## # A tibble: 87 x 3
    ##    Nom                Taille Poids
    ##    <chr>               <int> <dbl>
    ##  1 Luke Skywalker        172    77
    ##  2 C-3PO                 167    75
    ##  3 R2-D2                  96    32
    ##  4 Darth Vader           202   136
    ##  5 Leia Organa           150    49
    ##  6 Owen Lars             178   120
    ##  7 Beru Whitesun lars    165    75
    ##  8 R5-D4                  97    32
    ##  9 Biggs Darklighter     183    84
    ## 10 Obi-Wan Kenobi        182    77
    ## # ... with 77 more rows

## Les assistants de selection

Tidyverse implémentent un dialecte de R où les opérateurs facilitent la
sélection de variables :

-   `:`: pour sélectionner une plage de variables consécutives.

``` r
starwars %>% select(name:mass)
```

    ## # A tibble: 87 x 3
    ##    name               height  mass
    ##    <chr>               <int> <dbl>
    ##  1 Luke Skywalker        172    77
    ##  2 C-3PO                 167    75
    ##  3 R2-D2                  96    32
    ##  4 Darth Vader           202   136
    ##  5 Leia Organa           150    49
    ##  6 Owen Lars             178   120
    ##  7 Beru Whitesun lars    165    75
    ##  8 R5-D4                  97    32
    ##  9 Biggs Darklighter     183    84
    ## 10 Obi-Wan Kenobi        182    77
    ## # ... with 77 more rows

-   `!`: pour prendre le complémentaire d’un ensemble de variables.

``` r
starwars %>% select(!c("mass","name","height"))
```

    ## # A tibble: 87 x 11
    ##    hair_color   skin_color  eye_color birth_year sex   gender  homeworld species
    ##    <chr>        <chr>       <chr>          <dbl> <chr> <chr>   <chr>     <chr>  
    ##  1 blond        fair        blue            19   male  mascul~ Tatooine  Human  
    ##  2 <NA>         gold        yellow         112   none  mascul~ Tatooine  Droid  
    ##  3 <NA>         white, blue red             33   none  mascul~ Naboo     Droid  
    ##  4 none         white       yellow          41.9 male  mascul~ Tatooine  Human  
    ##  5 brown        light       brown           19   fema~ femini~ Alderaan  Human  
    ##  6 brown, grey  light       blue            52   male  mascul~ Tatooine  Human  
    ##  7 brown        light       blue            47   fema~ femini~ Tatooine  Human  
    ##  8 <NA>         white, red  red             NA   none  mascul~ Tatooine  Droid  
    ##  9 black        light       brown           24   male  mascul~ Tatooine  Human  
    ## 10 auburn, whi~ fair        blue-gray       57   male  mascul~ Stewjon   Human  
    ## # ... with 77 more rows, and 3 more variables: films <list>, vehicles <list>,
    ## #   starships <list>

``` r
starwars %>% select(!name:mass)
```

    ## # A tibble: 87 x 11
    ##    hair_color   skin_color  eye_color birth_year sex   gender  homeworld species
    ##    <chr>        <chr>       <chr>          <dbl> <chr> <chr>   <chr>     <chr>  
    ##  1 blond        fair        blue            19   male  mascul~ Tatooine  Human  
    ##  2 <NA>         gold        yellow         112   none  mascul~ Tatooine  Droid  
    ##  3 <NA>         white, blue red             33   none  mascul~ Naboo     Droid  
    ##  4 none         white       yellow          41.9 male  mascul~ Tatooine  Human  
    ##  5 brown        light       brown           19   fema~ femini~ Alderaan  Human  
    ##  6 brown, grey  light       blue            52   male  mascul~ Tatooine  Human  
    ##  7 brown        light       blue            47   fema~ femini~ Tatooine  Human  
    ##  8 <NA>         white, red  red             NA   none  mascul~ Tatooine  Droid  
    ##  9 black        light       brown           24   male  mascul~ Tatooine  Human  
    ## 10 auburn, whi~ fair        blue-gray       57   male  mascul~ Stewjon   Human  
    ## # ... with 77 more rows, and 3 more variables: films <list>, vehicles <list>,
    ## #   starships <list>

-   `&` et `|`: pour sélectionner l’intersection ou l’union de deux
    ensembles de variables.

-   `c()`: pour combiner des sélections.

**les assistants de selection(selection helpers)**

-   `everything()`: Matches all variables.

``` r
starwars %>% select(X=everything())
```

    ## # A tibble: 87 x 14
    ##    X1       X2    X3 X4    X5    X6       X7 X8    X9    X10   X11   X12   X13  
    ##    <chr> <int> <dbl> <chr> <chr> <chr> <dbl> <chr> <chr> <chr> <chr> <lis> <lis>
    ##  1 Luke~   172    77 blond fair  blue   19   male  masc~ Tato~ Human <chr~ <chr~
    ##  2 C-3PO   167    75 <NA>  gold  yell~ 112   none  masc~ Tato~ Droid <chr~ <chr~
    ##  3 R2-D2    96    32 <NA>  whit~ red    33   none  masc~ Naboo Droid <chr~ <chr~
    ##  4 Dart~   202   136 none  white yell~  41.9 male  masc~ Tato~ Human <chr~ <chr~
    ##  5 Leia~   150    49 brown light brown  19   fema~ femi~ Alde~ Human <chr~ <chr~
    ##  6 Owen~   178   120 brow~ light blue   52   male  masc~ Tato~ Human <chr~ <chr~
    ##  7 Beru~   165    75 brown light blue   47   fema~ femi~ Tato~ Human <chr~ <chr~
    ##  8 R5-D4    97    32 <NA>  whit~ red    NA   none  masc~ Tato~ Droid <chr~ <chr~
    ##  9 Bigg~   183    84 black light brown  24   male  masc~ Tato~ Human <chr~ <chr~
    ## 10 Obi-~   182    77 aubu~ fair  blue~  57   male  masc~ Stew~ Human <chr~ <chr~
    ## # ... with 77 more rows, and 1 more variable: X14 <list>

``` r
starwars %>% select(height,mass,everything())
```

    ## # A tibble: 87 x 14
    ##    height  mass name    hair_color  skin_color eye_color birth_year sex   gender
    ##     <int> <dbl> <chr>   <chr>       <chr>      <chr>          <dbl> <chr> <chr> 
    ##  1    172    77 Luke S~ blond       fair       blue            19   male  mascu~
    ##  2    167    75 C-3PO   <NA>        gold       yellow         112   none  mascu~
    ##  3     96    32 R2-D2   <NA>        white, bl~ red             33   none  mascu~
    ##  4    202   136 Darth ~ none        white      yellow          41.9 male  mascu~
    ##  5    150    49 Leia O~ brown       light      brown           19   fema~ femin~
    ##  6    178   120 Owen L~ brown, grey light      blue            52   male  mascu~
    ##  7    165    75 Beru W~ brown       light      blue            47   fema~ femin~
    ##  8     97    32 R5-D4   <NA>        white, red red             NA   none  mascu~
    ##  9    183    84 Biggs ~ black       light      brown           24   male  mascu~
    ## 10    182    77 Obi-Wa~ auburn, wh~ fair       blue-gray       57   male  mascu~
    ## # ... with 77 more rows, and 5 more variables: homeworld <chr>, species <chr>,
    ## #   films <list>, vehicles <list>, starships <list>

-   `last_col()`: selectionne la dernière colonne

``` r
starwars %>% select(last_col())
```

    ## # A tibble: 87 x 1
    ##    starships
    ##    <list>   
    ##  1 <chr [2]>
    ##  2 <chr [0]>
    ##  3 <chr [0]>
    ##  4 <chr [1]>
    ##  5 <chr [0]>
    ##  6 <chr [0]>
    ##  7 <chr [0]>
    ##  8 <chr [0]>
    ##  9 <chr [1]>
    ## 10 <chr [5]>
    ## # ... with 77 more rows

Ces assistants sélectionnent des variables en faisant correspondre des
modèles dans leurs noms :

-   `starts_with()`: Commence avec un prefixe.

``` r
starwars %>% select(starts_with("h"))
```

    ## # A tibble: 87 x 3
    ##    height hair_color    homeworld
    ##     <int> <chr>         <chr>    
    ##  1    172 blond         Tatooine 
    ##  2    167 <NA>          Tatooine 
    ##  3     96 <NA>          Naboo    
    ##  4    202 none          Tatooine 
    ##  5    150 brown         Alderaan 
    ##  6    178 brown, grey   Tatooine 
    ##  7    165 brown         Tatooine 
    ##  8     97 <NA>          Tatooine 
    ##  9    183 black         Tatooine 
    ## 10    182 auburn, white Stewjon  
    ## # ... with 77 more rows

-   `ends_with()`: Se termine avec un prefixe.

``` r
starwars %>% select(ends_with("color"))
```

    ## # A tibble: 87 x 3
    ##    hair_color    skin_color  eye_color
    ##    <chr>         <chr>       <chr>    
    ##  1 blond         fair        blue     
    ##  2 <NA>          gold        yellow   
    ##  3 <NA>          white, blue red      
    ##  4 none          white       yellow   
    ##  5 brown         light       brown    
    ##  6 brown, grey   light       blue     
    ##  7 brown         light       blue     
    ##  8 <NA>          white, red  red      
    ##  9 black         light       brown    
    ## 10 auburn, white fair        blue-gray
    ## # ... with 77 more rows

-   `contains()`: Contient une chaine de caractère.

-   `matches()`: Correspond à une expression régulière.

-   `num_range()`: Correspond à une plage numérique comme x01, x02, x03.

``` r
df=starwars %>% select(X=everything())

df %>% select(num_range("X",1:10))
```

    ## # A tibble: 87 x 10
    ##    X1             X2    X3 X4        X5       X6         X7 X8     X9     X10   
    ##    <chr>       <int> <dbl> <chr>     <chr>    <chr>   <dbl> <chr>  <chr>  <chr> 
    ##  1 Luke Skywa~   172    77 blond     fair     blue     19   male   mascu~ Tatoo~
    ##  2 C-3PO         167    75 <NA>      gold     yellow  112   none   mascu~ Tatoo~
    ##  3 R2-D2          96    32 <NA>      white, ~ red      33   none   mascu~ Naboo 
    ##  4 Darth Vader   202   136 none      white    yellow   41.9 male   mascu~ Tatoo~
    ##  5 Leia Organa   150    49 brown     light    brown    19   female femin~ Alder~
    ##  6 Owen Lars     178   120 brown, g~ light    blue     52   male   mascu~ Tatoo~
    ##  7 Beru White~   165    75 brown     light    blue     47   female femin~ Tatoo~
    ##  8 R5-D4          97    32 <NA>      white, ~ red      NA   none   mascu~ Tatoo~
    ##  9 Biggs Dark~   183    84 black     light    brown    24   male   mascu~ Tatoo~
    ## 10 Obi-Wan Ke~   182    77 auburn, ~ fair     blue-g~  57   male   mascu~ Stewj~
    ## # ... with 77 more rows

-   `all_of()`: Correspond aux noms de variables dans un vecteur de
    caractères. Tous les noms doivent être présents, sinon une erreur
    hors limites est renvoyée.

``` r
vars=c("name","mass","height")
vars1=c("name","mass","height","amsa")


starwars %>% select(all_of(vars))
```

    ## # A tibble: 87 x 3
    ##    name                mass height
    ##    <chr>              <dbl>  <int>
    ##  1 Luke Skywalker        77    172
    ##  2 C-3PO                 75    167
    ##  3 R2-D2                 32     96
    ##  4 Darth Vader          136    202
    ##  5 Leia Organa           49    150
    ##  6 Owen Lars            120    178
    ##  7 Beru Whitesun lars    75    165
    ##  8 R5-D4                 32     97
    ##  9 Biggs Darklighter     84    183
    ## 10 Obi-Wan Kenobi        77    182
    ## # ... with 77 more rows

``` r
# starwars %>% select(all_of(vars1)) #erreur
```

-   `any_of()`: même chose que all_of(), sauf qu’aucune erreur n’est
    renvoyée pour les noms qui n’existent pas.

``` r
vars=c("name","mass","height")
vars1=c("name","mass","height","amsa")


starwars %>% select(any_of(vars1))
```

    ## # A tibble: 87 x 3
    ##    name                mass height
    ##    <chr>              <dbl>  <int>
    ##  1 Luke Skywalker        77    172
    ##  2 C-3PO                 75    167
    ##  3 R2-D2                 32     96
    ##  4 Darth Vader          136    202
    ##  5 Leia Organa           49    150
    ##  6 Owen Lars            120    178
    ##  7 Beru Whitesun lars    75    165
    ##  8 R5-D4                 32     97
    ##  9 Biggs Darklighter     84    183
    ## 10 Obi-Wan Kenobi        77    182
    ## # ... with 77 more rows

Cet assistant sélectionne des variables avec une fonction :

-   `where()`: Applique une fonction à toutes les variables et
    sélectionne celles pour lesquelles la fonction renvoie TRUE

``` r
starwars %>% select(where(is.numeric))
```

    ## # A tibble: 87 x 3
    ##    height  mass birth_year
    ##     <int> <dbl>      <dbl>
    ##  1    172    77       19  
    ##  2    167    75      112  
    ##  3     96    32       33  
    ##  4    202   136       41.9
    ##  5    150    49       19  
    ##  6    178   120       52  
    ##  7    165    75       47  
    ##  8     97    32       NA  
    ##  9    183    84       24  
    ## 10    182    77       57  
    ## # ... with 77 more rows

## Les variantes de la commande `select`

-   `select_if()`

``` r
starwars %>% select_if(is.numeric)
```

    ## # A tibble: 87 x 3
    ##    height  mass birth_year
    ##     <int> <dbl>      <dbl>
    ##  1    172    77       19  
    ##  2    167    75      112  
    ##  3     96    32       33  
    ##  4    202   136       41.9
    ##  5    150    49       19  
    ##  6    178   120       52  
    ##  7    165    75       47  
    ##  8     97    32       NA  
    ##  9    183    84       24  
    ## 10    182    77       57  
    ## # ... with 77 more rows

\*`select_at()`

``` r
vars=c("name","mass","height")

starwars %>% select_at(vars)
```

    ## # A tibble: 87 x 3
    ##    name                mass height
    ##    <chr>              <dbl>  <int>
    ##  1 Luke Skywalker        77    172
    ##  2 C-3PO                 75    167
    ##  3 R2-D2                 32     96
    ##  4 Darth Vader          136    202
    ##  5 Leia Organa           49    150
    ##  6 Owen Lars            120    178
    ##  7 Beru Whitesun lars    75    165
    ##  8 R5-D4                 32     97
    ##  9 Biggs Darklighter     84    183
    ## 10 Obi-Wan Kenobi        77    182
    ## # ... with 77 more rows

`select_all`

``` r
starwars %>% select_all(toupper)
```

    ## # A tibble: 87 x 14
    ##    NAME    HEIGHT  MASS HAIR_COLOR  SKIN_COLOR EYE_COLOR BIRTH_YEAR SEX   GENDER
    ##    <chr>    <int> <dbl> <chr>       <chr>      <chr>          <dbl> <chr> <chr> 
    ##  1 Luke S~    172    77 blond       fair       blue            19   male  mascu~
    ##  2 C-3PO      167    75 <NA>        gold       yellow         112   none  mascu~
    ##  3 R2-D2       96    32 <NA>        white, bl~ red             33   none  mascu~
    ##  4 Darth ~    202   136 none        white      yellow          41.9 male  mascu~
    ##  5 Leia O~    150    49 brown       light      brown           19   fema~ femin~
    ##  6 Owen L~    178   120 brown, grey light      blue            52   male  mascu~
    ##  7 Beru W~    165    75 brown       light      blue            47   fema~ femin~
    ##  8 R5-D4       97    32 <NA>        white, red red             NA   none  mascu~
    ##  9 Biggs ~    183    84 black       light      brown           24   male  mascu~
    ## 10 Obi-Wa~    182    77 auburn, wh~ fair       blue-gray       57   male  mascu~
    ## # ... with 77 more rows, and 5 more variables: HOMEWORLD <chr>, SPECIES <chr>,
    ## #   FILMS <list>, VEHICLES <list>, STARSHIPS <list>

## Spression de variables avec `select()`

``` r
starwars %>% select(-name)
```

    ## # A tibble: 87 x 13
    ##    height  mass hair_color    skin_color  eye_color birth_year sex    gender   
    ##     <int> <dbl> <chr>         <chr>       <chr>          <dbl> <chr>  <chr>    
    ##  1    172    77 blond         fair        blue            19   male   masculine
    ##  2    167    75 <NA>          gold        yellow         112   none   masculine
    ##  3     96    32 <NA>          white, blue red             33   none   masculine
    ##  4    202   136 none          white       yellow          41.9 male   masculine
    ##  5    150    49 brown         light       brown           19   female feminine 
    ##  6    178   120 brown, grey   light       blue            52   male   masculine
    ##  7    165    75 brown         light       blue            47   female feminine 
    ##  8     97    32 <NA>          white, red  red             NA   none   masculine
    ##  9    183    84 black         light       brown           24   male   masculine
    ## 10    182    77 auburn, white fair        blue-gray       57   male   masculine
    ## # ... with 77 more rows, and 5 more variables: homeworld <chr>, species <chr>,
    ## #   films <list>, vehicles <list>, starships <list>

``` r
starwars %>% select(-!name:mass)
```

    ## # A tibble: 87 x 3
    ##    name               height  mass
    ##    <chr>               <int> <dbl>
    ##  1 Luke Skywalker        172    77
    ##  2 C-3PO                 167    75
    ##  3 R2-D2                  96    32
    ##  4 Darth Vader           202   136
    ##  5 Leia Organa           150    49
    ##  6 Owen Lars             178   120
    ##  7 Beru Whitesun lars    165    75
    ##  8 R5-D4                  97    32
    ##  9 Biggs Darklighter     183    84
    ## 10 Obi-Wan Kenobi        182    77
    ## # ... with 77 more rows
