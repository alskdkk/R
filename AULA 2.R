# Pacotes necesario
install.packages('FSA')
install.packages('modeest')

library(FSA)
library(modeest)


mean(idades$idade)

moda <- mlv(idades$idade, method = "mfv") 
cat(moda)

amplitude <- max(idades$idade) - min(idades$idade)
amplitude 

sd(idades$idade)

quartis <- quantile(idades$idade)
quartis

turmaA <- subset(idades, turma == 'A')
turmaA

turmaB <- subset(idades, turma == 'B')
turmaB

mean(turmaA$idade)
mean(turmaB$idade)

moda <- mlv(turmaA$idade, method = "mfv") 
cat(moda)

moda <- mlv(turmaB$idade, method = "mfv") 
cat(moda)

amplitude <- max(turmaA$idade) - min(idades$idade)
amplitude 

amplitude <- max(turmaB$idade) - min(idades$idade)
amplitude 

sd(turmaA$idade)

sd(turmaB$idade)

Summarize(idades$idade)

Summarize(idades$idade ~idades$turma)





