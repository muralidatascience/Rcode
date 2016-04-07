install.packages("ROAuth",dependencies = TRUE)
library(streamR)
library(ROAuth)
library(RCurl)
library(bitops)
library(rjson)
library(tm)

requestURL <- "https://api.twitter.com/oauth/request_token"
accessURL <- "https://api.twitter.com/oauth/access_token"
authURL <- "https://api.twitter.com/oauth/authorize"
consumerKey <- "PqNhaShuF97DQliRpp7xf6xeT"
consumerSecret <- "DQ69l0yR6cbcZ4B41xFfZL1LdhkdWdGdh8GOSh9cdnBw0zSTeb"
my_oauth <- OAuthFactory$new(consumerKey = consumerKey, consumerSecret = consumerSecret, 
                             requestURL = requestURL, accessURL = accessURL, authURL = authURL)
my_oauth$handshake(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"))
save(my_oauth, file = "myoauth.Rdata")

load("myoauth.Rdata")
filterStream("tweets_pepsi.json", track = c("Pepsi"), 
             oauth = my_oauth,language = 'en' , tweets = 500)


makeCorpus <- function(text){ #Function for making corpus and cleaning the tweets fetched
  #twitterdf <- do.call("rbind", lapply(text, as.data.frame)) #store the fetched tweets as a data frame
  twitterdf <- sapply(text,function(row) iconv(row, "latin1", "ASCII", sub=""))#Removing emoticons from tweets
  twitterCorpus <- Corpus(VectorSource(twitterdf)) #Creating Corpus
  toSpace <- content_transformer(function(x, pattern) gsub(pattern, " ", x)) #function to replace a pattern to white space using regex
  twitterCorpus <- tm_map(twitterCorpus, toSpace, "(RT|via)((?:\\b\\W*@\\w+)+)") #match rt or via
  twitterCorpus <- tm_map(twitterCorpus, toSpace, "@\\w+") #match @
  twitterCorpus <- tm_map(twitterCorpus, toSpace, "[ \t]{2,}") #match tabs
  twitterCorpus <- tm_map(twitterCorpus, toSpace, "[ |\n]{1,}") #match new lines
  twitterCorpus <- tm_map(twitterCorpus, toSpace, "^ ") #match white space at begenning
  twitterCorpus <- tm_map(twitterCorpus, toSpace, " $") #match white space at the end
  twitterCorpus <- tm_map(twitterCorpus, PlainTextDocument)
  twitterCorpus <- tm_map(twitterCorpus, removeNumbers)
  twitterCorpus <- tm_map(twitterCorpus, removePunctuation)
  twitterCorpus <- tm_map(twitterCorpus, toSpace, "http[[:alnum:]]*") #remove url from tweets
  twitterCorpus <- tm_map(twitterCorpus,removeWords,stopwords("en"))
  twitterCorpus <- tm_map(twitterCorpus, content_transformer(tolower))
  return(twitterCorpus)
}
makeCorpus(tweets_pepsi$V4)
