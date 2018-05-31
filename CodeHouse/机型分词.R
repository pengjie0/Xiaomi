
require(tidyverse)
require(jiebaR)
require(wordcloud2)

setwd("C:/Users/pengjie/Desktop/机型数据")

## MI 6
mydata_MI6 <- read.csv("MI 6.csv", stringsAsFactors =FALSE)

分词器 <- worker(user = "user1.txt", stop_word = "stop1.txt")

mywords_MI6 <- freq(segment(mydata_MI6[,1], 分词器)) %>% arrange(desc(freq)) %>% head(200)
write.csv(mywords_MI6, "C:/Users/pengjie/Desktop/机型数据/分词数据/MI6.csv",row.names = FALSE)
wordcloud2(data = mywords_MI6,backgroundColor = "grey")

## MI note 3
mydata_MI_note3 <- read.csv("MI note3.csv", stringsAsFactors =FALSE)

分词器 <- worker(user = "user1.txt", stop_word = "stop1.txt")

mywords_MI_note3 <- freq(segment(mydata_MI_note3[,1], 分词器)) %>% arrange(desc(freq)) %>% head(200) 
write.csv(mywords_MI_note3, "C:/Users/pengjie/Desktop/机型数据/分词数据/MI note 3.csv",row.names = FALSE)
wordcloud2(data = mywords_MI_note3,backgroundColor = "grey")

##MIX 2s
mydata_MIX_2s <- read.csv("MIX 2S.csv", stringsAsFactors =FALSE)

分词器 <- worker(user = "user1.txt", stop_word = "stop1.txt")

mywords_MIX_2S <- freq(segment(mydata_MIX_2s[,1], 分词器)) %>% arrange(desc(freq)) %>% head(200) 
write.csv(mywords_MIX_2S, "C:/Users/pengjie/Desktop/机型数据/分词数据/MIX 2S.csv",row.names = FALSE)
wordcloud2(data = mywords_MIX_2S,backgroundColor = "grey")

##Redmi Note 4X
mydata_Redmi_Note_4X <- read.csv("Redmi Note 4X.csv", stringsAsFactors =FALSE)

分词器 <- worker(user = "user1.txt", stop_word = "stop1.txt")

mywords_Redmi_Note_4X <- freq(segment(mydata_Redmi_Note_4X[,1], 分词器)) %>% arrange(desc(freq)) %>% head(200) 
write.csv(mywords_Redmi_Note_4X, "C:/Users/pengjie/Desktop/机型数据/分词数据/Redmi Note 4X.csv",row.names = FALSE)
wordcloud2(data = mywords_Redmi_Note_4X,backgroundColor = "grey")

##Redmi Note 4
mydata_Redmi_Note_4 <- read.csv("Redmi Note 4.csv", stringsAsFactors =FALSE)

分词器 <- worker(user = "user1.txt", stop_word = "stop1.txt")

mywords_Redmi_Note_4 <- freq(segment(mydata_Redmi_Note_4[,1], 分词器)) %>% arrange(desc(freq)) %>% head(200) 
write.csv(mywords_Redmi_Note_4, "C:/Users/pengjie/Desktop/机型数据/分词数据/Redmi Note 4.csv",row.names = FALSE)
wordcloud2(data = mywords_Redmi_Note_4,backgroundColor = "grey")

##Redmi Note 5
mydata_Redmi_Note_5 <- read.csv("Redmi Note 5.csv", stringsAsFactors =FALSE)

分词器 <- worker(user = "user1.txt", stop_word = "stop1.txt")

mywords_Redmi_Note_5 <- freq(segment(mydata_Redmi_Note_5[,1], 分词器)) %>% arrange(desc(freq)) %>% head(200) 
write.csv(mywords_Redmi_Note_5, "C:/Users/pengjie/Desktop/机型数据/分词数据/Redmi Note 5.csv",row.names = FALSE)
wordcloud2(data = mywords_Redmi_Note_5,backgroundColor = "grey")

##MI 5
mydata_MI_5 <- read.csv("MI 5.csv", stringsAsFactors =FALSE)

分词器 <- worker(user = "user1.txt", stop_word = "stop1.txt")

mywords_MI_5 <- freq(segment(mydata_MI_5[,1], 分词器)) %>% arrange(desc(freq)) %>% head(200) 
write.csv(mywords_MI_5, "C:/Users/pengjie/Desktop/机型数据/分词数据/MI5.csv",row.names = FALSE)
wordcloud2(data = mywords_MI_5,backgroundColor = "grey")

##Redmi 5 plus
mydata_Redmi_5_plus <- read.csv("Redmi 5 plus.csv", stringsAsFactors =FALSE)

分词器 <- worker(user = "user1.txt", stop_word = "stop1.txt")

mywords_Redmi_5_plus <- freq(segment(mydata_Redmi_5_plus[,1], 分词器)) %>% arrange(desc(freq)) %>% head(200) 
write.csv(mywords_Redmi_5_plus, "C:/Users/pengjie/Desktop/机型数据/分词数据/Redmi 5 plus.csv",row.names = FALSE)
wordcloud2(data = mywords_Redmi_5_plus,backgroundColor = "grey")

##MI 5X
mydata_MI_5X <- read.csv("MI 5X.csv", stringsAsFactors =FALSE)

分词器 <- worker(user = "user1.txt", stop_word = "stop1.txt")

mywords_MI_5X <- freq(segment(mydata_MI_5X[,1], 分词器)) %>% arrange(desc(freq)) %>% head(200) 
write.csv(mywords_MI_5X, "C:/Users/pengjie/Desktop/机型数据/分词数据/MI 5X.csv",row.names = FALSE)
wordcloud2(data = mywords_MI_5X,backgroundColor = "grey")

##MI MAX2
mydata_MI_MAX2 <- read.csv("MI MAX 2.csv", stringsAsFactors =FALSE)

分词器 <- worker(user = "user1.txt", stop_word = "stop1.txt")

mywords_MI_MAX2 <- freq(segment(mydata_MI_MAX2[,1], 分词器)) %>% arrange(desc(freq)) %>% head(200) 
write.csv(mywords_MI_MAX2, "C:/Users/pengjie/Desktop/机型数据/分词数据/MI MAX2.csv",row.names = FALSE)
wordcloud2(data = mywords_MI_MAX2,backgroundColor = "grey")







