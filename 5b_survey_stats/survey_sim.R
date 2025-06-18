set.seed(42)
# Crear datos sintéticos de encuesta de satisfacción laboral
n <- 500 # 500 respondents

# Generar estratos y características demográficas relacionadas
survey_data <- tibble(
    # Identificación
    employee_id = 1:n,

    # Estratificación: rural vs urbano (con probabilidades diferentes)
    stratum = sample(c("Urbano", "Rural"), n, replace = TRUE, prob = c(0.7, 0.3)),

    # Variables demográficas relacionadas con el estrato
    sex = case_when(
        stratum == "Urbano" ~ sample(c("Mujer", "Hombre"), n, replace = TRUE, prob = c(0.52, 0.48)),
        stratum == "Rural" ~ sample(c("Mujer", "Hombre"), n, replace = TRUE, prob = c(0.48, 0.52))
    ),
    age = case_when(
        stratum == "Urbano" ~ pmax(18, pmin(65, round(rnorm(n, 35, 12)))),
        stratum == "Rural" ~ pmax(18, pmin(65, round(rnorm(n, 42, 15))))
    ),

    # Departamento y experiencia
    department = sample(c("RRHH", "IT", "Ventas", "Marketing", "Operaciones"), n,
        replace = TRUE, prob = c(0.15, 0.25, 0.3, 0.15, 0.15)
    ),
    years_experience = pmax(0, round(rnorm(n, 5, 3))),

    # Crear variables latentes que generen correlaciones realistas
    # Nivel socioeconómico base (relacionado con estrato)
    socioeconomic_base = case_when(
        stratum == "Urbano" ~ rnorm(n, 0.3, 0.8),
        stratum == "Rural" ~ rnorm(n, -0.2, 0.7)
    ),

    # Nivel de satisfacción base (influenciado por múltiples factores)
    satisfaction_base = 0.4 * socioeconomic_base +
        ifelse(sex == "Mujer", -0.1, 0.1) +
        -0.01 * age +
        rnorm(n, 3.2, 0.6),

    # Nivel de estrés base (relacionado inversamente con satisfacción)
    stress_base = -0.6 * satisfaction_base + rnorm(n, 2.8, 0.8)
) %>%
    mutate(
        # Ítems de satisfacción laboral (1 = Totalmente en desacuerdo, 5 = Totalmente de acuerdo)
        # Algunos ítems están formulados en positivo, otros en negativo (para mostrar recodificación)
        js1_enjoy_work = pmax(1, pmin(5, round(satisfaction_base + rnorm(n, 0, 0.4)))),
        js2_motivated = pmax(1, pmin(5, round(satisfaction_base + rnorm(n, 0, 0.4)))),
        js3_work_stressful = pmax(1, pmin(5, round(stress_base + rnorm(n, 0, 0.4)))), # NEGATIVO - necesita recodificación
        js4_recommend_workplace = pmax(1, pmin(5, round(satisfaction_base + rnorm(n, 0, 0.4)))),

        # Ítems de balance trabajo-vida
        wl1_reasonable_hours = pmax(1, pmin(5, round(-0.8 * stress_base + 3 + rnorm(n, 0, 0.5)))),
        wl2_work_interferes_life = pmax(1, pmin(5, round(stress_base + rnorm(n, 0, 0.5)))), # NEGATIVO
        wl3_flexible_schedule = pmax(1, pmin(5, round(-0.6 * stress_base + 3 + rnorm(n, 0, 0.5)))),

        # Satisfacción general (1-10, influenciada por satisfacción base)
        overall_satisfaction = pmax(1, pmin(10, round(
            2 + 1.8 * satisfaction_base + rnorm(n, 0, 0.8)
        ))),

        # Intención de permanencia (REALÍSTICAMENTE relacionada con satisfacción)
        stay_probability = plogis(satisfaction_base - 2.7), # Función logística
        likely_to_stay = case_when(
            stay_probability > 0.8 ~ "Muy probable",
            stay_probability > 0.6 ~ "Probable",
            stay_probability > 0.4 ~ "Neutral",
            stay_probability > 0.2 ~ "Improbable",
            TRUE ~ "Muy improbable"
        ),

        # Satisfacción con ingresos (algunos valores faltantes NO al azar - los menos satisfechos no responden)
        income_satisfaction = case_when(
            satisfaction_base < 2.5 & runif(n) < 0.3 ~ NA_real_, # Los insatisfechos no responden más frecuentemente
            runif(n) < 0.05 ~ NA_real_, # Algunos faltantes aleatorios
            TRUE ~ pmax(1, pmin(5, round(socioeconomic_base + 3 + rnorm(n, 0, 0.8))))
        )
    ) %>%
    # Limpiar variables auxiliares
    select(-satisfaction_base, -stress_base, -socioeconomic_base, -stay_probability)

# Vista previa de los datos
head(survey_data) %>% kable()
write.csv(survey_data, "encuesta_empleados.csv", row.names = FALSE)
