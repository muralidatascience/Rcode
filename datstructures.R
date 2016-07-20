WELCOME!
  
  Here you will find daily news and tutorials about R, contributed by over 573 bloggers. 
There are many ways to follow us - 
  By e-mail:
  
  Your e-mail here
Subscribe 
On Facebook: 
  If you are an R blogger yourself you are invited to add your own R content feed to this site (Non-English R bloggers should add themselves- here)
RSS JOBS FOR R-USERS

Data Scientist @ England
Advanced Analytics Consultant @ Maryland
Research Associate (Bioinformatician) @ London
Senior Process Engineer/Data Scientist @ Maryland
Summer 2016 intern for Distributed Data Structures in R

Search & Hit Enter
POPULAR SEARCHES

web scraping
heatmap
maps
twitteR
time series
boxplot
animation
shiny
hadoop
how to import image file to R
ggplot2
ggplot
trading
excel
latex
eclipse
finance
pca
rattle
googlevis
sql
rstudio
quantmod
knitr
market research
regression
coplot
tutorial
rcmdr
map
RECENT POSTS

gap frequencies [& e]
R Conferences: Europe 2016
rPref 1.0 - Computing Pareto Optima and Database	Preferences
It's Not Rocket Science, Just Pasta Carbonara
Call for Papers: eRum 2016 (European R users meeting)
RcppRedis 0.1.7
Le Monde puzzle [#960]
  A segmented model of CRAN package growth
  CRAN CHECK NOTE sub-directories of 1Mb or more: libs
  Complex Tables - Exercises
  A Data Scientist's Perspective on Microsoft R
  On Nested Models
  Last call for abstracts 29th April for EARL Conference London
  How to Install R on Linux Ubuntu 16.04 Xenial Xerus
  Password Input with getPass
  OTHER SITES
  
  Statistics of Israel
  SAS blogs
  Jobs for R-users
  Genetic algorithms: a simple R example
  August 1, 2012
  By Bart
  
  inShare
  7
  (This article was first published on FishyOperations » R, and kindly contributed to R-bloggers)
  Genetic algorithm is a search heuristic. GAs can generate a vast number of possible model solutions and use these to evolve towards an approximation of the best solution of the model. Hereby it mimics evolution in nature.
  
  GA generates a population, the individuals in this population (often called chromosomes) have a given state. Once the population is generated, the state of these individuals is evaluated and graded on their value. The best individuals are then taken and crossed-over - in order to hopefully generate 'better' offspring - to form the new population. In some cases the best individuals in the population are preserved in order to guarantee 'good individuals' in the new generation (this is called elitism).
  
  The GA site by Marek Obitko has a great tutorial for people with no previous knowledge on the subject.
  
  To explain the example I will use my version of the Knapsack problem.
  
  You are going to spend a month in the wilderness. You're taking a backpack with you, however, the maximum weight it can carry is 20 kilograms. You have a number of survival items available, each with its own number of "survival points". You're objective is to maximize the number of survival points.
  
  
  The following table shows the items you can choose from.
  
  
  
  
  
  
  
  
  
  
  ITEM	SURVIVALPOINTS	WEIGHT
  pocketknife	10.00	1.00
  beans	20.00	5.00
  potatoes	15.00	10.00
  unions	2.00	1.00
  sleeping bag	30.00	7.00
  rope	10.00	5.00
  compass	30.00	1.00
  In R I have used the package genalg to set-up the model. Later on, ggplot2 will be used to visualize the evolution of the model.
  
  Let's define the dataset and weight constraint;
  
