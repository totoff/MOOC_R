decathlon <- read.table("http://www.agrocampus-ouest.fr/math/livreR/decathlon.csv", 
   header=TRUE, sep=";",dec=".", row.names=1, check.names=FALSE, fileEncoding="latin1")
summary(decathlon)

### Chargement de FactoMineR
library(FactoMineR)

### L'ACP 
res <- PCA(decathlon, quanti.sup=11:12, quali.sup=13, ncp=Inf)
res$eig
res <- PCA(decathlon, quanti.sup=11:12, quali.sup=13, ncp=8)

### Construction de la classification ascendante hierarchique
res.hcpc <- HCPC(res, kk=Inf, min=3, max=10, consol=TRUE)

### Si vous utilisez Rstudio, il n'y a pas d'interactivité et vous devez lancer :
res.hcpc <- HCPC(res, kk=Inf, min=3, max=10, consol=TRUE, graph=FALSE)
plot(res.hcpc, choice="tree")
plot(res.hcpc, choice="3D.map")
plot(res.hcpc, choice="map",draw.tree=FALSE)

### Graphe sur les dimensions 3 et 4
plot(res.hcpc, axes=3:4)


### Resultats de la classification
names(res.hcpc)
res.hcpc$call$t
res.hcpc$data.clust
res.hcpc$desc.var
res.hcpc$desc.axes
plot(res.hcpc,axes=c(1,3))
res.hcpc$desc.ind
