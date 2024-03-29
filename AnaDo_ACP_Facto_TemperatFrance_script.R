library(FactoMineR)

###
## Il est n�cessaire de r�cup�rer le jeu de donn�es AnaDo_JeuDonnees_TemperatFrance.csv
## avant de l'importer

### Importation des donnees
temperature <- read.table("AnaDo_JeuDonnees_TemperatFrance.csv",
        header=TRUE, sep=";", dec=".", row.names=1, fileEncoding="latin1")
summary(temperature)

### L'ACP
res <- PCA(temperature, quanti.sup=13:16,quali.sup=17)

summary(res, nbelements=Inf)  ## donne toutes les sorties

## Graphe en coloriant les villes en fonction da le variable r�gion
plot(res,habillage="R�gion")
