 # install.packages("tidyverse")
library(tidyverse)

# view mpg data frame in ggplot2
ggplot2::mpg

# make scatter plot of car's engine size (displ, in litres), and mpg
ggplot(data = mpg) + geom_point(mapping = aes(x=displ, y=hwy))

# view help on mpg dataframe
?mpg

# view col names of mpg
colnames(mpg)

# view row names of mpg
rownames(mpg)
