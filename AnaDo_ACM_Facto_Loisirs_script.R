library(FactoMineR)

### Importation des donnees
loisirs = read.table("AnaDo_JeuDonnees_Loisirs.csv",
    header=TRUE, sep=";", fileEncoding="latin1")
summary(loisirs)

### Transformation de la variable TV en facteur
loisirs[,"TV"] = as.factor(loisirs[,"TV"])

### L'ACM
res.mca <- MCA(loisirs,quali.sup=19:22,quanti.sup=23)
summary(res.mca)

### Description des dimensions
dimdesc(res.mca)

### Construction des graphes
plot(res.mca,invisible=c("var","quali.sup"),cex=.5,label="none") 
plot(res.mca,invisible=c("ind","var"),hab="quali", palette=palette(c("blue","orange","darkgreen","black","red")))
plot(res.mca,choix="var")
plot(res.mca,choix="quanti.sup")
barplot(res.mca$eig[,2],main="Pourcentage d'inertie", names.arg=1:nrow(res.mca$eig))

