# Dataset de pesquisa de satisfação de pacientes em uma UPA
library(tidyverse)
glimpse(clinica)

# Plota o histograma do índice de satisfação no geral
ggplot(clinica,
       aes(x = Satisfação)) + 
  geom_histogram(bins = 15,
                 colour = "white",
                 fill = "darkblue") +
  labs(y = "Frequência",
       title = "Índice de Satisfação",
       subtitle = "Por paciente") +
  theme(plot.title = element_text(
    hjust = 0.5,
    size = 18
  ),
  plot.subtitle = element_text(
    hjust = 0.5,
    size = 12
  ))

# Plota o histograma do índice de satisfação por especialidade
ggplot(clinica,
       aes(fill = Especialidade,
           x = Satisfação)) +
  geom_histogram(bins = 15,
                 alpha = 0.5,
                 position = "identity",
                 colour = "white") +
  labs(y = "Frequência",
       title = "Índice de Satisfação",
       subtitle = "Por Especialidade médica") +
  theme(plot.title = element_text(
    hjust = 0.5,
    size = 18
  ),
  plot.subtitle = element_text(
    hjust = 0.5
  ))

# Gráfico de tendência para todo o conjunto de dados
ggplot(clinica,
       aes(x = Paciente,
           y = Satisfação)) +
  labs(title = "Índice de Satisfação por Paciente",
       y = "Índice de Satisfação") +
  geom_line(colour = "steelblue") +
  geom_point(colour = "black") +
  theme(plot.title = element_text(
    hjust = 0.5,
    size = 18
  ))

# Gráfico de tendência considerando cada especialidade médica
ggplot(clinica,
       aes(x = Paciente,
           y = Satisfação,
           colour = Especialidade)) +
  labs(title = "Índice de Satisfação por Paciente",
       y = "Índice de Satisfação") +
  geom_line() +
  geom_point(colour = "black") +
  theme(plot.title = element_text(
    hjust = 0.5,
    size = 18
  )) +
  facet_wrap(~ Especialidade)

# Gráfico de barras para avaliar a distribuição da pesquisa por especialidade
ggplot(clinica,
       aes(x = Especialidade)) +
  geom_bar()

# Cria um novo conjunto de dados para armazenar a satisfação média
# por dia de pesquisa
satisfacao_diaria <- clinica |> 
  group_by(Dia) |> 
  summarise(Media_Satisfacao = mean(Satisfação))

# Plota o gráfico de tendência da satisfação média por dia
ggplot(satisfacao_diaria,
       aes(x = Dia,
           y = Media_Satisfacao)) +
  labs(title = "Satisfação Média por Dia",
       x = "Dia",
       y = "Média de Índice de Satisfação") +
  geom_line() +
  geom_point() +
  theme(plot.title = element_text(
    hjust = 0.5,
    size = 18
  ))

# novo dataset para cada especialidade médica
espec_A <- clinica |> 
  filter(Especialidade == "A")
espec_D <- clinica |> 
  filter(Especialidade == "D")

# Plota gráfico de tendência para a média de satisfação
# para a especialidade Alergologia
espec_A |>  
  group_by(Dia) |> 
  summarise(mean(Satisfação)) |> 
  ggplot(aes(x = Dia,
               y = `mean(Satisfação)`)) +
      labs(title = "Satisfação Média por Dia",
           subtitle = "Especialidade: Alergologia",
           x = "Dia",
           y = "Média de Índice de Satisfação") +
      geom_line() +
      geom_point() +
      theme(plot.title = element_text(
        hjust = 0.5,
        size = 18
      ),
      plot.subtitle = element_text(
        hjust = 0.5
      ))

# Plota gráfico de tendência para a média de satisfação
# para a especialidade Dermatologia
espec_D |>  
  group_by(Dia) |> 
  summarise(mean(Satisfação)) |> 
  ggplot(aes(x = Dia,
             y = `mean(Satisfação)`)) +
  labs(title = "Satisfação Média por Dia",
       subtitle = "Especialidade: Dermatologia",
       x = "Dia",
       y = "Média de Índice de Satisfação") +
  geom_line() +
  geom_point() +
  theme(plot.title = element_text(
    hjust = 0.5,
    size = 18
  ),
  plot.subtitle = element_text(
    hjust = 0.5
  ))

