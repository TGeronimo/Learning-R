library(readxl)
FM2S_Lista_Exercícios_1 <- read_excel("~/Educação/Cursos/MBA em Gestão de Processos Gerenciais/Certificação Lean Seis Sigma Green Belt/Material de apoio/Listas de Exercícios/FM2S Lista_Exercícios_1.xlsx", 
                                      sheet = "01.Transporte_Mercadorias")
View(FM2S_Lista_Exercícios_1)

# Calcular a média
mean(FM2S_Lista_Exercícios_1$`Tempo (h)`)

# Calcular a média, ignorando linhas em branco
mean(FM2S_Lista_Exercícios_1$`Tempo (h)`, na.rm = TRUE)
