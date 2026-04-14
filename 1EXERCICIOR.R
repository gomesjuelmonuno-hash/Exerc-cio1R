######################################
# Lista de exercício 1
# Autor: Juelmo Gomes
# Data: 06/04/26
# Removendo os objetos ativos
rm(list=ls())
# --- Exercício 1 ---

1. Escreva como você pode usar o programa R para encontrar os resultados das expressões:
 #a) 
  3 + 4 * 8
# (b) (3 + 4) × 8
(3 + 4) * 8

# (c) 8 × 5 + 2 × 3
8 * 5 + 2 * 3
# (d) 8 × (5 + 2) × 3
8 * (5 + 2) * 3
# (e) 2^3 + 2*sqrt(3)
2^3 + 2 * sqrt(3)
# (f) 2 × 8^3 + 5^6 + 8
2 * 8^3 + 5^6 + 8
# (g) 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8
1 + 2 + 3 + 4 + 5 + 6 + 7 + 8
# (h) 1 × 2 × 3 × 4 × 5 × 6 × 7 × 8
1 * 2 * 3 * 4 * 5 * 6 * 7 * 8
# (i) (1 + 18)^3
(1 + 18)^3
# (j) cos(pi)
cos(pi)
# (k) sen^2(pi) + cos^2(pi)
sin(pi)^2 + cos(pi)^2
# (l) ln(9)
log(9)
# (m) |8 − 19|
abs(8 - 19)
# (n) 27! + sqrt(22)
factorial(27) + sqrt(22)

##########################################
# --- Exercício 2 ---
##########################################
# (a) Escrevendo a matriz x
x <- matrix(c(5,0,6,9,6,4,3,5,2), nrow = 3, byrow = TRUE)
# Mostrando a matriz
x

# (b) Dimensão da matriz (linhas e colunas)
dim(x)

# (c) Elementos da diagonal principal
diag(x)
##########################################
# --- Exercício 3 ---
##########################################

# Criando os objetos
a <- 1:10
b <- letters[1:6]
c <- matrix(letters[1:6], ncol = 2)
d <- c("verde","azul","rosa")
e <- c(4i,8i,9i)
f <- c(5>2,7<2,8>3)
g <- date()
# mode e class de cada objeto

# a
mode(a)
class(a)

# b
mode(b)
class(b)
# c
mode(c)
class(c)

# d
mode(d)
class(d)

# e
mode(e)
class(e)
# f
mode(f)
class(f)

# g
mode(g)
class(g)

