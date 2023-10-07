library(car)
library(ggplot2)

# Load data
data = read.csv("data_supportParsimony - data.csv")
data = subset(data, !grepl("\\?", boot1000))
data$gb = as.numeric(data$gb)
data$boot1000 = as.numeric(data$boot1000)
data$jack1000 = as.numeric(data$jack1000)

# Normality tests
shapiro.test(data$gb) # GB is not normally distributed
shapiro.test(data$boot1000) # bootstrap is not normally distributed
shapiro.test(data$jack1000) # jackknife is not normally distributed

# Plot
ggplot(data, aes(x = boot1000, y = gb)) +
  geom_point() +
  labs(x = "\nBootstrap", y = "Goodman-Bremer\n")

# Parametric tests
model = (lm(gb ~ boot1000, data)) # OLS

# Non-parametric tests
# Pearson correlation
# Spearman correlation
# Quantile regression