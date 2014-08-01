library(plyr)
library(dplyr)

data.in <- read.csv("sem_data.txt", sep="\t", fileEncoding="UTF8")
colnames(data.in) <- c(
"time","sex","m.status","empl","age",
"edu","n.banks","spok1","bspo","bnes",
"n.prod","inpr1","duve1","inpr2","inpr3",
"fipo1","fipo2","fipo3","akce1","fipo4",
"akce2","crse1","kval1","akce3","kval2",
"kval3","crse2","loaj1","kval4","duve2",
"duve3","duve4","spok2","spok3","spok4",
"loaj2","inpr4","loaj3","loaj4","crse3",
"crse4","akce4")

data.in$age <- factor(data.in$age, levels=c("Do 30 let", "30-50 let", "51 a více let"), ordered=TRUE)
data.in$edu <- factor(data.in$edu, levels=c("Základní", "Støedoškolské", "Vysokoškolské"), ordered=TRUE)
data.in$n.banks <- factor(data.in$n.banks, levels=c("1", "2", "3 a více"), ordered=TRUE)
data.in$n.prod <- factor(data.in$n.prod, levels=c("1 produkt", "2 produkty", "3 produkty", "4 a více produktù"), ordered=TRUE)

likert.data0 <- data.in[ ,c(8, 12:42)]
likert.data1 <- likert.data0
## CODE BELOW DOES NOT WORK - any clue guys?
likert.data1 <- data.frame(apply(likert.data0, 2, function(x){
factor(x, levels=c("zcela nesouhlasím", "nesouhlasím", "nezaujímám postoj",
 "souhlasím", "zcela souhlasím"), ordered=TRUE) } ) )
##

likert.data1$akce1 <- factor(likert.data1$akce1, levels=c("zcela nesouhlasím", "nesouhlasím", "nezaujímám postoj", "souhlasím", "zcela souhlasím"), ordered=TRUE)
likert.data1$akce2 <- factor(likert.data1$akce2, levels=c("zcela nesouhlasím", "nesouhlasím", "nezaujímám postoj", "souhlasím", "zcela souhlasím"), ordered=TRUE)
likert.data1$akce3 <- factor(likert.data1$akce3, levels=c("zcela nesouhlasím", "nesouhlasím", "nezaujímám postoj", "souhlasím", "zcela souhlasím"), ordered=TRUE)
likert.data1$akce4 <- factor(likert.data1$akce4, levels=c("zcela nesouhlasím", "nesouhlasím", "nezaujímám postoj", "souhlasím", "zcela souhlasím"), ordered=TRUE)
likert.data1$crse1 <- factor(likert.data1$crse1, levels=c("zcela nesouhlasím", "nesouhlasím", "nezaujímám postoj", "souhlasím", "zcela souhlasím"), ordered=TRUE)
likert.data1$crse2 <- factor(likert.data1$crse2, levels=c("zcela nesouhlasím", "nesouhlasím", "nezaujímám postoj", "souhlasím", "zcela souhlasím"), ordered=TRUE)
likert.data1$crse3 <- factor(likert.data1$crse3, levels=c("zcela nesouhlasím", "nesouhlasím", "nezaujímám postoj", "souhlasím", "zcela souhlasím"), ordered=TRUE)
likert.data1$crse4 <- factor(likert.data1$crse4, levels=c("zcela nesouhlasím", "nesouhlasím", "nezaujímám postoj", "souhlasím", "zcela souhlasím"), ordered=TRUE)
likert.data1$duve1 <- factor(likert.data1$duve1, levels=c("zcela nesouhlasím", "nesouhlasím", "nezaujímám postoj", "souhlasím", "zcela souhlasím"), ordered=TRUE)
likert.data1$duve2 <- factor(likert.data1$duve2, levels=c("zcela nesouhlasím", "nesouhlasím", "nezaujímám postoj", "souhlasím", "zcela souhlasím"), ordered=TRUE)
likert.data1$duve3 <- factor(likert.data1$duve3, levels=c("zcela nesouhlasím", "nesouhlasím", "nezaujímám postoj", "souhlasím", "zcela souhlasím"), ordered=TRUE)
likert.data1$duve4 <- factor(likert.data1$duve4, levels=c("zcela nesouhlasím", "nesouhlasím", "nezaujímám postoj", "souhlasím", "zcela souhlasím"), ordered=TRUE)
likert.data1$fipo1 <- factor(likert.data1$fipo1, levels=c("zcela nesouhlasím", "nesouhlasím", "nezaujímám postoj", "souhlasím", "zcela souhlasím"), ordered=TRUE)
likert.data1$fipo2 <- factor(likert.data1$fipo2, levels=c("zcela nesouhlasím", "nesouhlasím", "nezaujímám postoj", "souhlasím", "zcela souhlasím"), ordered=TRUE)
likert.data1$fipo3 <- factor(likert.data1$fipo3, levels=c("zcela nesouhlasím", "nesouhlasím", "nezaujímám postoj", "souhlasím", "zcela souhlasím"), ordered=TRUE)
likert.data1$fipo4 <- factor(likert.data1$fipo4, levels=c("zcela nesouhlasím", "nesouhlasím", "nezaujímám postoj", "souhlasím", "zcela souhlasím"), ordered=TRUE)
likert.data1$inpr1 <- factor(likert.data1$inpr1, levels=c("zcela nesouhlasím", "nesouhlasím", "nezaujímám postoj", "souhlasím", "zcela souhlasím"), ordered=TRUE)
likert.data1$inpr2 <- factor(likert.data1$inpr2, levels=c("zcela nesouhlasím", "nesouhlasím", "nezaujímám postoj", "souhlasím", "zcela souhlasím"), ordered=TRUE)
likert.data1$inpr3 <- factor(likert.data1$inpr3, levels=c("zcela nesouhlasím", "nesouhlasím", "nezaujímám postoj", "souhlasím", "zcela souhlasím"), ordered=TRUE)
likert.data1$inpr4 <- factor(likert.data1$inpr4, levels=c("zcela nesouhlasím", "nesouhlasím", "nezaujímám postoj", "souhlasím", "zcela souhlasím"), ordered=TRUE)
likert.data1$kval1 <- factor(likert.data1$kval1, levels=c("zcela nesouhlasím", "nesouhlasím", "nezaujímám postoj", "souhlasím", "zcela souhlasím"), ordered=TRUE)
likert.data1$kval2 <- factor(likert.data1$kval2, levels=c("zcela nesouhlasím", "nesouhlasím", "nezaujímám postoj", "souhlasím", "zcela souhlasím"), ordered=TRUE)
likert.data1$kval3 <- factor(likert.data1$kval3, levels=c("zcela nesouhlasím", "nesouhlasím", "nezaujímám postoj", "souhlasím", "zcela souhlasím"), ordered=TRUE)
likert.data1$kval4 <- factor(likert.data1$kval4, levels=c("zcela nesouhlasím", "nesouhlasím", "nezaujímám postoj", "souhlasím", "zcela souhlasím"), ordered=TRUE)
likert.data1$loaj1 <- factor(likert.data1$loaj1, levels=c("zcela nesouhlasím", "nesouhlasím", "nezaujímám postoj", "souhlasím", "zcela souhlasím"), ordered=TRUE)
likert.data1$loaj2 <- factor(likert.data1$loaj2, levels=c("zcela nesouhlasím", "nesouhlasím", "nezaujímám postoj", "souhlasím", "zcela souhlasím"), ordered=TRUE)
likert.data1$loaj4 <- factor(likert.data1$loaj4, levels=c("zcela nesouhlasím", "nesouhlasím", "nezaujímám postoj", "souhlasím", "zcela souhlasím"), ordered=TRUE)
likert.data1$spok1 <- factor(likert.data1$spok1, levels=c("zcela nesouhlasím", "nesouhlasím", "nezaujímám postoj", "souhlasím", "zcela souhlasím"), ordered=TRUE)
likert.data1$spok2 <- factor(likert.data1$spok2, levels=c("zcela nesouhlasím", "nesouhlasím", "nezaujímám postoj", "souhlasím", "zcela souhlasím"), ordered=TRUE)
likert.data1$spok3 <- factor(likert.data1$spok3, levels=c("zcela nesouhlasím", "nesouhlasím", "nezaujímám postoj", "souhlasím", "zcela souhlasím"), ordered=TRUE)
likert.data1$spok4 <- factor(likert.data1$spok4, levels=c("zcela nesouhlasím", "nesouhlasím", "nezaujímám postoj", "souhlasím", "zcela souhlasím"), ordered=TRUE)

## Negative question!
likert.data1$loaj3 <- factor(likert.data1$loaj3, levels=c("zcela souhlasím", "souhlasím", "nezaujímám postoj", "nesouhlasím", "zcela nesouhlasím"), ordered=TRUE)

data.visual <- data.frame(cbind(data.in[ ,2:7], likert.data1 ))
data.sem <- likert.data1[, order(colnames(likert.data1))]

## Check
str(likert.data1)
table(likert.data1$akce1)

num.akce1 <- as.numeric(data.sem$akce1)
num.akce2 <- as.numeric(data.sem$akce2)
num.akce3 <- as.numeric(data.sem$akce3)
num.akce4 <- as.numeric(data.sem$akce4)
num.crse1 <- as.numeric(data.sem$crse1)
num.crse2 <- as.numeric(data.sem$crse2)
num.crse3 <- as.numeric(data.sem$crse3)
num.crse4 <- as.numeric(data.sem$crse4)
num.duve1 <- as.numeric(data.sem$duve1)
num.duve2 <- as.numeric(data.sem$duve2)
num.duve3 <- as.numeric(data.sem$duve3)
num.duve4 <- as.numeric(data.sem$duve4)
num.fipo1 <- as.numeric(data.sem$fipo1)
num.fipo2 <- as.numeric(data.sem$fipo2)
num.fipo3 <- as.numeric(data.sem$fipo3)
num.fipo4 <- as.numeric(data.sem$fipo4)
num.inpr1 <- as.numeric(data.sem$inpr1)
num.inpr2 <- as.numeric(data.sem$inpr2)
num.inpr3 <- as.numeric(data.sem$inpr3)
num.inpr4 <- as.numeric(data.sem$inpr4)
num.kval1 <- as.numeric(data.sem$kval1)
num.kval2 <- as.numeric(data.sem$kval2)
num.kval3 <- as.numeric(data.sem$kval3)
num.kval4 <- as.numeric(data.sem$kval4)
num.loaj1 <- as.numeric(data.sem$loaj1)
num.loaj2 <- as.numeric(data.sem$loaj2)
num.loaj3 <- as.numeric(data.sem$loaj3)
num.loaj4 <- as.numeric(data.sem$loaj4)
num.spok1 <- as.numeric(data.sem$spok1)
num.spok2 <- as.numeric(data.sem$spok2)
num.spok3 <- as.numeric(data.sem$spok3)
num.spok4 <- as.numeric(data.sem$spok4)

num.sem <- data.frame(cbind(
num.akce1, num.akce2, num.akce3, num.akce4, 
num.crse1, num.crse2, num.crse3, num.crse4, 
num.duve1, num.duve2, num.duve3, num.duve4, 
num.fipo1, num.fipo2, num.fipo3, num.fipo4, 
num.inpr1, num.inpr2, num.inpr3, num.inpr4, 
num.kval1, num.kval2, num.kval3, num.kval4, 
num.loaj1, num.loaj2, num.loaj3, num.loaj4, 
num.spok1, num.spok2, num.spok3, num.spok4))
