
library('tidyverse')
data("teengamb", package="faraway") 
teengamb = teengamb %>% mutate(sex = ifelse( sex==1, 'Female', 'Male') )

ggplot(teengamb, aes(x=income, y=gamble, color=sex)) + geom_point() +
  geom_smooth(method='lm')



m1 <- lm( gamble ~ sex * income, data=teengamb )# 3) Ajusta el modelo adecuado
teen_gambling_model = lm( gamble ~ sex * income, data=teengamb )

preds = predict(m1, data=teengamb) + rnorm(n = nrow(teengamb), sd=sigma(m1))

teengamb$gamble = preds
write_csv(teengamb, "Entrega/teengamb.csv")

teengamb = read_csv("Entrega/teengamb.csv")

m1 <- lm( gamble ~ sex * income, data=teengamb )# 3) Ajusta el modelo adecuado
teen_gambling_model = lm( gamble ~ sex * income, data=teengamb )

# 4) Crea un gráfico con las predicciones de tu modelo y compáralo con los
# datos real
teengamb <- teengamb %>%
  cbind( predict(teen_gambling_model, interval='conf') )
print(
  ggplot(teengamb, aes(x=income, col=sex, fill=sex)) +
    geom_ribbon(aes(ymin=lwr, ymax=upr),
                alpha=.3) +
    geom_point(aes(y=gamble)) +
    geom_line(aes(y=fit))
)

# 5) Interpreta la relación entre las variables de interés y la variable "cuánto
# juega una persona"
plot(teen_gambling_model, ask=FALSE)
library("performance")
plot(check_normality(teen_gambling_model), "qq")
