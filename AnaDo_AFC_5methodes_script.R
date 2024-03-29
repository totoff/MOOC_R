## Lignes de code pour g�n�ger un tableau de contingence � partir des textes
# Contingence=textual(Text,num.text=2,contingence.by=1)$cont.table
# N�cessit� ensuite de supprimer les mots outils, et regrouper les mots

Contingence=read.table("AnaDoTab.csv",header=TRUE,sep=";",row.names=1)

# Chargement de FactoMineR
library(FactoMineR)

## On ne conserve que les mots cit�s 20 fois ou plus
Contingence20 = Contingence[apply(Contingence,1,sum)>=20,]

# L'AFC
res <- CA(Contingence20)
summary(res)          ## fonction summary.CA

plot(res, cex=0.8, autoLab="y", selectRow="contrib 60", title="Repr�sentation simultan�e")

dimdesc(res)

