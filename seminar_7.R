vec_1 = c(1,2,3,4,5,6)
mean_vec_1 = mean(vec_1)
sd_vec_1 = sd(vec_1)

vec_2 = c(4,5,6,4,1,9)
mean_vec_2 = mean(vec_2)
sd_vec_2 = sd(vec_2)

cor(vec_1, vec_2)
cor.test(vec_1, vec_2)


vec_1[1] - mean(vec_1)



plot(vec_1, vec_2)

# vec1 = c(1, 2, 3, 10, 20, 30)
# vec2 = c(4, 5, 6, 70, 80, 90)
# # vec1_rep = rep(c(10, 30, 50), 20)
# # vec2_rep = rep(c(12, 40, 79), 20)
# 
# mean_vec1 = mean(vec1)
# mean_vec2 = mean(vec2)
# # mean_vec1_rep = mean(vec1_rep)
# # mean_vec2_rep = mean(vec2_rep)
# 
# sd_vec1 = sd(vec1)
# sd_vec2 = sd(vec2)
# # sd_vec1_rep = sd(vec1_rep)
# # sd_vec2_rep = sd(vec2_rep)
# 
# n = length(vec1)
# 
# # abw_vec1_rep = vec1_rep - mean_vec1_rep
# # abw_vec2_rep = vec2_rep - mean_vec2_rep
# 
# 
# abw_vec1 = vec1 - mean_vec1
# abw_vec2 = vec2 - mean_vec2
# 
# sum_prd = sum((abw_vec1/sd_vec1) * (abw_vec2/sd_vec2))
# 
# sum_prd * (1/n)
# 
# # sum_abw =
# #   ((1 - mean_vec1) * (4 - mean_vec2)) +
# #   ((2 - mean_vec1) * (5 - mean_vec2)) +
# #   ((3 - mean_vec1) * (6 - mean_vec2))
# #
# # sum((vec1 - mean_vec1) * (vec2 - mean_vec2))
# 
# 
# cor.test(vec1, vec2, method = "pearson")
# 
# 
# 
# daten = c(10, 20, 15, 30, 25)
# mean_daten = mean(daten)
# sd_daten = sd(daten)
# 
# z_daten = (daten - mean_daten) / sd_daten
