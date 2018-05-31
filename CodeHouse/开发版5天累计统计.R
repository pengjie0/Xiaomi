
# 8.3.8
setwd("C:/Users/pengjie/Desktop/数据标注/开发版五天累计占比")

new_data <- read.csv("8.3.1版本.csv",stringsAsFactors = FALSE)

# 一级
new_data$时间 <- factor(new_data$时间)

one <- new_data[new_data$时间=="2018-3-8",]
length(unique(one$模块))     # 43
length(unique(one$问题类型)) # 53
length(unique(one$具体问题)) # 58

two <- new_data[new_data$时间%in%c("2018-3-8","2018-3-9"),]
length(unique(two$模块))     # 75
length(unique(two$问题类型)) # 154
length(unique(two$具体问题)) # 338

three <- new_data[new_data$时间%in%c("2018-3-8","2018-3-9","2018-3-10"),]
length(unique(three$模块))     # 85
length(unique(three$问题类型)) # 202
length(unique(three$具体问题)) # 554

four <- new_data[new_data$时间%in%c("2018-3-8","2018-3-9","2018-3-10","2018-3-11"),]
length(unique(four$模块))     # 87
length(unique(four$问题类型)) # 223
length(unique(four$具体问题)) # 674

# 问题数据导出

new_pro <- unique(new_data$具体问题)[!(unique(new_data$具体问题) %in% unique(four$具体问题))] # 新增标签

new_pro_data <- new_data[new_data$具体问题%in%new_pro,]

write.csv(new_pro_data,"8.3.8版本新问题.csv",row.names = FALSE)

# 8.3.1
setwd("C:/Users/pengjie/Desktop/数据标注/开发版五天累计占比")

new_data <- read.csv("8.3.1版本.csv",stringsAsFactors = FALSE)

# 一级
new_data$时间 <- factor(new_data$时间)

one <- new_data[new_data$时间=="2018-3-1",]
length(unique(one$模块))     # 38
length(unique(one$问题类型)) # 55
length(unique(one$具体问题)) # 69

two <- new_data[new_data$时间%in%c("2018-3-2","2018-3-1"),]
length(unique(two$模块))     # 76
length(unique(two$问题类型)) # 161
length(unique(two$具体问题)) # 407

three <- new_data[new_data$时间%in%c("2018-3-2","2018-3-1","2018-3-3"),]
length(unique(three$模块))     # 83
length(unique(three$问题类型)) # 206
length(unique(three$具体问题)) # 625

four <- new_data[new_data$时间%in%c("2018-3-2","2018-3-1","2018-3-3","2018-3-4"),]
length(unique(four$模块))     # 83
length(unique(four$问题类型)) # 206
length(unique(four$具体问题)) # 625'

# 问题数据导出

new_pro <- unique(new_data$具体问题)[!(unique(new_data$具体问题) %in% unique(four$具体问题))] # 新增标签

new_pro_data <- new_data[new_data$具体问题%in%new_pro,]

write.csv(new_pro_data,"8.3.1版本新问题.csv",row.names = FALSE)

# 8.3.22
setwd("C:/Users/pengjie/Desktop/数据标注/开发版五天累计占比")

new_data <- read.csv("8.3.22版本.csv",stringsAsFactors = FALSE)

# 一级
new_data$时间 <- factor(new_data$时间)

one <- new_data[new_data$时间=="2018-3-22",]
length(unique(one$模块))     # 38
length(unique(one$问题类型)) # 66
length(unique(one$具体问题)) # 84

two <- new_data[new_data$时间%in%c("2018-3-22","2018-3-23"),]
length(unique(two$模块))     # 70
length(unique(two$问题类型)) # 153
length(unique(two$具体问题)) # 345

three <- new_data[new_data$时间%in%c("2018-3-22","2018-3-23","2018-3-24"),]
length(unique(three$模块))     # 85
length(unique(three$问题类型)) # 188
length(unique(three$具体问题)) # 518

four <- new_data[new_data$时间%in%c("2018-3-22","2018-3-23","2018-3-24","2018-3-25"),]
length(unique(four$模块))     # 89
length(unique(four$问题类型)) # 226
length(unique(four$具体问题)) # 667

new_pro <- unique(new_data$具体问题)[!(unique(new_data$具体问题) %in% unique(four$具体问题))] # 新增标签

new_pro_data <- new_data[new_data$具体问题%in%new_pro,]

write.csv(new_pro_data,"8.3.22版本新问题.csv",row.names = FALSE)












