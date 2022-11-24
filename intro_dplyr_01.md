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
library(kableExtra)
head(iris) %>% kbl() %>% kable_styling()
```

<table class="table" style="margin-left: auto; margin-right: auto;">
<thead>
<tr>
<th style="text-align:right;">
Sepal.Length
</th>
<th style="text-align:right;">
Sepal.Width
</th>
<th style="text-align:right;">
Petal.Length
</th>
<th style="text-align:right;">
Petal.Width
</th>
<th style="text-align:left;">
Species
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:right;">
5.1
</td>
<td style="text-align:right;">
3.5
</td>
<td style="text-align:right;">
1.4
</td>
<td style="text-align:right;">
0.2
</td>
<td style="text-align:left;">
setosa
</td>
</tr>
<tr>
<td style="text-align:right;">
4.9
</td>
<td style="text-align:right;">
3.0
</td>
<td style="text-align:right;">
1.4
</td>
<td style="text-align:right;">
0.2
</td>
<td style="text-align:left;">
setosa
</td>
</tr>
<tr>
<td style="text-align:right;">
4.7
</td>
<td style="text-align:right;">
3.2
</td>
<td style="text-align:right;">
1.3
</td>
<td style="text-align:right;">
0.2
</td>
<td style="text-align:left;">
setosa
</td>
</tr>
<tr>
<td style="text-align:right;">
4.6
</td>
<td style="text-align:right;">
3.1
</td>
<td style="text-align:right;">
1.5
</td>
<td style="text-align:right;">
0.2
</td>
<td style="text-align:left;">
setosa
</td>
</tr>
<tr>
<td style="text-align:right;">
5.0
</td>
<td style="text-align:right;">
3.6
</td>
<td style="text-align:right;">
1.4
</td>
<td style="text-align:right;">
0.2
</td>
<td style="text-align:left;">
setosa
</td>
</tr>
<tr>
<td style="text-align:right;">
5.4
</td>
<td style="text-align:right;">
3.9
</td>
<td style="text-align:right;">
1.7
</td>
<td style="text-align:right;">
0.4
</td>
<td style="text-align:left;">
setosa
</td>
</tr>
</tbody>
</table>

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
