# Initialisation du jeu de données
# a Mettre le chemin du repertoire de travail à la place de RepertoireTravail
setwd("RepertoireTravail")
sathop <- read.csv2("satisfaction_hopital.csv")

# pourcentage par sexe
sathop$sexe <- factor(sathop$sexe,labels=c('homme','femme'))
table(sathop$sexe, useNA="always")/sum(table(sathop$sexe, useNA="always"))*100

# Pourcentage par metier
sathop$profession <- factor(sathop$profession,labels=c('profession1','profession2', 'profession3', 'profession4', 'profession5', 'profession6', 'profession7', 'profession8'))
table(sathop$profession, useNA="always")/sum(table(sathop$profession, useNA="always"))*100

# Pourcentage accueilli par service
sathop$service <- factor(sathop$service,labels=c('service1','service2', 'service3', 'service4', 'service5', 'service6', 'service7', 'service8'))
table(sathop$service, useNA="always")/sum(table(sathop$service, useNA="always"))*100

# chargement de la library prettyR
library(prettyR)

#description de la variable age
describe(sathop$age,num.desc=c("mean","median","sd","min","max","valid.n"))

#description de la variable score.information
describe(sathop$score.information,num.desc=c("mean","median","sd","min","max","valid.n"))

#description de la variable score.relation
describe(sathop$score.relation,num.desc=c("mean","median","sd","min","max","valid.n"))

#histogramme de score.relation
hist(sathop$score.relation)

# boxplot  de score.relation pour les hommes et les femmes 
boxplot(sathop$score.relation~sathop$sexe)
