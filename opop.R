# Load necessary libraries
library(dplyr)
library(ggplot2)
library(lubridate)

# Set seed for reproducibility
set.seed(123)

# Generate synthetic data
n <- 1000
user_id <- 1:n
subscription_date <- sample(seq(as.Date('2020/01/01'), as.Date('2023/07/01'), by="day"), n, replace=TRUE)
subscription_type <- sample(c('Basic', 'Standard', 'Premium'), n, replace=TRUE)
payment_method <- sample(c('Credit Card', 'PayPal', 'Bank Transfer'), n, replace=TRUE)
country <- sample(c('USA', 'Canada', 'UK', 'Germany', 'France', 'Australia'), n, replace=TRUE)
age <- sample(18:70, n, replace=TRUE)
gender <- sample(c('Male', 'Female', 'Other'), n, replace=TRUE)
subscription_duration <- sample(c(1, 3, 6, 12, 24), n, replace=TRUE) # Duration in months

# Create data frame
subscription_data <- data.frame(user_id, subscription_date, subscription_type, payment_method, country, age, gender, subscription_duration)

# Preview the data
head(subscription_data)


#1
ggplot(subscription_data, aes(x=subscription_type)) +
  geom_bar(fill='skyblue') +
  labs(title='Distribution of Subscription Types', x='Subscription Type', y='Count')

#2
payment_method_dist <- subscription_data %>%
  group_by(payment_method) %>%
  summarise(count=n())

ggplot(payment_method_dist, aes(x="", y=count, fill=payment_method)) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y") +
  labs(title='Payment Method Distribution') +
  theme_void()

#3
ggplot(subscription_data, aes(x=age)) +
  geom_histogram(binwidth=5, fill='lightgreen', color='black') +
  labs(title='Age Distribution of Users', x='Age', y='Count')


#4
ggplot(subscription_data, aes(x=subscription_type, y=subscription_duration, fill=subscription_type)) +
  geom_boxplot() +
  labs(title='Subscription Duration by Subscription Type', x='Subscription Type', y='Subscription Duration (months)')


#5
ggplot(subscription_data, aes(x=country)) +
  geom_bar(fill='orange') +
  labs(title='Subscription Counts by Country', x='Country', y='Count') +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


#6
ggplot(subscription_data, aes(x=subscription_date)) +
  geom_density(fill='purple', alpha=0.5) +
  labs(title='Density of Subscription Dates', x='Subscription Date', y='Density')


#7
ggplot(subscription_data, aes(x=age, y=subscription_duration)) +
  geom_point(color='blue', alpha=0.5) +
  labs(title='Age vs. Subscription Duration', x='Age', y='Subscription Duration (months)')


#8
ggplot(subscription_data, aes(x=age, y=subscription_duration)) +
  geom_point(color='blue', alpha=0.5) +
  labs(title='Age vs. Subscription Duration', x='Age', y='Subscription Duration (months)')



