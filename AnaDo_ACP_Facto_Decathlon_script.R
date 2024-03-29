### Importation des donnees (les donn�es sont import�es directement depuis internet
decathlon <- read.table("http://www.agrocampus-ouest.fr/math/livreR/decathlon.csv", 
   header=TRUE, sep=";",dec=".", row.names=1, fileEncoding="latin1", check.names=FALSE)
summary(decathlon)

### Chargement de FactoMineR
library(FactoMineR)

### Aide de la fonction
?PCA

### L'ACP avec tout en actif
res <- PCA(decathlon[,1:10])
summary(res)

### L'ACP avec des variables suppl�mentaires
res <- PCA(decathlon, quanti.sup=11:12, quali.sup=13)
summary(res, nbelements=Inf)

### Description des dimensions
dimdesc(res)
dimdesc(res, proba=0.2)

### Coloriage des individus en fonction de leur modalite
plot(res, cex=0.8, invisible="quali", title="Graphe des individus")
plot(res, cex=0.8, habillage="Competition")

### Ellipses de confiance autour des modalit�s
plotellipses(res)

### Graphes sur les dimensions 3 et 4
plot(res, choix="ind", cex=0.8, habillage=13, title="Graphe des individus", axes=3:4)
plot(res, choix="var", title="Graphe des variables", axes=3:4)

### S�lection des individus
plot(res, cex=0.8, habillage=13, select="cos2 0.7")
plot(res, cex=0.8, habillage=13, select="contrib 5")
plot(res, cex=0.8, habillage=13, select=c("Clay","Karpov"))

### S�lection des variables
plot(res, choix="var", select="contrib 5")

### 
plot(res, cex=0.8, habillage=13, select="cos2 0.7", title="Performances au d�cathlon",
  cex.main=1.1, cex.axis=0.9, shadow=TRUE, auto="y")
