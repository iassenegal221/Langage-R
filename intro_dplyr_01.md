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
library(dplyr)
```

    ## 
    ## Attachement du package : 'dplyr'

    ## Les objets suivants sont masqués depuis 'package:stats':
    ## 
    ##     filter, lag

    ## Les objets suivants sont masqués depuis 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
library(kableExtra)
```

    ## 
    ## Attachement du package : 'kableExtra'

    ## L'objet suivant est masqué depuis 'package:dplyr':
    ## 
    ##     group_rows

``` r
head(starwars) 
```

    ## # A tibble: 6 x 14
    ##   name     height  mass hair_color  skin_color eye_color birth_year sex   gender
    ##   <chr>     <int> <dbl> <chr>       <chr>      <chr>          <dbl> <chr> <chr> 
    ## 1 Luke Sk~    172    77 blond       fair       blue            19   male  mascu~
    ## 2 C-3PO       167    75 <NA>        gold       yellow         112   none  mascu~
    ## 3 R2-D2        96    32 <NA>        white, bl~ red             33   none  mascu~
    ## 4 Darth V~    202   136 none        white      yellow          41.9 male  mascu~
    ## 5 Leia Or~    150    49 brown       light      brown           19   fema~ femin~
    ## 6 Owen La~    178   120 brown, grey light      blue            52   male  mascu~
    ## # ... with 5 more variables: homeworld <chr>, species <chr>, films <list>,
    ## #   vehicles <list>, starships <list>

Nous utiliserons des jeux de données intégrés dans R ou des packages de
R dans le but de faciliter la reproductibité des exemples pratiques.

# La commande `select()`

-   choisit des variables en fonction de leurs noms.
-   On peut aussi renommer les variables à l’aide de `select`

## Les assistants de selection

Tidyverse implémentent un dialecte de R où les opérateurs facilitent la
sélection de variables :

-   `:`: pour sélectionner une plage de variables consécutives.

-   `!`: pour prendre le complémentaire d’un ensemble de variables.

-   `&` et `|`: pour sélectionner l’intersection ou l’union de deux
    ensembles de variables.

-   `c()`: pour combiner des sélections.

**les assistants de selection(selection helpers)**

-   `everything()`: Matches all variables.

-   `last_col()`: selectionne la dernière colonne

Ces assistants sélectionnent des variables en faisant correspondre des
modèles dans leurs noms :

-   `starts_with()`: Commence avec un prefixe.

-   `ends_with()`: Se termine avec un prefixe.

-   `contains()`: Contient une chaine de caractère.

-   `matches()`: Correspond à une expression régulière.

-   `num_range()`: Correspond à une plage numérique comme x01, x02, x03.

-   `all_of()`: Correspond aux noms de variables dans un vecteur de
    caractères. Tous les noms doivent être présents, sinon une erreur
    hors limites est renvoyée.

-   `any_of()`: même chose que all_of(), sauf qu’aucune erreur n’est
    renvoyée pour les noms qui n’existent pas.

Cet assistant sélectionne des variables avec une fonction :

-   `where()`: Applique une fonction à toutes les variables et
    sélectionne celles pour lesquelles la fonction renvoie TRUE

## Les variantes de la commande `select`

-   `select_if()`

\*`select_at()`

## Spression de variables avec `select()`a
