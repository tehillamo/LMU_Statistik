# vec1 = c(1,2,3)
# vec2 = c(4,5,6)
# vec1_rep = rep(c(10, 30, 50), 20)
# vec2_rep = rep(c(12, 40, 79), 20)
# 
# mean_vec1 = mean(vec1)
# mean_vec2 = mean(vec2)
# mean_vec1_rep = mean(vec1_rep)
# mean_vec2_rep = mean(vec2_rep)
# 
# sd_vec1 = sd(vec1)
# sd_vec2 = sd(vec2)
# sd_vec1_rep = sd(vec1_rep)
# sd_vec2_rep = sd(vec2_rep)
# 
# n = length(vec1_rep)
# 
# abw_vec1_rep = vec1_rep - mean_vec1_rep
# abw_vec2_rep = vec2_rep - mean_vec2_rep
# 
# sum_prd = sum(abw_vec1_rep * abw_vec2_rep)
# sd_prd = sd_vec1_rep * sd_vec2_rep
# 
# (sum_prd / sd_prd) * (1/n)
# 
# # sum_abw = 
# #   ((1 - mean_vec1) * (4 - mean_vec2)) + 
# #   ((2 - mean_vec1) * (5 - mean_vec2)) + 
# #   ((3 - mean_vec1) * (6 - mean_vec2))
# # 
# # sum((vec1 - mean_vec1) * (vec2 - mean_vec2))
# 
# 
# prd_sd = sd_vec1 * sd_vec2
# 
# 
# (sum_abw / prd_sd) * (1/length(vec1))
# 
# 
# cor(vec1_rep, vec2_rep)
# 
# 
# 
# daten = c(10, 20, 15, 30, 25)
# mean_daten = mean(daten)
# sd_daten = sd(daten)
# 
# z_daten = (daten - mean_daten) / sd_daten
