##########################################
# Lista de exercícios 4
# Autor: Juelmo Gomes
# Data: 08/05/2026
##########################################
##########################################
# Removendo os objetos ativos
rm(list=ls())

# Lendo arquivos pelo navegador
antropo <- read.table("https://codeberg.org/edsonzmartinez/CursoR/raw/branch/main/antropo.txt", header = TRUE)
head(antropo)

# --- Exercício 1 ---
antropo$PesoKg<- antropo$Weight*0.45359237

# --- Exercício 2 ---
antropo$Alturacm <- antropo$Height*2.54

# --- Exercício 3 ---
boxplot(antropo)
# --- Exercício 4 ---
plot(Alturacm ~ PesoKg, data = antropo,
     xlab = "Peso (kg)", ylab = "Altura (cm)",
     main = "Altura vs Peso")
# O Gráfico ficou muito expandido por conta de dois pontos muito distantes.
identify(antropo$PesoKg, antropo$Alturacm)

# --- Exercício 5 ---
hist(antropo$Age)
hist(antropo$PesoKg)
hist(antropo$Alturacm)

# --- Exercício 6 ---
plot(Fat ~ Density + Age + PesoKg + Alturacm + Neck + Chest + Abdomen + Hip 
     + Thigh + Knee + Ankle + Biceps + Forearm + Wrist, data = antropo)

# --- Exercício 7 ---
correlacoes <- cor(antropo[, -which(names(antropo) == "Fat")],
                   antropo$Fat)
correlacoes

# --- Exercício 8 ---
# Abdomen é a variável com correlação positiva mais forte e a densidade é a 
# correlação negativa mais forte, logo seguida de altura.

# --- Exercício 9 ---

antropo$MeiaIdade <- as.logical(antropo$Age>45)

# --- Exercício 10 ---

# Eliminando os dados que não serão usados
antropo$Weight <- NULL
antropo$Height <- NULL

# Englobando as variáveis para que consiga englobar a plotagem de gráfico em um for.
vars <- c("Density", "Fat", "Age", "Neck", "Chest", "Abdomen", 
          "Hip", "Thigh", "Knee", "Ankle", "Biceps", "Forearm", 
          "Wrist", "PesoKg", "Alturacm")

# --- Exercício 9 ---

antropo$MeiaIdade <- as.logical(antropo$Age>45)

# --- Exercício 10 ---

# Eliminando os dados que não serão usados
antropo$Weight <- NULL
antropo$Height <- NULL

# Englobando as variáveis para que consiga englobar a plotagem de gráfico em um for.
vars <- c("Density", "Fat", "Age", "Neck", "Chest", "Abdomen", 
          "Hip", "Thigh", "Knee", "Ankle", "Biceps", "Forearm", 
          "Wrist", "PesoKg", "Alturacm")

# Configuração gráfica robusta
par(mfrow = c(4, 4), mar = c(3, 3, 2, 1), mgp = c(1.8, 0.5, 0))

for (v in vars) {
  boxplot(antropo[[v]] ~ antropo$MeiaIdade,
          main = v, 
          xlab = "", ylab = v,
          col = c("#87CEEB", "#FFA07A"),  # azul claro e laranja claro
          names = c("Não", "Sim"))
  
  # --- Exercício 11 ---
  
  
  for (v in vars) {
    qqnorm(antropo[[v]],main = v,pch=19)
    qqline(antropo[[v]], lty = 2, col = "red") 
  }
  # A maior parte dos dados dessas variáveis estão dentro da normalidade, com excessão
  # Daqueles pontos já identificados que já eram visíveiss pelo plot.
  
  # --- Exercício 12 ---
  # O exercício não especificava qual tipo de teste era para ser usado, então usei
  # todos que estavam disponíveis no tareial didático.
  
  # Kolmogorov‑Smirno
  ks.test(antropo$Neck, "pnorm", mean(antropo$Neck), sd(antropo$Neck))
  for (v in vars) {
    ks.test(antropo[[v]], "pnorm", mean(antropo[[v]]), sd(antropo[[v]]))
  }
  # Aparentemente, esse teste é sensível a empates nas variáveis e isso faz com que
  # os resultados n sejam confiáveis mesmo em grandes quantidades.
  
  # Shapiro‑Wilk
  for (v in vars) {
    print(v)
    print(shapiro.test(antropo[[v]]))
  }
  # Nesse caso deu certo, agora é possível haveriguar se as diferenças encontradas
  # são significativas em cada caso.
  
  # F test
  var.test(antropo$Neck ~ antropo$MeiaIdade)
  for (v in vars) {
    print(v)
    print(var.test(antropo[[v]] ~ antropo$MeiaIdade))
  }
  # Aqui também funcionou e com resultados bem semelhantes ao do Shapiro-Wilk 
  
  