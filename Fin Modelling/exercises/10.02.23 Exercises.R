# Calculate PV of $100 one year from now


# Calculate PV of $100 two years from now

after_tax<- c(22.8,24.0, 30.6, 38.4, 43.2)
depr<- c(11, 12, 13, 14, 15)
capex<- c(11, 11, 12, 14, 15)
incr_wc<-c(16, 16, 14, 14, 14)


# Calculate FCFE
fcfe <- after_tax + depr - capex - incr_wc
fcfe


#The growth rate (g) of 3.4%, cost of equity (ke) of 10.5%, fcfe_2021 is 29.2
g<-0.034
ke<- 0.105
fcfe_2021<-fcfe[5]
# Calculate the terminal value as of 2021
tv_2021 <- fcfe_2021 * (1 + g) / (ke - g)
tv_2021


# In the prior exercises, we calculated the Free Cash Flow to Equity (FCFE) 
#projections from 2017 to 2021. 
#In this exercise, we will discount these FCFE projections to the present. 
#The object fcfe (FCFE for 2017 to 2021) and ke (discount rate of 10.5%) are stored in memory.

# Add discount periods
fcfe$periods <- seq(1, 5, 1)
fcfe

# Calculate Present Value Factor
fcfe$pv_factor <- 1 / (1 + ke)^fcfe$periods
fcfe

# Calculate Present Value of each Cash Flow
fcfe$pv <- fcfe$fcfe * fcfe$pv_factor
fcfe

# Total Present Value
pv_fcfe <- sum(fcfe$pv)
pv_fcfe


# Calculate Present Value
pv_tv <- tv_2021 / (1 + ke)^5
pv_tv


# Calculate Equity Value
eq_val <- pv_fcfe + pv_tv
eq_val

# Calculate Equity Value Per Share
eq_val_per_share <- eq_val / shout
eq_val_per_share


####chapter2 
hist_rev <- c(86.8,  89.0,  93.0, 128.6, 176.4, 171.4, 214.2, 236.0, 0.0, 0.0, 0.0, 0.0 ,0.0)

rev_proj <- c(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,  0.0, 193.2, 212.9, 225.0, 279.2, 295.9)



# Combine hist_rev and rev_proj

rev_split<- rbind(hist_rev,rev_proj)

# Rename the column headers
colnames(rev_split) <- seq(2009, 2021, 1)

# Create a bar plot of the data
barplot(rev_split,
        col = c("red", "blue"),
        main = "Historical revenues")
legend("topleft",
       legend = c("Historical", "Projected"),
       fill = c("red", "blue"))

#create the data frame rev_all which is stored in memory, 
#contains the historical revenues (first 8 years) and projected revenues (last 5 years) 
#under the rev_proj variable name.

rev_all<-data.frame(hist_rev,rev_proj)
rev_all
# Create a trend variable
rev_all$trend <- seq(1,13,1)

# Create shift variable
rev_all$shift <-c(rep(0,10),1,1,1)

# Run regression
reg <- lm(hist_rev~shift+trend, data = rev_all)


# Print regression summary
summary(reg)


###exercise 
after_tax_income<- c(22.8, 24.0, 30.6, 38.4, 43.2)

depn_amort <- c(11, 12, 12, 14,15)

incr_wc <- c(16, 16, 14, 14, 14)

capex <- c(11, 11, 12, 14, 15)


#Reinvestment Amount = CapEx - Depreciation/Amortization + Incr. in Working Capital
#Retention Ratio = Reinvestment Amount / After-Tax Income

# Calculate reinvestment amount
reinvestment <-(capex -depn_amort)/ depn_amort + incr_wc
reinvestment

# Calculate retention ratio
retention_ratio <- reinvestment/after_tax_income
retention_ratio

#Expected Growth Rate = Retention Ratio * Return on New Invested Capital (ke of 10.5%)
# Calculate expected growth rate
exp_growth_rate <- retention_ratio * 0.105
exp_growth_rate
install.packages('quantmod')
library('quantmod')

#Suppose you are considering investing in a preferred stock with a 
#stated value (stated_value) of $25, dividend rate (div_rate) of 5%, 
#and cost of preferred equity (kp) of 10%.

#Preferred Dividend = Stated Value * Dividend Rate
#Value of Preferred Stock = Preferred Dividend / Cost of Preferred Equity

# Calculate dividend of preferred stock
div <- ___
div

# Calculate value of preferred stock
pref_value <- ___
pref_value



#Assuming you own a preferred stock with a stated value (stated_value) of $25, 
#dividend rate (div_rate) beginning in Year 6 of 5%, 
#and cost of preferred equity (kp) of 10%, what is the value of the preferred stock today?

# Value of Preferred if dividends start five years from now
pref_value_yr5 <- (stated_value * div_rate) / kp
pref_value_yr5

# Value discounted to present
pref_value <- pref_value_yr5 / (1 + kp)^5
pref_value


#assume that the preferred stock pays a higher dividend rate of 10% from 
#Year 1 to 5 or $2.50 per year (high_div). The relevant discount rate (kp) for 
#Years 1 to 5 is 10%. The present value of the dividends from Year 6 onwards, 
#which we calculated in the prior exercise, is stored in memory as pref_value_low. 
#What is the value of this preferred stock?

# Preferred dividend in Years 1 to 5
high_div <- ___

# Create vector of Year 1-5 dividends
pref_cf <- rep(high_div, 5)

# Convert to data frame
pref_df <- data.frame(pref_cf)

# Add discount periods
pref_df$periods <- ___

# Calculate discount factors
pref_df$pv_factor <- ___

# Calculate PV of dividends
pref_df$pv_cf <- ___

# Calculate value during high stage
pref_value_high <- ___

# Calculate value of the preferred stock
___



# Preferred dividend in Years 1 to 5
high_div <- stated_value * div_rate_high

# Create vector of Year 1-5 dividends
pref_cf <- rep(high_div, 5)

# Convert to data frame
pref_df <- data.frame(pref_cf)

# Add discount periods
pref_df$periods <- seq(1, 5, 1)

# Calculate discount factors
pref_df$pv_factor <- 1 / (1 + kp)^pref_df$periods

# Calculate PV of dividends
pref_df$pv_cf <- pref_df$pref_cf * pref_df$pv_factor

# Calculate value during high stage
pref_value_high <- sum(pref_df$pv_cf)

# Calculate value of the preferred stock
pref_value_high + pref_value_low



###asset
library(quantmod)

start = as.Date("2020-01-01") 
end = as.Date("2021-01-22")
getSymbols(c("AAPL", "GOOGL", "MSFT","^GSPC"), src = "yahoo", from = start, to = end)
stocks = as.xts(data.frame(A = AAPL[, "AAPL.Adjusted"], 
                           B = GOOGL[, "GOOGL.Adjusted"], C = MSFT[, "MSFT.Adjusted"], 
                           E = GSPC[,"GSPC.Adjusted"]))
names(stocks) = c("Apple", "Google", "Microsoft","S&P 500")
index(stocks) = as.Date(index(stocks))

# Show first six observations of prices
head(stocks,3)
tail(stocks)

# Calculate MYL monthly return
rets <- deltat()

# Calculate SPY monthly return
rets$spy <- ___

# Change label of first variable
___

# Remove first observation - NA
rets <- ___


# Run regression
reg <- ___

# Save beta
beta <- summary(___)$coeff[2]
beta