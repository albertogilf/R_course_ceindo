
set.seed(1234124)
# hcrec -------------------------------------------------------------------

hcrec = rbind(
  data.frame("height_inc_cm" = rnorm(10000, 6, sd=1), "group"="control"),
  data.frame("height_inc_cm" = rnorm(10000, 6.1, sd=1), "group"="treatment")
)
write.csv(hcrec, "data/hc.csv", row.names=FALSE)


# anxiety -----------------------------------------------------------------

data("anxiety", package = "datarium")

anxiety <- anxiety %>%
  dplyr::select(id, group, t1, t3) %>%
  rename(pretest = t1, posttest = t3)
anxiety[14, "posttest"] <- 19

write_csv(anxiety, "data/anxiety.csv")


# drugs -------------------------------------------------------------------

drugs_df <- data.frame(drug=rep(c("Placebo", "A", "B"), 10), sex=rep(c("Male", "Female"),15))
drugs_df$response_time = NA
drugs_df[drugs_df$drug == "Placebo", "response_time"] = 5 + rnorm(10, sd=1)
drugs_df[drugs_df$drug == "A", "response_time"] = 15 + rnorm(10, sd=1)
drugs_df[drugs_df$drug == "B", "response_time"] = 25 + rnorm(10, sd=1)
drugs_df[drugs_df$sex == "Female", "response_time"] =  drugs_df[drugs_df$sex == "Female", "response_time"] + rnorm(15, 4, sd=0.1)
write.csv(drugs_df, "data/drugs_1.csv", row.names = FALSE, )

drugs_df <- data.frame(drug=rep(c("Placebo", "A", "B"), 10), sex=rep(c("Male", "Female"),15))
drugs_df$response_time = NA
drugs_df[drugs_df$drug == "Placebo", "response_time"] = 10 + rnorm(10, sd=1)
drugs_df[drugs_df$drug == "A", "response_time"] = 20 + rnorm(10, sd=1)
drugs_df[drugs_df$drug == "B", "response_time"] = 30 + rnorm(10, sd=1)
drugs_df[drugs_df$sex == "Female", "response_time"] =  drugs_df[drugs_df$sex == "Female", "response_time"] + rnorm(15, 4, sd=0.1)
drugs_df[drugs_df$sex == "Male" & drugs_df$drug == "A", "response_time"] = (
  drugs_df[drugs_df$sex == "Male" & drugs_df$drug == "A", "response_time"] + rnorm(5, 20, sd=1)
)
write.csv(drugs_df, "data/drugs_2.csv", row.names = FALSE, )
