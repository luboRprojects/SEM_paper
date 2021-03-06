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
 "S cenami bankovn�ch produkt� a slu�eb m� banky jsem spokojen/a.",
 "�rove� cen m�ch bankovn�ch produkt� odpov�d� jejich kvalit�.",
 "Cen�k sv� banky pova�uji za transparentn�.",
 "Zm�ny cen bankovn�ch produkt� byly pro m� zat�m v�dy p�ijateln�.")


# Loajalita
data.edu <- data.sem[ ,25:28]
colnames(data.edu) <- c(
 "Svou banku r�d doporu�uji i sv�m zn�m�m.",
 "V nejbli���ch t�ech letech i nad�le pl�nuji vyu��vat slu�eb m� st�vaj�c� banky.",
 "Zva�uji zm�nu sv� hlavn� banky.",
 "Z�stal bych v�rn� sv� bance/bank�m i kdyby mi jin� banky nab�zely podobn� produkty.")

plot.edu <- likert(data.edu, grouping=data.in$edu)
plot(plot.edu)
plot(plot.edu, centered=FALSE)

pdf()
dev.off()


library(semPlot)
semPaths(cfa.fit, "model", "est")
semPaths(cfa.fit, "model", "est", style = "lisrel")

