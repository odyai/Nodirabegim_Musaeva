library(gmodels)
library(ggplot2)
library(rpart) 
library(PerformanceAnalytics)


#original data
ld <- read.csv("E:/Fin Modelling/ecercises/datasets/loan_data_2015.csv", header=TRUE)

# creating df to make further changes

t<- subset(ld ,select= c( loan_status, loan_amnt, int_rate, grade, emp_length, home_ownership,annual_inc, term))


unique(ld$loan_status)

#"Issued" , "Current","Fully Paid","In Grace Period","Late (16-30 days)" ,
# "Late (31-120 days)" "Charged Off","Default"



#Create dummy var
t$dummy_loan_status <- ifelse(t$loan_status == "Default", 1, 0)


# outliers 
hist(t$int_rate)


# Calculate Q3 + 1.5 * IQR
outlier_cutoff <- quantile(t$annual_inc, 0.75) + 1.5 * IQR(t$annual_inc)  # Identify outliers

index_outlier_ROT <- which(t$annual_inc  > outlier_cutoff)
#remove outliers
loan_data_ROT <- t[-index_outlier_ROT, ]

hist(loan_data_ROT$annual_inc)
hist(t$annual_inc)

# No NA values in data frame t were identified 
summary(is.na(t))

#overwriting t variable 
t<- loan_data_ROT



#classifyling int_rate ,

max(t$int_rate)# 28.99

min(t$int_rate)# 5.32
#the range is between 5 and ãpprox. 29 persent
t$ir_cat <- rep(NA, length(t$int_rate))

t$ir_cat[which(t$int_rate <= 10)] <- "0-10"
t$ir_cat[which(t$int_rate > 10 & t$int_rate <= 15)] <- "10-15"
t$ir_cat[which(t$int_rate > 15 & t$int_rate <= 20)] <- "15-20"
t$ir_cat[which(t$int_rate > 20 & t$int_rate <= 25)] <- "20-25"
t$ir_cat[which(t$int_rate > 25)] <- "25+"
t$ir_cat <- as.factor(t$ir_cat)
sum(is.na(t$ir_cat))
plot(t$ir_cat)



# Splitting data to TEST and TRAIN
set.seed(13)
train_prop <- 0.7
n_train <- floor(train_prop * nrow(t))
train_indices <- sample(seq_len(nrow(t)), size = n_train)
train_set <- t[train_indices, ]
test_set <- t[-train_indices, ]



#glm model with variable ir_cat as a predictor
log_model_cat<- glm(dummy_loan_status	~ ir_cat ,family= "binomial", data = train_set)
print(log_model_cat)

table(train_set$ir_cat)



# logistic regression model and the predictions 
log_model_full <- glm(dummy_loan_status ~ ., family = "binomial", data = train_set)
predictions_all_full <- predict(log_model_full, newdata = test_set, type = "response")


#significance levels
summary(log_model_full)

# binary predictions-vector using a cut-off of 15% fitted the best! with accuracy =1

pred_cutoff<- ifelse(predictions_all_full > 0.15, 1, 0)

# confusion matrix
cm<-table(test_set$dummy_loan_status,pred_cutoff)



# accuracy
accuracy <- sum(diag(cm)) / nrow(test_set)

sensitivity <- cm[2,2] / (cm[2,2] + cm[1,2])
#accuracy and sensitivity are equal to 1, the model has correctly classified 
#all positive and negative cases in the test set.


