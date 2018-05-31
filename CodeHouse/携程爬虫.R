出发地 <- 到达地 <- 机型 <- 出发站名 <- 到达站名 <- 出发时间 <- 到达时间 <- 机票价格 <- c()

date_go <- c("2018-4-30", "2018-05-01")

city_arr <- c("SHA", "CAN")

for(date in date_go){
for(city_a in city_arr){
tryCatch({
baseurl <- paste0('http://flights.ctrip.com/domesticsearch/search/SearchFirstRouteFlights?DCity1=BJS&ACity1=',city_a,'&SearchType=S&DDate1=', date)
header <- c(
  'Content-Type'='text/html', 
  'User-Agent'='Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36',
  'Referer'=paste0('http://flights.ctrip.com/booking/bjs-sha-day-1.html?ddate1=', date),
  'Cookie' = '_abtest_userid=709c5e52-2855-45d5-b6a1-b0564c8eb612; _RSG=DWaqYt8z6HFvlIkg6ri0W9; _RDG=289b06415816172228087c53e6b35ee5de; _RGUID=f446f48d-e2d2-480d-9800-b351aab92bf9; MKT_Pagesource=PC; _ga=GA1.2.1716233094.1524651312; DomesticUserHostCity=BJS|%b1%b1%be%a9; appFloatCnt=1; _gid=GA1.2.1678115818.1524986988; _RF1=182.48.107.132; FD_SearchHistorty={"type":"D","data":"D%24%u5317%u4EAC%28BJS%29%24BJS%242018-04-29%24%u4E0A%u6D77%28SHA%29%24SHA%242018-05-03"}; _gat=1; _jzqco=%7C%7C%7C%7C1524986984022%7C1.1044131198.1524651311583.1524991803574.1524991951389.1524991803574.1524991951389.undefined.0.0.19.19; __zpspc=9.3.1524990609.1524991951.7%234%7C%7C%7C%7C%7C%23; _bfa=1.1524651308474.35ojml.1.1524986981283.1524990605578.3.21; _bfs=1.8; _bfi=p1%3D10320662761%26p2%3D10320662761%26v1%3D21%26v2%3D20'
)
payload<-list(
  "DCity1"="BJS",
  "ACity1"=city_a,
  "SearchType"="S",
  "DDate1"=date,
  "IsNearAirportRecommond"=0
)

r <- GET(baseurl,add_headers(.headers =header),query =payload,encode="json")
myresult <-r %>% content(as="text") %>% fromJSON(flatten = TRUE)

出发地 <- myresult$fis$dcn %>% c(出发地, .)
到达地 <-  myresult$fis$acn %>% c(到达地, .)
机型 <- myresult$fis$fn %>% c(机型, .)
出发站名 <-  myresult$fis$dpbn %>% c(出发站名, .)
到达站名 <-  myresult$fis$apbn %>% c(到达站名, .)
出发时间 <- myresult$fis$dt %>% c(出发时间, .)
到达时间 <- myresult$fis$at %>% c(到达时间, .)
机票价格 <-  myresult$fis$lp %>% c(机票价格, .)
cat(sprintf("正在处理【%s】--【%s】！",date,city_a),sep = "\n")
},error = function(e){
  cat(sprintf("【%s】--【%s】抓取失败!",date,city_a),sep = "\n")
})
}}

mydata <- data.frame(出发地=出发地,到达地=到达地,机型=机型,出发站名=出发站名,
                        到达站名=到达站名,出发时间=出发时间,
                        到达时间=到达时间,机票价格=机票价格)







