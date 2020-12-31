# OCR with tesseract in R 

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
