Exerc1-3

library(tidyverse)

upa1 <- read_excel("~/Educação/Cursos/MBA em Gestão de Processos Gerenciais/Certificação Lean Seis Sigma Green Belt/Material de apoio/Listas de Exercícios/FM2S Lista_Exercícios_1.xlsx", sheet = "03.Atendimento_UPA", range = "A1:D2683")
upa2 <- read_excel("~/Educação/Cursos/MBA em Gestão de Processos Gerenciais/Certificação Lean Seis Sigma Green Belt/Material de apoio/Listas de Exercícios/FM2S Lista_Exercícios_1.xlsx", sheet = "03.Atendimento_UPA", range = "F1:I29")

glimpse(upa1)
glimpse(upa2)

# Como o desempenho dos atendimentos variou ao longo do tempo?
upa2 <- mutate(upa2, perc_nc = `Atendimentos Não Conformes` / `Total` * 100)

ggplot(upa2, 
       aes(x = Dia,
           y = perc_nc)) +
  labs(title = "Não qualidade do atendimento",
       y = "Atendimentos Não Conformes (%)") +
  geom_line() +
  geom_point()

# Há diferenças em relação aos atrasos de acordo 
# com cada classificação de risco?

resumo <- data.frame(
  urgente = sum(upa1$`Tempo de Atendimento` == "Não conforme" 
                & upa1$`Classificação de Risco` == "Urgente"),
  emergente = sum(upa1$`Tempo de Atendimento` == "Não conforme" 
                  & upa1$`Classificação de Risco` == "Emergente"),
  nurgente = sum(upa1$`Tempo de Atendimento` == "Não conforme" 
                 & upa1$`Classificação de Risco` == "Não Urgente"),
  total = nrow(upa1)
)

resumo <- resumo |> 
  mutate('urgente %' = urgente / total,
         'emergente %' = emergente / total,
         'não urgente %' = nurgente / total
         )