z <- read.csv("C:/Users/srinjan sanyal/Documents/population india.csv", header=TRUE)
z
y_population <- ts(z$Population.Density, start = min(z$Year), frequency = 1)
y_life_expectancy <- ts(z$Life.Expectancy, start = min(z$Year), frequency = 1)

# Population Density Plot using ggplot2
p1<-ggplot(z, aes(x = Year, y = Population.Density)) +
  geom_line(color = "red") +
  labs(title = "Population Density Over Time", x = "Year", y = "Population Density") +
  theme_minimal()

# Life Expectancy Plot using ggplot2
p2<-ggplot(z, aes(x = Year, y = Life.Expectancy)) +
  geom_line(color = "blue") +
  labs(title = "Life Expectancy Over Time", x = "Year", y = "Life Expectancy") +
  theme_minimal()


# Install and load gridExtra
install.packages("gridExtra")
library(gridExtra)

# Combine plots side by side
combined_plot <- grid.arrange(p1, p2, ncol = 2)

# Save the combined figure
ggsave(
  filename = "C:/Users/srinjan sanyal/Documents/trend_plot.png",
  plot = combined_plot,
  width = 12,
  height = 5,
  dpi = 300
)

# ADF Test for Population Density
adf_test1<-adf.test(y_population)
print(adf_test1)
# ADF Test for Life Expectancy
adf_test2<-adf.test(y_life_expectancy)
print(adf_test2)

y_population_diff <- diff(y_population)
y_life_expectancy_diff <- diff(y_life_expectancy)

adf_result_pop_diff <- adf.test(y_population_diff)
adf_result_life_diff <- adf.test(y_life_expectancy_diff)


print(adf_result_pop_diff)
print(adf_result_life_diff)

# Apply log transformation
log_population <- log(y_population)
log_life_expectancy <- log(y_life_expectancy)
adf.test(log_population)
adf.test(log_life_expectancy)
log_population_diff <- diff(log_population,differences=3)
log_life_expectancy_diff <- diff(log_life_expectancy,differences=2)

plot.ts(log_population_diff)
plot.ts(log_life_expectancy_diff)

adf.test(log_population_diff)
adf.test(log_life_expectancy_diff)

acf(log_population_diff,plot=FALSE)
pacf(log_population_diff,plot=FALSE)
acf(log_population_diff)
pacf(log_population_diff)
acf(log_life_expectancy_diff,plot=FALSE)
pacf(log_life_expectancy_diff,plot=FALSE)
acf(log_life_expectancy_diff)
pacf(log_life_expectancy_diff)
#auto.arima
model_popdensity <- auto.arima(y_population,seasonal = FALSE)
model_popdensity

model_lifeexpectancy <- auto.arima(y_life_expectancy ,seasonal=FALSE)
model_lifeexpectancy 

forecast_pop <- forecast(model_popdensity, h=20)
forecast_life <- forecast(model_lifeexpectancy, h=20)


# Save both ARIMA forecast plots in one image
png("C:/Users/srinjan sanyal/Documents/arima_forecast.png",
    width = 2400, height = 1000, res = 300)

par(mfrow = c(1, 2))

plot(forecast_pop, main = "ARIMA: Population Density")
plot(forecast_life, main = "ARIMA: Life Expectancy")

dev.off()

# Plot forecasts
plot(forecast_pop, main="ARIMA Forecast: Population Density", xlab="Year", 
     ylab="Population Density", col="darkred")
plot(forecast_life, main="ARIMA Forecast: Life Expectancy", xlab="Year", 
     ylab="Life Expectancy", col="darkblue")

MSE<-mean((y_population-fitted(forecast_pop))^2)
MSE
MSE<-mean((y_life_expectancy-fitted(forecast_life))^2)
MSE
# Holt's Method for Population Density
holt_pop <- holt(y_population, h=20,gamma=FALSE)
summary(holt_pop)

# Plot the Holt forecast
plot(holt_pop, main="Holt Forecast: Population Density", xlab="Year", ylab="Population Density", col="purple")

# Holt's Method for Life Expectancy
holt_life <- holt(y_life_expectancy, h=20,gamma=FALSE)
summary(holt_life)

# Plot the Holt forecast
plot(holt_life, main="Holt Forecast: Life Expectancy", xlab="Year", ylab="Life Expectancy", col="darkgreen")


# Save both Holt forecast plots in one image
png("C:/Users/srinjan sanyal/Documents/holt_forecast.png",
    width = 2400, height = 1000, res = 300)

par(mfrow = c(1, 2))

plot(holt_pop, main = "Holt: Population Density")
plot(holt_life, main = "Holt: Life Expectancy")

dev.off()


MSE <- mean((y_population - fitted(holt_pop))^2)
MSE
MSE<-mean((y_life_expectancy - fitted(holt_life))^2)
MSE
