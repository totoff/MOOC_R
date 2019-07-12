## Lignes de code pour généger un tableau de contingence à partir des textes
# Contingence=textual(Text,num.text=2,contingence.by=1)$cont.table
# Nécessité ensuite de supprimer les mots outils, et regrouper les mots

Contingence=read.table("AnaDoTab.csv",header=TRUE,sep=";",row.names=1)

# Chargement de FactoMineR
library(FactoMineR)

## On ne conserve que les mots cités 20 fois ou plus
Contingence20 = Contingence[apply(Contingence,1,sum)>=20,]

# L'AFC
res <- CA(Contingence20)
summary(res)          ## fonction summary.CA

plot(res, cex=0.8, autoLab="y", selectRow="contrib 60", title="Représentation simultanée")

dimdesc(res)

