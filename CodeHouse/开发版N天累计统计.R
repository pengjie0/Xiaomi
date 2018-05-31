
#导入原始数据 8.3.8
setwd("C:/Users/pengjie/Desktop/小米自带/数据标注/三大开发版原始数据 copy")

new_data <- read.csv("8.3.22版本.csv",stringsAsFactors = FALSE)

# 新旧标签转换
setwd("C:/Users/pengjie/Desktop/小米自带/数据标注")
old_new <- read.csv("新旧标签.csv", stringsAsFactors = FALSE)

trans <- function(data){
  if(data["tag_content"] %in% old_new$旧标签){
    data["tag_content"] = old_new[which(data["tag_content"] == old_new$旧标签), "新标签"]
  }
  data
}
new_data <- t(apply(new_data,1,trans)) %>% as.data.frame(.)

sum(new_data$tag_content%in%old_new$旧标签) # 检验转换结果

## 读取数据

setwd("C:/Users/pengjie/Desktop/小米自带/数据标注/开发版六天累计占比")
new_data1 <- read.csv("8.3.1版本.csv")

new_pro <- unique(new_data1$具体问题)[!(unique(new_data1$具体问题) %in% unique(new_data$tag_content))]

new_pro_data <- new_data1[new_data1$具体问题%in%new_pro,]

a <- new_pro_data$具体问题
result1 <-  table(a) %>% as.data.frame() %>% arrange(desc(Freq))

setwd("C:/Users/pengjie/Desktop/小米自带/数据标注/四天标注时间累计占比(五天)")
write.csv(result1,"8.3.1模块3.csv",row.names = FALSE)


new_data$input_time <- factor(new_data$input_time,levels = unique((new_data$input_time)))
time <- levels(new_data$input_time)
result <- matrix(0, ncol=length(time), nrow = 3)
rownames(result) <- c("一级","二级","三级")
colnames(result) <- paste0("第",seq_len(length(time)), "天")

# 数目
for(i in seq_len(length(time))){
  result[1,i] <- length(unique(new_data$category_name[new_data$input_time%in%time[1:i]]))
  result[2,i] <- length(unique(new_data$wide_tag[new_data$input_time%in%time[1:i]]))
  result[3,i] <- length(unique(new_data$tag_content[new_data$input_time%in%time[1:i]]))
}
result

# 问题数据导出
four <- new_data[new_data$时间%in%time[1:4],]

new_pro <- unique(new_data$具体问题)[!(unique(new_data$具体问题) %in% unique(four$具体问题))] # 新增标签

new_pro_data <- new_data[new_data$具体问题%in%new_pro,]

a <- new_pro_data$具体问题
result <-  table(a) %>% as.data.frame() %>% arrange(desc(Freq))

write.csv(result,"8.3.8标注时间.csv",row.names = FALSE)








