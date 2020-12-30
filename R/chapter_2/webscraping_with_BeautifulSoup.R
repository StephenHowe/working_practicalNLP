# Chapter 2: 01_WebScraping_using_BeautifulSoup

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

# extract answer
answer <- html_node(rvest_html, xpath = "//div[@class='answer']")
answertext <- html_node(answer, xpath = "//div[@class='s-prose js-post-body' and @itemprop='text']")
answertext_value <- answertext %>% html_text()
answertext_value <- gsub("[\r\n]", "", answertext_value) # remove line breaks
answertext_value <- trimws(answertext_value) # trim white space


xpathSApply(div, "//div[@class-'question]", xmlValue)


# xml2 rout

div <- xml_find_all(rvest_html, "//div[@class='question']")
q <- xml_find_all(div, "//div[@class='s-prose js-post-body']")
#html_node(rvest_html, xpath = "//div[@class='question']")
q[[1]] %>% html_text()

div_a <- xml_find_all(rvest_html, "//div[@class='answer']")
a<- xml_find_all(div_a, "//div[@class='s-prose js-post-body']")
#html_node(rvest_html, xpath = "//div[@class='question']")
a[[2]] %>% html_text()


xml_attr(div, "class")
  



  urls <- links %>% html_attr("href")

question = soupified.find("div", {"class": "question"}) #find the nevessary tag and class which it belongs to
questiontext = question.find("div", {"class": "s-prose js-post-body"})
print("Question: \n", questiontext.get_text().strip())

answer = soupified.find("div", {"class": "answer"}) #find the nevessary tag and class which it belongs to
answertext = answer.find("div", {"class": "s-prose js-post-body"})
print("Best answer: \n", answertext.get_text().strip())