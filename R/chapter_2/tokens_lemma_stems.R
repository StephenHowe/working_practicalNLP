# Chapter 2, Exercise 4
# Tokenization, Stemming, Lemmatization, Stopword, Post-Staging
# 30 December 2020
# R version: 4.0.2

# libraries ----
library(tidyverse)
library(tidytext)
library(tokenizers)
library(tm)
library(textstem)
library(qdap)

# data ----
corpus_original <- "Need to finalize the demo corpus which will be used for this notebook and it should be done soon !!. It should be done by the ending of this month. But will it? This notebook has been run 4 times !!"
corpus <- "Need to finalize the demo corpus which will be used for this notebook & should be done soon !!. It should be done by the ending of this month. But will it? This notebook has been run 4 times !!"

# there are many ways of performing these clean-up steps and Base R has some simple and effective tools.
# to use tidytext you need to have more than one document. Technically, our corpus (above) is just a single document

# lower case the corpus
corpus_lower <- tolower(corpus) # base R
corpus_lower

# remove digits from the corpus
corpus_nonumbers <- gsub("[[:digit:]]", "", corpus) # use regex to remove digits
corpus_nonumbers
# more info on Regex and R: https://stat.ethz.ch/R-manual/R-devel/library/base/html/regex.html

# remove punctuation from the corpus
corpus_nopunct <- gsub("[[:punct:]]", "", corpus)
corpus_nopunct

# remove trailing white spaces
corpus_trailing <- gsub("\\s*$", "", corpus_nopunct) # using corpus_nopunct as it has trailing space
corpus_trailing

# tokenize the corpus
corpus_tokenized <- tokenize_words(corpus) # from the tokenizer package
corpus_tokenized
# documentation: https://cran.r-project.org/web/packages/tokenizers/tokenizers.pdf

# tokenize the corpus after removing stop words
data(stop_words) # load stop words from tidytext package
corpus_df <- as.data.frame(corpus_tokenized) # convert to dataframe
colnames(corpus_df) <- "words"
filter(corpus_df, !words %in% stop_words$word)

# stemming of corpus
tokenize_word_stems(corpus) # uses tokenizer package

# lemmatization of corpus 
lemmatize_strings(corpus) # uses textstem package

# POS tagging
corpus_pos <- pos(corpus) # tags POS for each word
# this next line of code accesses the results and prints into pretty list of words and associated POS tag
as.vector(strsplit(corpus_pos[["POStagged"]][["POStagged"]], '\\s+'))
