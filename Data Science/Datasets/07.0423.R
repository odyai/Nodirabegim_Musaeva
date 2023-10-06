
library(datasets)
str(mtcars)

# Load the ggplot2 package
library(ggplot2)

# Explore the mtcars data frame with str()
str()
# Execute the following command
ggplot(, aes(cyl, mpg)) +
  geom_point()


# Change the command below so that cyl is treated as factor
ggplot(____, aes(____, mpg)) +
  geom_point()

# Edit to add a color aesthetic mapped to disp
ggplot(_____, aes(wt, mpg, ____ = ______)) +
  geom_point()


# Explore the diamonds data frame with str()



# Add geom_point() with +
ggplot(_____, aes(carat, price)) 


# Map the color aesthetic to clarity
ggplot(_________)) +
  geom_point() +
  geom_smooth()



# Draw a ggplot
plt_price_vs_carat <- 
  # Use the diamonds dataset
 
  # For the aesthetics, map x to carat and y to price
 


# Add a point layer to plt_price_vs_carat

  
  


###mtcars dataset 
# Map x to mpg and y to fcyl
 +
  geom_point()

# Map fcyl to fill
ggplot(______, aes(wt, mpg, fill = ______)) +
  geom_point(shape = 1, size = 4)


# Establish the base layer
plt_mpg_vs_wt <- ggplot(____, aes(wt, mpg))

# Map fcyl to size
plt_mpg_vs_wt +
  geom_point(aes(____ = _____))

# A hexadecimal color
my_blue <- "#4ABEFF"

ggplot(_____, aes(wt, mpg)) +
# Set the point color to my_blue
  geom_point(_____ = ____, alpha = 0.6)

ggplot(____, aes(wt, mpg, color = fcyl)) +
# Add point layer with alpha 0.5
  
  

ggplot(____, aes(wt, mpg, color = fcyl)) +
# Add text layer with label rownames(mtcars) and color red
  geom_text(___ = ___(____), ___ = '____')

ggplot(_____, aes(wt, mpg, color = fcyl)) +
  # Add points layer with shape 24 and color yellow
  geom_point(_____ = ____, ____ = "____")

# 3 aesthetics: y qsec vs. x mpg, colored by fcyl
ggplot() +
  geom_point()

# 4 aesthetics: add a mapping of shape to fam
ggplot() +
  geom_point()

# 5 aesthetics: add a mapping of size to hp / wt
ggplot() +
  geom_point()

#Set the x-axis label to "Number of Cylinders", and the y-axis label to "Count" 
#using the x and y arguments of labs(), respectively.  

ggplot() +
  geom_bar() +
  # Set the axis labels
  labs( )


#Implement a custom fill color scale using scale_fill_manual(). 
#Set the first argument to "Transmission", and values to palette
palette <- c(automatic = "#377EB8", manual = "#E41A1C")

ggplot(mtcars, aes(fcyl, fill = fam)) +
  geom_bar() +
  labs(x = "Number of Cylinders", y = "Count") +
  # Set the fill color scale
  scale_fill_manual("Transmission", values = palette)



palette <- c(automatic = "#377EB8", manual = "#E41A1C")

# Set the position to dodge
ggplot(mtcars, aes(fcyl, fill = fam)) +
  geom_bar(position = "") +
  labs(x = "Number of Cylinders", y = "Count")
scale_fill_manual("Transmission", values = palette)

# Plot 0 vs. mpg
ggplot(, aes(, 0)) +
  # Add jitter 
  geom_point()

#Use ylim() to set the limits on the y-axis from -2 to 2.
ggplot(mtcars, aes(mpg, 0)) +
  geom_jitter() +
  # Set the y-axis limits


##diamonds dataset

# Plot price vs. carat, colored by clarity
plt_price_vs_carat_by_clarity <- ggplot(, aes(carat, price, color = clarity))

# Add a point layer with tiny points Set the point transparency to 0.5, 
#Set shape = ".", the point size of 1 pixel
plt_price_vs_carat_by_clarity + geom_point()

#Update the point shape to remove the line outlines by setting shape to 16.


# Examine the structure of Vocab
str(Vocab)

# Plot y vocabulary vs. x education
ggplot() +
  # Add a point layer

# Change to a jitter layer
  
# Set jitter the transparency to 0.2
  
# Set the shape to 1
  
  
#Using mtcars, map mpg onto the x aesthetic.

# Plot mpg
ggplot() +
  # Add a histogram layer
 
  # Set the binwidth to 1
  
  # Map y to ..density..
  
  # Set the fill color to light_blue hint "#51A8C9"
  
  
# Update the aesthetics so the fill color is by fam
ggplot(mtcars, aes(mpg, fill = )) +
  geom_histogram(binwidth = 1)

# Change the position to dodge

# Change the position to fill

#Change the position to identity, with transparency 0.4


# Plot fcyl, filled by fam
ggplot(mtcars,) +
  # Add a bar layer
  
#Set the bar position argument to "fill".

#Change the bar position argument to "dodge".

  
ggplot(mtcars, aes(cyl, fill = fam)) +
#Change position to use the functional form, with width 0.2 position_dodge()
  geom_bar()

# Set the transparency to 0.6
 