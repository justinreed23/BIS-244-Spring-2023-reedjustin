library(tidyverse)

UnitedStates <- read.csv("us-states.csv")

PennState <- filter(UnitedStates, state == "Pennsylvania")

i = 1

incr_cases <- integer()

while(i<nrow(PennState)){
  incr_cases[i] <- PennState[i,4] - PennState[i-1,4]
  i=i+1
}

i=1
incr_deaths <- integer()

while(i<nrow(PennState)){
  incr_deaths[i] <- PennState[i,5] - PennState[i-1,5]
  i=i+1
}
incr_cases[1] = 0
incr_deaths[1] = 0

sd(incr_cases)


