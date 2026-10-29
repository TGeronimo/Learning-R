library(readxl)
FM2S_Lista_Exercícios_1 <- read_excel("~/Educação/Cursos/MBA em Gestão de Processos Gerenciais/Certificação Lean Seis Sigma Green Belt/Material de apoio/Listas de Exercícios/FM2S Lista_Exercícios_1.xlsx", 
                                      sheet = "01.Transporte_Mercadorias")

# O comando View() carrega a visualização dos dados passados como parâmetro.
View(FM2S_Lista_Exercícios_1)

# Calcular a média
mean(FM2S_Lista_Exercícios_1$`Tempo (h)`)

# Calcular a média, ignorando linhas em branco
mean(FM2S_Lista_Exercícios_1$`Tempo (h)`, na.rm = TRUE)

# Instalando o tidyverse, um pacote amplamente utilizado em empresas e escolas
install.packages("tidyverse")
library(tidyverse)

# mpg é um conjunto de dados disponibilizados pelo pacote 'datasets'
View(mpg)

# Para consultar os conjuntos de dados disponíveis para análise no
# pacote 'datasets' use o comando data()
data()

# Para saber mais sobre algum comando, use "?" antes do comando
?mpg
?mean

# O comando glimpse() permite ter uma visão geral sobre o conjunto
# de dados
glimpse(mpg)

# O comando filter() permite criar um subconjunto de dados de
# acordo com um critério.
?filter

# Filtrando os dados para carros que tenham um consumo de
# mais de 20 galões ("city mileage"). Use ?mpg para ver a 
# descrição de cada variável no conjunto desses dados
filter(mpg, cty >= 20)

# Armazenar o subconjunto em um novo dado
twenty_cty_cars <- filter(mpg, cty >= 20)
View(twenty_cty_cars)

# Criar um subconjunto de dados contendo os carros feitos pela
# Ford. "==" deve ser usado para comparações.
mpg_ford <- filter(mpg, manufacturer == "ford")
View(mpg_ford)

# Uso do comando mutate() para adicionar uma coluna no conjunto de dados
# Aqui a nova coluna vai conter a conversão do consumo de combustível
# na coluna cty de galões/milha para km/litro
# O conjunto de dados atualizado vai ficar em mpg_metric
mpg_metric <- mutate(mpg, cty_metric = 0.425144 * cty)
glimpse(mpg_metric)
View(mpg_metric)

# Muitas vezes vamos fazer várias alterações ou aplicar filtros nos
# datasets e podemos economizar utilizando o operador pipe, ou 
# encadeamento: "%>%". Use Ctrl + Shift + m para inserir.
# O pipe passa o resultado à esquerda como primeiro argumento da
# função(ões) à direita.
mpg_metric <- mpg |> 
  mutate(cty_metric = 0.425144 * cty)
glimpse(mpg_metric)

# Use o pipe várias vezes
mpg |> 
  mutate(cty_metric = 0.425144 * cty) |> 
  filter(cty_metric < 7)

# Grouped summaries
# Uso do group_by seguido do summarise 
# No exemplo, agrupado por categoria (class) e geração de 
# estatísticas (média e mediana) para cada categoria
mpg |>
  group_by(class) |> 
  summarise(mean(cty),
            median(cty))


# Visualização de dados com ggplot2 (parte do tidyverse)

# aes() significa estética, que define cty como variável no eixo x
# geom_histogram() gera um histograma
ggplot(mpg, aes(x = cty)) +
  geom_histogram() +
  labs(x = "City mileage")

# plota um segundo gráfico na mesma janela/painel
ggplot(mpg, aes(x = cty)) +
  geom_histogram() +
  geom_freqpoly() +
  labs(x = "City mileage")

# Plota um "scatter plot" com uma linha de regressão
ggplot(mpg, aes(x = cty,
                y = hwy)) +
  geom_point() + 
  geom_smooth(method = "lm") + 
  labs(x = "City mileage",
       y = "Highway mileage")

# Adicionar classificação por classe por cor
ggplot(mpg, aes(x = cty,
                y = hwy,
                color = class)) +
  geom_point() + 
  labs(x = "City mileage",
       y = "Highway mileage")

# alterando a paleta de cores do gráfico
ggplot(mpg, aes(x = cty,
                y = hwy,
                color = class)) +
  geom_point() + 
  labs(x = "City mileage",
       y = "Highway mileage") +
  scale_color_brewer(palette = "Dark2")