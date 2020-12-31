# OCR with tesseract in R
# Chapter 2, Exercise 3
# 30 December 2020
# R version: 4.0.2

# libraries ----
library(tesseract)

#set language for engine
eng <- tesseract("eng")

# sample OCR from package documentation
text <- tesseract::ocr("http://jeroen.github.io/images/testocr.png", engine = eng)
cat(text)

# reading screenshot from New York Times
image <- "data/nytimes_20201224.png"
text_nyt <- tesseract::ocr(image, engine = eng)
cat(text_nyt)

# package info: https://docs.ropensci.org/tesseract/articles/intro.html 
