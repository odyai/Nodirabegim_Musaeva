# Load the given datasets
# View the structure of loan_data


# Load the gmodels package 
install.packages('gmodels')
library(gmodels)

library(ggplot2)

# Call CrossTable() on loan_status   
CrossTable(loan_data_ch1$loan_status)

# Call CrossTable() on grade and loan_status

CrossTable(loan_data_ch1$loan_status,loan_data_ch1$grade)
# Create histogram of loan_amnt: hist_1
hist_1<- hist(loan_data_ch1$loan_amnt)

# Print locations of the breaks in hist_1
hist_1$breaks


# Change number of breaks and add labels: hist_2
n_breaks <- sqrt(nrow(loan_data_ch1))
hist_2 <- hist(loan_data_ch1$loan_amnt, breaks = n_breaks, xlab = "Loan amount", 
               main = "HistLamnt")


# Plot the age variable, Give the y-axis the appropriate 
# label "Age" using ylab as a second argument.
hist(loan_data_ch1$age, breaks = n_breaks, xlab = "Loan amount", ylab= "Age")

# Save the outlier's index to index_highage
# hint (The oldest person in this data set is older than 122 years!)
index_highage<- which(loan_data_ch1$age > 122)


# Create data set new_data with outlier deleted
new_data <- loan_data_ch1[-index_highage, ]

# Make bivariate scatterplot of age and annual income
# Change the labels to "Age" and "Annual Income", respectively.
plot(loan_data_ch1$age, loan_data_ch1$annual_inc, xlab = "Age", ylab = "Annual Income")


# Look at summary of loan_data
summary(loan_data_ch1)

# Get indices of missing interest rates: na_index
na_index <- which(is.na(loan_data_ch1$int_rate))
  
# Remove observations with missing interest rates: loan_data_delrow_na
loan_data_no_NA <- loan_data_ch1[-c(na_index),]

# Make copy of loan_data
loan_data_delcol_na <- loan_data_ch1

# Delete interest rate column from loan_data_delcol_na
loan_data_delcol_na$int_rate <- NULL

# Compute the median of int_rate
median(loan_data_ch1$int_rate, na.rm = TRUE)


# Make copy of loan_data
loan_data_replace <- loan_data_ch1

# Replace missing interest rates with median
loan_data_replace$int_rate[na_index] <- median(loan_data_ch1$int_rate, na.rm = TRUE)

# Check if the NAs are gone hint summary
summary(is.na(loan_data_replace))
summary(loan_data_replace)

# Make the necessary replacements in the coarse classification example below 
loan_data$ir_cat <- rep(NA, length(loan_data$int_rate))

loan_data$ir_cat[which(loan_data$int_rate <= 8)] <- "0-8"
loan_data$ir_cat[which(loan_data$int_rate > 8 & loan_data$int_rate <= 11)] <- "8-11"
loan_data$ir_cat[which(loan_data$int_rate > 11 & loan_data$int_rate <= 13.5)] <- "11-13.5"
loan_data$ir_cat[which(loan_data$int_rate > 13.5)] <- "13.5+"
loan_data$ir_cat[which(is.na(loan_data$int_rate))] <- "Missing"

loan_data$ir_cat <- as.factor(loan_data$ir_cat)

# Look at your new variable using plot()
plot(loan_data$ir_cat)
________


# Set seed of 567 hint (set.seed())
set.seed(567)

# Store row numbers for training set: index_train
index_train <- sample(1:nrow(loan_data_ch1), 2 / 3 * nrow(loan_data_ch1))

# Create training set: training_set
training_set <- loan_data[index_train, ]

# Create test set: test_set
test_set<- loan_data[-index_train, ]
###chapter 2
# Build a glm model with variable ir_cat as a predictor
# Construct a logistic regression model called log_model_cat with the 
# categorical variable ir_cat as the only predictor. 
# Your call to glm() should contain three arguments:
log_model_cat<- glm(loan_status	~ ir_cat ,family= "binomial", data = training_set)

# Print the parameter estimates 
print(log_model_cat)

# Look at the different categories in ir_cat using table()

table(training_set$ir_cat)
# Build the logistic regression model
# Include the variables age, ir_cat, grade, loan_amnt and annual_inc. 
# Call this model log_model_mult

log_model_mult<-glm(loan_status	~ ir_cat + age + grade + loan_amnt + annual_inc ,family= "binomial", data = training_set)

# Obtain significance levels using summary()

summary(log_model_mult)

# Make PD-predictions for all the test set elements using the "log_model_small" 
 
log_model_small<- glm(loan_status ~ .,	family = "binomial", data = test_set)  
test_case <- as.data.frame(test_set[1,]) 
predict(log_model_small, newdata = test_case)
predict(log_model_small, newdata = test_case, type = "response")



# logistic regression model
predictions_all_small <- predict(log_model_small, newdata = test_case, type = "response")


# Look at the range of the object "predictions_all_small" using range()
range(predictions_all_small)

# Change the code below to construct a logistic regression model using 
# all available predictors in the data set
log_model_small <- glm(loan_status ~ ., family = "binomial", data = training_set)

# Make PD-predictions for all test set elements using the the full logistic regression model
log_model_full <- glm(loan_status ~ ., family = "binomial", data = training_set)


# Look at the predictions range
log_model_full <- glm(loan_status ~ .,
                      family = binomial(link = probit),  data = training_set)


# The code for the logistic regression model and the predictions is given below
log_model_full <- glm(loan_status ~ ., family = "binomial", data = training_set)
predictions_all_full <- predict(log_model_full, newdata = test_set, type = "response")

# Make a binary predictions-vector using a cut-off of 15% 
# hint you can follow this code to set cut-off point ifelse(predictions > 0.3, 1, 0)
install.packages("rpart")
library(rpart) 
pred_cutoff_15 <- ifelse(predictions_all_full > 0.15, 1, 0) 
# Construct a confusion matrix

conf_matrix_15 <- table(predictions_all_full, pred_cutoff_15)
 


# Fit the logit, probit and cloglog-link logistic regression models
log_model_logit <- glm(loan_status ~ age + emp_cat + ir_cat + loan_amnt,
                       family = binomial(link = logit), data = training_set)
log_model_probit <- glm(loan_status ~ age + emp_cat + ir_cat + loan_amnt,
                        family = binomial(link = probit), data = training_set)
  
log_model_cloglog <-  glm(loan_status ~ age + emp_cat + ir_cat + loan_amnt,
                          family = binomial(link = cloglog), data = training_set)
  
# Make predictions for all models using the test set
predictions_logit <- predict(log_model_logit, newdata = test_set, type = "response")
predictions_probit <- 
predictions_cloglog <- 
  
# Use a cut-off of 14% to make binary predictions-vectors
cutoff <- 0.14
class_pred_logit <- ifelse(predictions_logit > cutoff, 1, 0)
class_pred_probit <- 
class_pred_cloglog <- 
  
# Make a confusion matrix for the three models modfy true value with test set loan status
tab_class_logit <- table(true_val,class_pred_logit)
tab_class_probit <- 
tab_class_cloglog <- 
  
# Compute the classification accuracy for all three models
acc_logit <- sum(diag(tab_class_logit)) / nrow(test_set)
acc_probit <- 
acc_cloglog <- 