library(FactoMineR)

### Importation des donnees
Nobel = read.table("AnaDo_JeuDonnees_Nobel_avecMaths.csv", header=TRUE, sep=";", 
      row.names=1, ,check.names=FALSE)
summary(Nobel)

### AFC
res.ca=CA(Nobel[1:8,])
summary(res.ca)
barplot(res.ca$eig[,2],main="Valeurs propres", names.arg=1:nrow(res.ca$eig))

### AFC avec colonne supplémentaire
res.ca=CA(Nobel, col.sup=9)

