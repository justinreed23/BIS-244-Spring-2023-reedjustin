# Hands-on Week - Working with **gapminder** Data
# Please be advised that this file should be run without any modification on any RStudio software. Therefore, it is essential to include all necessary libraries and prerequisit syntaxes. 
library(gapminder)
library(here)
library(tidyverse)
library(socviz)

gapminder <- gapminder

p <- ggplot(data = gapminder)


# a) What happens when you put the *geom_smooth()* function before *geom_point()* instead of after it in *Healy_CH3.R*? What does this tell you about how the plot is drawn? Think about how this might be useful when drawing plots. 
# =========================================== Part a =======================
p <- ggplot(data = gapminder,
            mapping = aes(x = gdpPercap,
                          y = lifeExp))

p + geom_smooth(method = "gam") + geom_point(alpha = 0.3) + 
  scale_x_log10(labels = scales::dollar) +
  labs(x = "GDP Per Capita", y = "Life Expectancy in Years",
       title = "Economic Growth and Life Expectancy",
       subtitle = "Data points are country-years",
       caption = "Source: Gapminder.")



# +++++++++++++++++++++++++++++++++++++++ End of Part a +++++++++++++

# b) Change the mappings in the *aes()* function so that you plot **life expectancy** against **population (pop)** rather than per capita GDP. Also, refine all functions/labels accordingly. What does that look like? What does it tell you about the unit of observation in the dataset?
# =========================================== Part b =======================
p <- ggplot(data = gapminder,
            mapping = aes(x = pop,
                          y = lifeExp,
                          color = continent))
p + geom_point() +
  geom_smooth(method = "loess") +
  scale_x_log10()

# +++++++++++++++++++++++++++++++++++++++ End of Part b +++++++++++++

# c) Try some alternative scale mappings. Besides *scale_x_log 10()*, you can try *scale_x_sqrt()* for population (pop)
# =========================================== Part c =======================
p <- ggplot(data = gapminder,
            mapping = aes(x = gdpPercap,
                          y = lifeExp,
                          color = continent))
p + geom_point() +
  geom_smooth(method = "loess") +
  scale_x_sqrt()


# +++++++++++++++++++++++++++++++++++++++ End of Part c +++++++++++++

# d) What happens if you map *color* to year instead of *continent*? 
# =========================================== Part d =======================
p <- ggplot(data = gapminder,
            mapping = aes(x = gdpPercap,
                          y = lifeExp,
                          color = year,
                          fill = continent))
p + geom_point() +
  geom_smooth(method = "loess") +
  scale_x_log10()



# +++++++++++++++++++++++++++++++++++++++ End of Part d +++++++++++++

# * e) Instead of mapping *color = year* in part d, what happens if you try *color = factor(year)*?
# =========================================== Part e =======================
p <- ggplot(data = gapminder,
            mapping = aes(x = gdpPercap,
                          y = lifeExp,
                          color = factor(year),
                          fill = continent))
p + geom_point() +
  geom_smooth(method = "loess") +
  scale_x_log10()



# +++++++++++++++++++++++++++++++++++++++ End of Part e +++++++++++++