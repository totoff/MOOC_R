library(FactoMineR)

###
## Il est nécessaire de récupérer le jeu de données AnaDo_JeuDonnees_TemperatFrance.csv
## avant de l'importer

### Importation des donnees
temperature <- read.table("AnaDo_JeuDonnees_TemperatFrance.csv",
        header=TRUE, sep=";", dec=".", row.names=1, fileEncoding="latin1")
summary(temperature)

### L'ACP
res <- PCA(temperature, quanti.sup=13:16,quali.sup=17)

### Construction de la classification ascendante hierarchique
res.hcpc <- HCPC(res)

### Si vous utilisez Rstudio, il n'y a pas d'interactivité et vous devez lancer :
res.hcpc <- HCPC(res, graph=FALSE, nb.clust=3)
plot(res.hcpc,choice="tree")
plot(res.hcpc,choice="3D.map")
plot(res.hcpc,choice="map",draw.tree=FALSE)

### Resultats de la classification
names(res.hcpc)
res.hcpc$data.clust
res.hcpc$desc.var
res.hcpc$desc.axes
res.hcpc$desc.ind

