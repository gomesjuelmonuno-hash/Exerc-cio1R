##########################################
# Lista de exercícios 3
# Autor: Juelmo Gomes
# Data: 08/05/2026
##########################################
##########################################
# Removendo os objetos ativos
rm(list = ls())

##########################################
# Leitura da base de dados
##########################################
<- "https://raw.githubusercontent.com/edsonzmartinez/CursoR/main/codigos/dadosclimaticosRP.csv"
# Lendo a base
dados <- read.csv2(urlfile)
# Lendo arquivos pelo navegador
urlfile <- "https://codeberg.org/edsonzmartinez/CursoR/raw/branch/main/dadosclimaticosRP.csv"
clima   <- read.csv2(urlfile, fileEncoding = "Windows-1252")

# Removendo os objetos ativos
rm(list=ls())

# Lendo arquivos pelo navegador
urlfile <- "https://codeberg.org/edsonzmartinez/CursoR/raw/branch/main/dadosclimaticosRP.csv"
clima   <- read.csv2(urlfile, fileEncoding = "Windows-1252")

# Removendo espaço na variável mês 
# Antes
unique(clima$mes)
clima$mes <- trimws(clima$mes)
# Depois
unique(clima$mes)
clima

# --- Exercício 1 ---

# a)
names(clima) 
# b)
head(clima)
# c)
tail(clima)
# d)
clima[20:40,]
# e)
clima[clima$ano == 1993, ]
# f)
# Observe a variável mês dentro de summary no primeiro caso
summary(clima)
# O R fica colocando a ordem do mês como alfabética, nesse caso, preciso criar 
# uma variável com o mês na ordem correta para conseguir rearanjar a variável na 
# forma que eu quero.
meses_ordem <- c("janeiro", "fevereiro", "marÃ§o", "abril", "maio", "junho",
                 "julho", "agosto", "setembro", "outubro", "novembro", "dezembro")

# A função factor é muito útil para transformar texto em uma categoria, o que
# facilita bastante o R a trabalhar com estatística de variáveis da classe caracter.
# Além disso, ele também permite que você especifique como ela será ordenada.
clima$mes <- factor(clima$mes, levels = meses_ordem, ordered = TRUE)
# Observe como a variável mês passa a ser contabilizada, mudando a forma como tratada pelo R.
summary(clima)

# Boxplot da quantidade de precipitação das chuvas em função do mês
boxplot(precipitacao ~ mes, data = clima,
        main = "Distribuição da precipitação por mês em Ribeirão Preto",
        xlab = "Mês", ylab = "Precipitação (mm)",
        col = "lightblue", las = 2, cex.axis = 0.8)

# g)
# Se eu coloco o gráfico da temperatura em função do ano, o R me retorna um traçado 
# direto de ano a ano, sem a variação mensal. Para que o R me retorne um gráfico
# em função do mes de cada ano, precisamos juntar as duas variáveis em uma.
# Um atalho, para ordernar depois, é transformar a variável mês de texto para número,
# algo parecido de escrever 01/01/1991 ao invés de primeiro de janeiro de 1991.

# Aqui eu transformo o mês em número
clima$mes_num <- as.numeric(clima$mes)
# Aqui eu junto e transformo as variaveis ano e mês em data.
clima$data <- as.Date(paste(clima$ano, clima$mes_num, "01", sep = "-"))
clima <- clima[order(clima$data), ]

# Expandindo as margens para legenda inferior
par(mar = c(7, 4, 4, 2) + 0.1)

# Como vamos adicionar dois dados relativamente distantes, é interessante antes 
# de tudo definir essas distancias para que ambos apareçam no gráfico.
y_range <- range(c(clima$tempmaxmensal, clima$tempmenmensal), na.rm = TRUE)

# Plot inicial da temperatura máxima média no mês em função da váriavel criada data.
# Também vamos tirar a legenda do eixo x com xaxt para conseguir numerar ano a ano depois.
plot(clima$data, clima$tempmaxmensal, 
     type = "l", col = "red", lwd = 1.5,
     xlab = "Ano", ylab = "Temperatura (°C)",
     main = "Temperaturas Máximas e Mínimas Mensais - Ribeirão Preto",
     ylim = y_range, xaxt = "n")
# Aqui adicionamos a temperatura minima média que faltava.
lines(clima$data, clima$tempmenmensal, col = "blue", lwd = 1.5)

# Primeiro vamos criar uma variável tipo data com apenas o ano, sem o mês e dia.
anos_unicos <- sort(unique(clima$ano))
datas_anos <- as.Date(paste(anos_unicos, "01", "01", sep = "-"))
# Criando eixo X, numerando ano a ano
axis.Date(1, at = datas_anos, format = "%Y", las = 2, cex.axis = 0.8)

# Para explicitar o que as linhas representam, podemos adicionar uma legenda.
legend(x = "bottom", 
       legend = c("Máxima mensal", "Mínima mensal"),
       col = c("red", "blue"), lty = 1, lwd = 1.5,
       horiz = TRUE, bty = "n", inset = c(0, -0.2), xpd = TRUE)

#Expanda a imagem para visualizar as legendas
