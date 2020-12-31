# Chapter 2, Exercise 1
# Webscraping with rvest
# 31 December 2020
# R version: 4.0.2

# We are using rvest instead of the Python package BeautifulSoup

# libraries ----
library(rvest)
library(XML)

# get HTML content
myurl <- "https://stackoverflow.com/questions/415511/how-to-get-the-current-time-in-python"
rvest_html <- read_html(myurl)

# extract title
rvest_html %>% html_nodes("title")

# extract question
question <- html_node(rvest_html, xpath = "//div[@class='question']")
questiontext <- html_node(question, xpath = "//div[@class='s-prose js-post-body']")
questiontext_value <- questiontext %>% html_text()
questiontext_value <- gsub("[\r\n]", "", questiontext_value) # remove line breaks
questiontext_value <- trimws(questiontext_value) # trim white space
questiontext_value

# extract answer
# if you do the same thing for the answer, it actually doesn't get you
# to the right part of the text
answer <- html_node(rvest_html, xpath = "//div[@class='answer']")
answertext <- html_node(answer, xpath = "//div[@class='s-prose js-post-body' and @itemprop='text']")
answertext_value <- answertext %>% html_text()
answertext_value <- gsub("[\r\n]", "", answertext_value) # remove line breaks
answertext_value <- trimws(answertext_value) # trim white space
answertext_value

# you can get to the answer a different way (and notice that the question is the first item in the list)
div_a <- xml_find_all(rvest_html, "//div[@class='answer']")
a<- xml_find_all(div_a, "//div[@class='s-prose js-post-body']")
#html_node(rvest_html, xpath = "//div[@class='question']")
a[[2]] %>% html_text()
