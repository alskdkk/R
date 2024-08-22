# instalar bibliotecas/pacotes
install.packages("plotly")
install.packages("dplyr")

# Carregar os pacotes
library(plotly)
library(dplyr)

# Gráfico de barras - Dinâmico 

freq_contrato <- salarios  %>%
  group_by(tipoContrato)  %>%
  summarise(frequencia = n ())

plot_ly(freq_contrato, x = ~tipoContrato, y = ~frequencia, type = 'bar')

# Gráficos de barras - Tradicional 

table(salarios$tipoContrato)
barplot(table(salarios$tipoContrato))

# Gráfico de pizza/setores - Dinâmico 
freq_uf <- salarios %>% 
  group_by(uf) %>%
  summarise(frequencia = n())
plot_ly(freq_uf, labes = ~uf, values = ~frequencia, type = ('pie'))

# Gráfico de pizza/setores - Tradicional
table(salarios$tipoContrato)
pie(table(salarios$tipoContrato))

# Dispersão - Dinâmico 
plot_ly(salarios, x = ~idade, y = ~salario, type = 'scatter', mode = 'markers')

cor.test(salarios$idade,salarios$salario)

# Dispersão - Tradional

plot(salarios$idade, salarios$salario)


# Histograma - Dinâmico 

plot_ly(salarios, x = ~idade, type = 'histogram')

# Histograma - Tradicional

hist(salarios$idade)

# Boxplot - Dinâmico 
plot_ly(salarios, y = ~salario, type = 'box') # univariado


plot_ly(salarios, x = ~uf, y = ~salario, type = 'box') # Bivariado


# Boxplot - Tradicional

boxplot(salarios$salario) # univariado
boxplot(salarios$salario~salarios$tipoContrato) # Bivariado


# QQ-Plot - Tradicional 
qqnorm(salarios$idade)
qqline(salarios$idade)



















