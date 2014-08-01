# Read data from "sem_prepare_data.R"
library(likert)
library(reshape) #without reshape errors accur in grouping
plot.age <- likert(data.sem[ ,25:28], grouping=data.in$age)
plot.edu <- likert(data.sem[ ,25:28], grouping=data.in$edu)
plot.empl <- likert(data.sem[ ,1:4], grouping=data.in$empl)
plot.nbank <- likert(data.sem[ ,1:4], grouping=data.in$n.bank) 
plot.nprod <- likert(data.sem[ ,1:4], grouping=data.in$n.prod) 

[ ,1:4] #
[ ,5:8]
[ ,9:12]
[ ,13:16]
[ ,17:20]
[ ,21:24]
[ ,25:28]
[ ,29:32]

plot(plot.edu)
plot(plot.edu, centered=FALSE)


## Analysis of one construct
# Akceptace cen klientem

data.edu <- data.sem[ ,1:4]


colnames(data.edu) <- c(
 "S cenami bankovních produktù a služeb mé banky jsem spokojen/a.",
 "Úroveò cen mých bankovních produktù odpovídá jejich kvalitì.",
 "Ceník své banky považuji za transparentní.",
 "Zmìny cen bankovních produktù byly pro mì zatím vždy pøijatelné.")


# Loajalita
data.edu <- data.sem[ ,25:28]
colnames(data.edu) <- c(
 "Svou banku rád doporuèuji i svým známým.",
 "V nejbližších tøech letech i nadále plánuji využívat služeb mé stávající banky.",
 "Zvažuji zmìnu své hlavní banky.",
 "Zùstal bych vìrný své bance/bankám i kdyby mi jiné banky nabízely podobné produkty.")

plot.edu <- likert(data.edu, grouping=data.in$edu)
plot(plot.edu)
plot(plot.edu, centered=FALSE)

pdf()
dev.off()


library(semPlot)
semPaths(cfa.fit, "model", "est")
semPaths(cfa.fit, "model", "est", style = "lisrel")

