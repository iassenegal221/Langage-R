---
title: "Introduction à Rmarkdown"
author: "Amsata Niang"
date: "16/03/2022"
output:
  pdf_document: default
  html_document: default
  word_document: default
---



# Voici un titre

## 2ieme niveeau
### 3ieme niveau
#### 4ieme niveau

It is recommended that you download the "Basic MiKTeX Installer" from the download page. This allows you to set up a basic MiKTeX system. And since MiKTeX has the ability to download needed packages on-the-fly from the Internet, you will not miss any feature.

It is possible to install a complete MiKTeX system. For that purpose you can use the "MiKTeX Net Installer" which can be downloaded from the download page.

**un texte en gras**

Voici un listing 

* Item 1
* Item 2

1. Un autre item
2. Deux

# Equation latex

Voici une équation : $y=ax^2+bx^3+\frac{\pi}{2}$

Voici une équation : $$y=ax^2+bx^3+\frac{\pi}{2}$$

$$\int_{i=1}^{n}x_{i}$$
mettre des liens

[texte du lien](https://miktex.org/howto/download-miktex)

mettre des photos

![legende](https://ulyngs.github.io/rmarkdown-workshop/slides/figures/rmarkdown.png)


# Ajout du code R

chunk

```
##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
## 1          5.1         3.5          1.4         0.2  setosa
## 2          4.9         3.0          1.4         0.2  setosa
## 3          4.7         3.2          1.3         0.2  setosa
## 4          4.6         3.1          1.5         0.2  setosa
## 5          5.0         3.6          1.4         0.2  setosa
## 6          5.4         3.9          1.7         0.4  setosa
```

#titre


```r
library(ggplot2)
#ggplot(iris,aes(x=Sepal.Length,y=Species))+geom_boxplot()
x=rnorm(1)*100
```

## Comment dynamiser des commentaires 80.8360798

affichier un texte sous format de code dplyr `dplyr()`

<h1 style="color:blue;font-size:100px"> Titre HTML</h1>

<font style="color:orange"> Un texte orange </font>

