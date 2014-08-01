library(lavaan)
library(semTools)
library(xtable)

cfa.model <- "
akce =~ akce1 + akce2 + akce3 + akce4
crse =~ crse1 + crse2 + crse3 + crse4
duve =~ duve1 + duve2 + duve3 + duve4
fipo =~ fipo1 + fipo2 + fipo3 + fipo4
inpr =~ inpr1 + inpr2 + inpr3 + inpr4
kval =~ kval1 + kval2 + kval3 + kval4
loaj =~ loaj1 + loaj2 + loaj3 + loaj4
spok =~ spok1 + spok2 + spok3 + spok4"

cfa.fit <- cfa(cfa.model, data = data.sem) #it's a coffee time!
cfa.fit <- cfa(cfa.model, data = data.sem, std.lv=TRUE)


inspect( cfa.fit, "rsquare" ) #AVE

con.names <- c("akce","crse","duve","fipo","inpr","kval","loaj","spok")
aves <- c(as.matrix(inspect(cfa.fit, "rsquare")))
ave.all <- data.frame(ave=aves,const=rep(con.names,each=4) )

ave.foo <- ddply(ave.all, .(const), summarise, prumer=mean(ave) )
xtable(ave.foo)

summary(cfa.fit, fit.measures=TRUE)
reliability(cfa.fit)

summary(ave.all)

library(rela) #?itemanal
data.mat <- as.matrix(num.sem) #num.sem is created in sem_prepare_data.R
it.1 <- itemanal(data.mat)
