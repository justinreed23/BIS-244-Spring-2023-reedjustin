# api: Student performance in California schools

# The Academic Performance Index is computed for all California  schools based on standardised testing of students. The data sets  contain information for all schools with at least 100 students and  for various probability samples of the data. Please see the following website for the columns definitions:
  # https://www.rdocumentation.org/packages/survey/versions/4.1-1/topics/api 

## Details

# "apipop" is the entire population, 
# "apisrs" is a simple random sample, 
# "apiclus1" is a cluster sample of school districts, 
# "apistrat" is a sample stratified by stype, and 
# "apiclus2" is a two-stage cluster sample of schools within districts. 
# The sampling weights in apiclus1 are incorrect (the weight should be 757/15) but are as obtained from UCLA.

# Assignment 4
# To use the "apipop" dataframe please run the following syntaxes. The dataframe for all parts is "apipop".
# ========================================================================
library(tidyverse)
library(survey)
data(api)

View(apipop)
# ========================================================================

## Part a) 
# create a bar plot to show the number of schools in each school type (Elementary/Middle/High School) in California. 
# ========================================================================

SchoolTypes <- ggplot(data = apipop, mapping = aes(x=stype))
SchoolTypes + geom_bar()

# ========================================================================

## Part b) 
# create a bar plot to show the percentage of schools in each school type (Elementary/Middle/High School) in California. 
# ========================================================================

SchoolPercent <- ggplot(data = apipop, mapping = aes(x=stype))
SchoolPercent + geom_bar(mapping = aes(y=..prop.., group =1))


# ========================================================================

## Part c) 
# create a bar plot to show the number of schools that are "Eligible for awards program" or not in each school type (Elementary/Middle/High School).  
# ========================================================================

Award <- ggplot(data = filter(apipop, awards == "Yes"), mapping = aes(x=stype))
Award + geom_bar()

# ========================================================================

## Part d) 
# create a bar plot to show the percentage of schools that are "Eligible for awards program" or not in each school type (Elementary/Middle/High School).  

# ========================================================================

AwardPercent <- ggplot(data = filter(apipop, awards == "Yes"), mapping = aes(x=stype))
AwardPercent + geom_bar(mapping = aes(y=..prop.., group =1))


# ========================================================================

## Part e) 
# use facet to create two histogram to show the distributions of the "number of students enrolled" in all school whether are "Eligible for awards program" or not (bins=30).
# ========================================================================

StudentAwards <- ggplot(data=apipop, mapping = aes(x=enroll))
StudentAwards + geom_histogram(bins=30) + facet_wrap(~awards)

# ========================================================================
