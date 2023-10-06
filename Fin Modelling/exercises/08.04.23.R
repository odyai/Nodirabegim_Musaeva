
library(datasets)


# Load the ggplot2 package
library(ggplot2)

# Explore the mtcars data frame with str()
str(mtcars)
# Execute the following command
ggplot(mtcars, aes(cyl, mpg)) +
  geom_point()


# Change the command below so that cyl is treated as factor
ggplot(mtcars, aes(factor(cyl), mpg)) +
  geom_point()

# Edit to add a color aesthetic mapped to disp
ggplot(mtcars, aes(wt, mpg, color = disp)) +
  geom_point()


# Explore the diamonds data frame with str()

str(diamonds)

# Add geom_point() with +
ggplot(diamonds, aes(carat, price)) +
  geom_point()


# Map the color aesthetic to clarity
ggplot(diamonds, aes(carat, price, color= clarity)) +
  geom_point() +
  geom_smooth()



# Draw a ggplot
plt_price_vs_carat <- ggplot(diamonds, aes(carat, price))+
  geom_point()
  
  
plt_price_vs_carat
# Use the diamonds dataset
# For the aesthetics, map x to carat and y to price
# Add a point layer to plt_price_vs_carat

plt_price_vs_carat +
  geom_point()


###mtcars dataset 
# Map x to mpg and y to fcyl
mtcars$fcyl<- factor(mtcars$cyl)
ggplot(mtcars, aes(mpg,fcyl)) +
  geom_point()

# Map fcyl to fill

ggplot(mtcars, aes(wt, mpg, fill = fcyl)) +
  geom_point(shape = 1, size = 4)


# Establish the base layer
plt_mpg_vs_wt <- ggplot(mtcars, aes(wt, mpg))

# Map fcyl to size
plt_mpg_vs_wt +
  geom_point(aes(size = fcyl))

# A hexadecimal color
my_blue <- "#4ABEFF"

ggplot(mtcars, aes(wt, mpg)) +
# Set the point color to my_blue
  geom_point(color = my_blue, alpha = 0.6)

ggplot(mtcars, aes(wt, mpg, color = fcyl)) +
# Add point layer with alpha 0.5
  geom_point(alpha= 0.5)
  

ggplot(mtcars, aes(wt, mpg, color = fcyl)) +
# Add text layer with label rownames(mtcars) and color red
  geom_text(label = rownames(mtcars), color = 'red',check_overlap = TRUE)

ggplot(mtcars, aes(wt, mpg, color = fcyl)) +
  # Add points layer with shape 24 and color yellow
  geom_point(shape = 24, color = "green")

# 3 aesthetics: y qsec vs. x mpg, colored by fcyl
ggplot(mtcars, aes(mpg, qsec, color = fcyl)) +
  geom_point()

# 4 aesthetics: add a mapping of shape to fam
mtcars$fam<- factor(mtcars$am)
ggplot(mtcars, aes(mpg, qsec, color = fcyl)) +
  geom_point(shape = mtcars$fam)

# 5 aesthetics: add a mapping of size to hp / wt
ggplot(mtcars, aes(mpg, qsec, color = fcyl)) +
  geom_point(size= mtcars$hp/mtcars$wt)

#Set the x-axis label to "Number of Cylinders", and the y-axis label to "Count" 
#using the x and y arguments of labs(), respectively.  

ggplot(mtcars, aes(cyl)) +
  geom_bar() +
  # Set the axis labels
  labs(x= 'Number of cylinders', y= 'Count')


#Implement a custom fill color scale using scale_fill_manual(). 
#Set the first argument to "Transmission", and values to palette
palette <- c(automatic = "#851EB8", manual = "#A89A1C")

ggplot(mtcars, aes(fcyl, fill=fam)) +
  geom_bar() +
  labs(x = "Number of Cylinders", y = "Count")+
  scale_fill_manual("Transmission", values = palette)
  # Set the fill color scale
scale_fill_manual("Transmission", values = palette)



palette <- c(automatic = "#377EB8", manual = "#E41A1C")

# Set the position to dodge
ggplot(mtcars, aes(fcyl, fill = fam)) +
  geom_bar(position = "dodge") +
  labs(x = "Number of Cylinders", y = "Count")
scale_fill_manual("Transmission", values = palette)

# Plot 0 vs. mpg
ggplot(mtcars, aes(0, mpg)) +
  # Add jitter 
  geom_point()

#Use ylim() to set the limits on the y-axis from -2 to 2.
ggplot(mtcars, aes(mpg, 0)) +
  geom_jitter() +
  ylim(-2,2)
  # Set the y-axis limits


##diamonds dataset

# Plot price vs. carat, colored by clarity
plt_price_vs_carat_by_clarity <- ggplot(diamonds, aes(carat, price, color = clarity))

# Add a point layer with tiny points Set the point transparency to 0.5, 
#Set shape = ".", the point size of 1 pixel
plt_price_vs_carat_by_clarity +
  geom_point(alpha=0.5, shape= '.')

#Update the point shape to remove the line outlines by setting shape to 16.
plt_price_vs_carat_by_clarity +
  geom_point(alpha=0.5, shape= 16)


# Examine the structure of Vocab
str(vocab)
#datasets::
# Plot y vocabulary vs. x education
ggplot(vocab, aes(vocabulary, education)) +
  # Add a point layer
  geom_point(position = jitter(alpha=0.2), shape=1)
# Change to a jitter layer
  
# Set jitter the transparency to 0.2
  
# Set the shape to 1
  
  
#Using mtcars, map mpg onto the x aesthetic.

# Plot mpg
ggplot(mtcars, aes(mpg)) +
  # Add a histogram layer
  geom_histogram(binwidth = 1)+
  labs(x = "Number of Cylinders", y = "Count")
scale_fill_manual("Density", values = palette)

  # Set the binwidth to 1
  
  # Map y to ..density..

  
  # Set the fill color to light_blue hint "#51A8C9"


#Using mtcars, map mpg onto the x aesthetic.

# Plot mpg

# Set the binwidth to 1

# Map y to ..density..

  
  
# Update the aesthetics so the fill color is by fam
ggplot(mtcars, aes(mpg, fill = fam )) +
  geom_histogram(binwidth = 1, position = 'identity', alpha=0.4)

# Change the position to dodge

# Change the position to fill

#Change the position to identity, with transparency 0.4


# Plot fcyl, filled by fam
ggplot(mtcars,aes(fcyl, fill=fam)) +
  # Add a bar layer
  geom_bar(position = 'dodge')
#Set the bar position argument to "fill".

#Change the bar position argument to "dodge".

  
ggplot(mtcars, aes(cyl, fill = fam)) +
#Change position to use the functional form, with width 0.2 position_dodge()
  geom_bar(position= position_dodge(width = 0.2),alpha= 0.6)

# Set the transparency to 0.6




##line plot 

# Plot the Rainbow Salmon time series fish data 
plot(fish.species$Rainbow)


# Remove legend entirely from a plot 
plot(fish.species$Rainbow)
legend(x='none')

plot(as.numeric(fish.species$Rainbow))
# Position the legend at the bottom of the plot
plot(fish.species$Rainbow)
legend(x = "bottom", legend = c("Rainbow"))

# Position the legend inside the plot at (0.6, 0.1)
plot(fish.species$Rainbow)
legend(x = 0.1, y = 0.1, legend = c("Rainbow"))


# 
# Remove the axis ticks, axis.ticks by making them a blank element.
# Remove the panel gridlines, panel.grid in the same way.
# 
# Make the axis tick labels' text, axis.text, less prominent by changing the color to "grey25".
# Increase the plot.title's, size to 16 and change its font face to "italic".
# 
theme( text,
       axis.title, axis.title.x,
       axis.title.x.top, axis.title.x.bottom,
       axis.title.y, axis.title.y.left, axis.title.y.right,
       title,
       legend.title, plot.title, plot.subtitle, plot.caption, plot.tag,
       axis.text, axis.text.x,
       axis.text.x.top, axis.text.x.bottom,
       axis.text.y, axis.text.y.left, axis.text.y.right,
       legend.text, strip.text,
       strip.text.x, strip.text.y)



# Give the axis tick length, axis.ticks.length, a unit of 2 "lines".

# Give the legend key size, legend.key.size, a unit of 3 centimeters ("cm").


# Set the legend.margin to 20 points ("pt") on the top, 30 pts on the right, 
# 40 pts on the bottom, and 50 pts on the left.


# Set the plot margin, plot.margin, to 10, 30, 50, and 70 millimeters ("mm").


# Add a black and white theme, theme_bw(), to the plot.


# theme_gray() is the default.
# theme_bw() is useful when you use transparency.
# theme_classic() is more traditional.
# theme_void() removes everything but the data.



# Add a classic theme, theme_classic(), to the plot.


# Add a void theme, theme_void(), to the plot.

# Add a fivethirtyeight.com theme, theme_fivethirtyeight(), to the plot.


# Add an Edward Tufte theme, theme_tufte(), to the plot.


# Add a Wall Street Journal theme, theme_wsj(), to the plot.



# create a filtered subset of the gapminder dataset 2007

install.packages('ggthemes')

library('ggthemes')

# Set the color scale
palette <- brewer.pal(5, "RdYlBu")[-(2:4)]

# Add a title and caption
ggplot(gm2007, aes(x = lifeExp, y = country, color = lifeExp)) +
  geom_point(size = 4) +
  geom_segment(aes(xend = 30, yend = country), size = 2) +
  geom_text(aes(label = round(lifeExp,1)), color = "white", size = 1.5) +
  scale_x_continuous("", expand = c(0,0), limits = c(30,90), position = "top") +
  scale_color_gradientn(colors = palette)+
  labs(caption = "Source: gapminder", title = "Highest and lowest life expectancies, 2007")
 



# Define the theme
plt_country_vs_lifeExp +
  theme_classic() +
  theme(axis.line.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text = element_text(color = "black"),
        axis.title = element_blank(),
        legend.position = "none")


# Add a curve
plt_country_vs_lifeExp +  
  step_1_themes +
  geom_vline(xintercept = global_mean, color = "grey40", linetype = 3) +
  step_3_annotation +
  annotate(
    "curve",
    x = x_start, y = y_start,
    xend = x_end, yend = y_end,
    arrow = arrow(length = unit(0.2, "cm"), type = "closed"),
    color = "grey40"
  )