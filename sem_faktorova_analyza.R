## Factor Analysis
library(psych)
cor.mat <- cor(num.sem)


### Factor Analysis 2014-6-30
## Model of 8 factors
fac.an1 <- fa(cor.mat, 8) 
om1 <- omega(cor.mat, 8)

fac.an1
fa.sort(fac.an1)

# TODO
#fa.diagram(fac.an1, cut=0.3)
#omega.diagram(om1, cex=0.5, cut=0.3)

## Model of x factors
# Optimal number of factors can be found:
library(rela) # ?paf
pca.ident <- paf(object=data.mat, eigcrit=1) # principal axis factor analysis

pca.ident$Factor.Loadings

# From  pca.3 we conclude k=5
fac.an2 <- fa(cor.mat, 5) 
om2 <- omega(cor.mat, 5)

fac.an2
fa.sort(fac.an2)
fa.diagram(fac.anal2, cut=0.3)



om2 <- omega(cor.mat, 5)
omega.diagram(om2, cex=0.5, cut=0.3)

## Testy

# Plotting



# Principal Component Analysis... (But in fact FA as nfactors is subsided by us)
pca.1 <- principal(cor.mat, nfactors=8)
pca.2 <- principal(cor.mat, nfactors=5)




# Anti-Image Correlation - Partial Correlation matrix
# Sampling adequacy characteristics
print(pca.ident$Anti.Image.Cor, digits=1)
pca.ident$KMO
pca.ident$MSA
pca.ident$Bartlett
pca.ident$Eigenvalues

psych::KMO(cor.mat)
psych::cortest.bartlett(cor.mat, n=nrow(num.sem) )

# Analyse Summated Scales
summated <- data.frame(matrix(NA, ncol=8, nrow=nrow(num.sem) ))

for (i in seq(nrow(num.sem))){
summated[i,1] <- sum(num.sem[i,1:4]) 
summated[i,2] <- sum(num.sem[i,5:8])
summated[i,3] <- sum(num.sem[i,9:12])
summated[i,4] <- sum(num.sem[i,13:16])
summated[i,5] <- sum(num.sem[i,17:20])
summated[i,6] <- sum(num.sem[i,21:24])
summated[i,7] <- sum(num.sem[i,25:28])
summated[i,8] <- sum(num.sem[i,29:32])}

colnames(summated) <- c("ak","cr","du","fi","in","kv","lo","sp")	

it.2 <- itemanal(as.matrix(summated))
pca.4 <- paf(object=as.matrix(summated), eigcrit=1) #nemá smysl provádìt FA, pouze pro statistiky

# xtable(pca.4$Correlation)
# xtable(pca.4$Anti.Image.Cor)

## Correlation between Cross-Selling questions and construct Loaylty
cor.data2 <- data.frame(loyal=summated$lo, num.crse1, num.crse2, num.crse3,num.crse4)
cor.mat2 <- cor(cor.data2)

for(i in 2:ncol(cor.data2)){
print(colnames(cor.data2)[i])
print(cor.test(cor.data2[ ,1], cor.data2[ ,i]))
}

xtable(cor.mat2)

