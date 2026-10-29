library(tidyverse)

glimpse(FM2S_Lista_Exercícios_1)
View(FM2S_Lista_Exercícios_1)

FM2S_Lista_Exercícios_1 |>
  group_by(Segmento) |> 
  summarise(mean(`Tempo (h)`))

# Equivalente ao gráfico de séries temporais do Minitab
ggplot(FM2S_Lista_Exercícios_1,
       aes(x = `Entrega`,
           y = `Tempo (h)`,
           group = Segmento,
           colour = Segmento)) +
  geom_line(linetype = 2) +
  geom_point() +
  geom_hline(
    yintercept = 50,
    linetype = "dashed",
    colour = "black"
  ) +
  labs(title = "Tempo de entrega (h)",
       x = "Entregas") +
  theme(
    plot.title = element_text(
      hjust = 0.5, # 0 = esquerda, 0.5 = centro, 1 = direita
      size = 18,
      face = "bold"
    ),
    axis.title.x = element_text(colour = "red")
  )


# Plota um histograma preenchendo diferentes cores para
# cada valor da variável Segmento
# alpha define a opacidade, bins a quantidade de barras
ggplot(FM2S_Lista_Exercícios_1, aes(x = `Tempo (h)`,
                                    fill = Segmento)) +
  geom_histogram(alpha = 0.5,
                 position = "identity",
                 bins = 8)

# Plota um histograma para apenas um dos valores de Segmento
# usando filter()
FM2S_Lista_Exercícios_1 |> 
  filter(Segmento == "Perecível") |> 
  ggplot(aes(x = `Tempo (h)`)) +
  geom_histogram(bins = 8,
                 fill = "steelblue",
                 colour = "white") + 
  labs(y = "Frequência",
       title = "Tempos de entrega de perecíveis")

# Plota um histograma para ambos os segmentos, cada
# um em um painel com facet_wrap()
# Uso de fill aqui é opcional, mas colore de acordo com a variável
ggplot(FM2S_Lista_Exercícios_1,
       aes(x = `Tempo (h)`, fill = Segmento)) +
  geom_histogram(bins = 8) +
  facet_wrap(~ Segmento)

