### SEM model
library(lavaan)
#library(psych)
library(semPlot)
# num.sem -- sem_prepare_data.R 
str(num.sem)
colnames(num.sem) <- c(substr(colnames(num.sem),5,12))

# Model I - initial model
sem.model <- "
akce =~ akce1 + akce2 + akce3 + akce4
crse =~ crse1 + crse2 + crse3 + crse4
duve =~ duve1 + duve2 + duve3 + duve4
fipo =~ fipo1 + fipo2 + fipo3 + fipo4
inpr =~ inpr1 + inpr2 + inpr3 + inpr4
kval =~ kval1 + kval2 + kval3 + kval4
loaj =~ loaj1 + loaj2 + loaj3 + loaj4
spok =~ spok1 + spok2 + spok3 + spok4

fipo ~ inpr
akce ~ inpr
duve ~ inpr
akce ~ fipo
spok ~ duve
spok ~ akce
spok ~ kval
kval ~ inpr
kval ~ duve
kval ~ fipo
loaj ~ spok
crse ~ spok
crse ~ loaj
"

# Model IIa - from 2014-7-27
# This model i wrong as it tries to set covariance
# relations between exogenous variables. Although these relations
# are cov. by its nature, we have to model them as causal and test
# them from both narrows (which is TODO...)
sem.model <- "
akce =~ akce1 + akce2 + akce3 + akce4
crse =~ crse1 + crse2 + crse3 + crse4
duve =~ duve1 + duve2 + duve3 + duve4
fipo =~ fipo1 + fipo2 + fipo3 + fipo4
inpr =~ inpr1 + inpr2 + inpr3 + inpr4
kval =~ kval1 + kval2 + kval3 + kval4
loaj =~ loaj1 + loaj2 + loaj3 + loaj4
spok =~ spok1 + spok2 + spok3 + spok4

fipo ~ inpr # H1
duve ~ inpr # H4
duve ~~ kval + spok + loaj # H7 + H10 + H14
akce ~ fipo + inpr + kval # H5 + H3 + H9
akce ~~ loaj # H13
kval ~ fipo + inpr # H6 + H2
spok ~ akce + kval # H8 + H11
spok ~~ loaj # H12
crse ~ kval + loaj + spok  # H15 + H17 + H16
"

# Model IIb - from 2014-7-27
sem.model <- "
akce =~ akce1 + akce2 + akce3 + akce4
crse =~ crse1 + crse2 + crse3 + crse4
duve =~ duve1 + duve2 + duve3 + duve4
fipo =~ fipo1 + fipo2 + fipo3 + fipo4
inpr =~ inpr1 + inpr2 + inpr3 + inpr4
kval =~ kval1 + kval2 + kval3 + kval4
loaj =~ loaj1 + loaj2 + loaj3 + loaj4
spok =~ spok1 + spok2 + spok3 + spok4

fipo ~ inpr	#H1
kval ~ inpr	#H2
akce ~ inpr	#H3
duve ~ inpr	#H4
akce ~ fipo	#H5
kval ~ fipo	#H6
kval ~ duve	#H7 (cor)
spok ~ akce	#H8
akce ~ kval	#H9
spok ~ duve	#H10 (cor)
spok ~ kval	#H11
loaj ~ spok	#H12 (cor)
loaj ~ akce	#H13 (cor)
loaj ~ duve	#H14 (cor)
crse ~ kval	#H15 
crse ~ spok	#H16
crse ~ loaj	#H17
"

#---------

fit.sem <- sem(sem.model, data = num.sem, std.lv=TRUE) # , sample.nobs = 10
summary(fit.sem, standardized = FALSE,fit.measures=TRUE)
semPaths(fit.sem, "model", "est")
semPaths(fit.sem, style = "lisrel",curvePivot = TRUE)
semPaths(fit.sem, style = "lisrel",whatLabels="stand", layout = "circle2")

# layout: tree, circle, spring, tree2, circle2

library(semPlot)
semPaths(fit.sem)

## Models Comparison
fit.sem1 <- sem(sem.model, data = num.sem, std.lv=TRUE)
fit.sem2 <- sem(sem.model, data = num.sem, std.lv=TRUE)
anova(fit.sem1, fit.sem2)







