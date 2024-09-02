install.packages("plotly")
install.packages("dplyr")
install.packages("FSA")

library(FSA)

### 2 ###
# contar os valores por dia
totais_diarios <- as.data.frame(table(dengue$data_notificacao))

# alteras os nomes das colunas (variaveis)
colnames(totais_diarios) <-c("Data", "Ocorrências")

#graficos de linhas
plot_ly(totais_diarios, x=~Data, y=~Ocorrências, type = 'scatter', mode = 'lines')

### 3 ###
table(dengue$sexo)
round(prop.table(table(dengue$sexo)), 4) *100

### 4 ###
casos_bairros <- dengue %>%
  group_by(bairro_residencia) %>%
  summarise(contagem = n())%>%
  arrange(desc(contagem))

### 5 ###
table(dengue$local_infeccao)

### 6 ###
table(dengue$criterio_confirmacao)
round(prop.table(table(dengue$criterio_confirmacao)), 4) *100

### 7 ###
table(dengue$evolucao)
round(prop.table(table(dengue$evolucao)), 4) *100

### 8 ###
plot_ly(dengue, x = ~idade, type = 'histogram')


### 9 ###
round(Summarize(dengue$idade), 4)

### 10 ###
Summarize(dengue$idade~dengue$sexo)

### 12 ###
Summarize(dengue$idade~dengue$local_infeccao)

### 13 ###
Summarize(dengue$idade~dengue$evolucao)

### 14 ###
Summarize(dengue$idade~dengue$criterio_confirmacao)

### 15 ###
evolucao_sexo <- dengue %>%
  group_by(sexo, evolucao) %>%
  summarise(contagem = n())%>%
  arrange(desc(contagem))
  
  evolucao_sexo
  
### 16 ###
  criterio_confirmação <- dengue %>%
    group_by(sexo, criterio_confirmacao) %>%
    summarise(contagem = n())%>%
    arrange(desc(contagem))
  
  criterio_confirmação
  
### 17 ###
  evolu_loca <- dengue %>%
    group_by(evolucao, local_infeccao) %>%
    summarise(contagem = n())%>%
    arrange(desc(contagem))
  
  evolu_loca
  
### 18 ###
max(dengue$data_notificacao) - min(dengue$data_notificacao)

### 19 ###
status_idade <- dengue %>%
  group_by(evolucao)%>%
  summarise(
    mean_idade = mean(idade), sd_idade = sd(idade)
  )%>%
  arrange(desc(mean_idade))

### 20 ###
idade_bairro <- dengue %>%
   group_by(bairro_residencia)%>%
   summarise(
     mean_idade = mean(idade), sd_idade = sd(idade)
     )%>%
   arrange(desc(mean_idade))
  
plot_ly(dengue, x = ~mean(idade), y = ~bairro_residencia type = 'histogram')


