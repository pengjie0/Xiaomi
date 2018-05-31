require(tidyverse)

## 读取总数据
setwd("C:/Users/pengjie/Desktop/小米自带/数据标注/三天开发版更新处理后总数据")

## 前六天数据
six_totaldata <- read.csv("8.3.8总数据.csv", stringsAsFactors = FALSE)
six_time <- unique(six_totaldata$input_time)
# 前六天标签删除整理
delete_data <- read.csv("删除标签.csv", stringsAsFactors = FALSE)
six_totaldata <- six_totaldata[!six_totaldata$tag_content %in% delete_data[,1],]
#six_totaldata <- six_totaldata[!six_totaldata$category_name=="第三方应用",]
## 取出小于三个标签
#a <- six_totaldata$tag_content %>% table(.) %>% as.data.frame(.) %>% filter(Freq>2) %>% .[,1] %>% as.character(.)
#six_totaldata <- six_totaldata[six_totaldata$tag_content%in%a,]

## 前五天数据
five_totaldata <- six_totaldata %>% filter(input_time %in% six_time[1:5])
five_time <- unique(five_totaldata$input_time)
# 前五天标签删除整理
five_totaldata <- five_totaldata[!five_totaldata$tag_content %in% delete_data[,1],]
#five_totaldata <- five_totaldata[!five_totaldata$category_name=="第三方应用",]
# 取出小于三个标签
#b <- five_totaldata$tag_content %>% table(.) %>% as.data.frame(.) %>% filter(Freq>2) %>% .[,1] %>% as.character(.)
#five_totaldata <- five_totaldata[five_totaldata$tag_content%in%b,]

## 读取按照标注时间数据
setwd("C:/Users/pengjie/Desktop/小米自带/数据标注/三大开发版原始数据 copy")
five_data <- read.csv("8.3.1.csv", stringsAsFactors = FALSE)
# 标注时间数据删除整理
five_data <- five_data[!five_data$三级 %in% delete_data[,1],]
#five_data <- five_data[!five_data$一级=="第三方应用",]
# 取出小于三个标签
#c <- five_data$三级 %>% table(.) %>% as.data.frame(.) %>% filter(Freq>2) %>% .[,1] %>% as.character(.)
#five_data <- five_data[five_data$三级%in%b,]


## 结果
sum(unique(five_data) %in% five_totaldata$tag_content) # 查看三级标签是否都在总数据中

table(five_data$三级) %>% length(.)  # 查看标注时间数据中的三级标签数目   348

table(five_totaldata$tag_content) %>% length(.) # 查看五天总数据中的三级标签数目  590

## 每隔500取一次，取到2000结果
data_2000 <- five_totaldata[c(1:500, 1001:1500, 2001:2500, 3001:3500, 4001:4500),]

table(data_2000$tag_content) %>% length(.)  # 查看抽样2000条数据中的三级标签数目   389
## 隔500取一次问题导出，并给出模块占比
new_pro <- unique(five_totaldata$tag_content)[!(unique(five_totaldata$tag_content) %in% unique(data_2000$tag_content))] # 新增标签

new_pro_data <- five_totaldata[five_totaldata$tag_content%in%new_pro,]

a <- new_pro_data$tag_content
result <-  table(a) %>% as.data.frame() %>% arrange(desc(Freq))
result$a <- as.character(result$a)
result$modul <- 0   # 初始化模块数目
result$modulNum <- 0 
modulNum <- table(five_totaldata$category_name) %>% as.data.frame(.)
# 循环找到标签对应的模块并给出数目
for(i in 1:length(result$a)){
  result$modul[i] <- five_totaldata$category_name[which(five_totaldata$tag_content %in% result$a[i])[1]]
  result$modulNum[i] <- modulNum[which(modulNum$Var1 %in% result$modul[i]),"Freq"]
}
colnames(result) <- c("遗漏问题", "数目", "模块", "模块数目")
write.csv(result, "8.3.1模块占比.csv",row.names = FALSE)


## 随机取2000, 取50次求平均
result <- num <- c()
for(i in 1:50){
sample_2000 <- five_totaldata[sample(nrow(five_totaldata), 2000),]

num <- table(sample_2000$tag_content) %>% length(.)  # 查看抽样2000条数据中的三级标签数目   367
print(num)
result <- result %>% c(num)
}

mean(result)                       ## 平均50次得到的结果, 378.82(从五天中取)， 344(从六天中取)

## N--N-1结果统计
result <- matrix(0, ncol=length(six_time), nrow = 3)
rownames(result) <- c("一级","二级","三级")
colnames(result) <- paste0("第",seq_len(length(six_time)), "天")
# 数目
for(i in seq_len(length(six_time))){
  result[1,i] <- length(unique(six_totaldata$category_name[six_totaldata$input_time%in%six_time[1:i]]))
  result[2,i] <- length(unique(six_totaldata$wide_tag[six_totaldata$input_time%in%six_time[1:i]]))
  result[3,i] <- length(unique(six_totaldata$tag_content[six_totaldata$input_time%in%six_time[1:i]]))
}
result
# 问题数据导出
four <- six_totaldata[six_totaldata$input_time%in%six_time[1:4],]

new_pro <- unique(six_totaldata$tag_content)[!(unique(six_totaldata$tag_content) %in% unique(four$tag_content))] # 新增标签

new_pro_data <- six_totaldata[six_totaldata$tag_content%in%new_pro,]

a <- new_pro_data$tag_content
result <-  table(a) %>% as.data.frame() %>% arrange(desc(Freq))

write.csv(result,"8.3.8标注问题.csv",row.names = FALSE)






## 分层抽样的思想，较大的模块少取，较小的模块多取
# 前10模块名称
modul_Num <- as.data.frame(table(six_totaldata$category_name)) %>% arrange(desc(Freq)) %>% .[1:10,]
name_10 <-as.character(modul_Num$Var1)

# 取出前10模块
modul_10 <- six_totaldata %>% filter(category_name %in% name_10)

# 取出非前10模块
modul_other <- six_totaldata %>% filter(!category_name %in% name_10)

# 取样并合并50次
result <- out <- c()
for(i in 1:50){
modul_10_10 <- modul_10[sample(nrow(modul_10), 460),] # 前10取10%
modul_other_38 <- modul_other[sample(nrow(modul_other), 1540),]  # 其他取38%

sample_data <- rbind(modul_10_10, modul_other_38)
out <- table(sample_data$tag_content) %>% length(.)
print(out)
result <- result %>% c(out)
}


