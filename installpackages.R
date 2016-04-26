
if(!require(installr)) {
  install.packages("installr"); require(installr)} #load / install+load installr

# using the package:
updateR() # this will start the updating process of your R installation.  It will check for newer versions, and if one is available, will guide you through the decisions you'd need to make.# installing/loading the latest installr package:
install.packages("installr"); library(installr) #load / install+load installr

updateR() # updating R.