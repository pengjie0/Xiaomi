
## N = a + b
AddNum <- function(num, N){
  num <- unique(num)
  num <- num[num<=N]
  out <- N - num
  out <- out[out%in%num]
  out1 <- N -  out
  for(i in 1:length(out)){
    print(paste(out[i], "+", out1[i], "=", N, sep = " "))
  }
}

## 发钱问题
GetMoney <- function(money){
  out <- c()
  out[1] <- "T"
  for(i in 1:(length(money)-1)){
    if(money[i+1]>money[i]){
      out[i + 1] <- "F"
    }else{
      out[i + 1] <- "T"
    }
  }
  Gmoney = 1
  result <- c()
 if(out[1]=="T"){
   result[1] <- 1
 }else{
   result[1] <- 2
 }
  for(i in 1:(length(out)-1)){
    if(out[i+1]=="F"){
      result[i+1] = result[i] + 1
    }else{
      result[i+1] = 1
    }
  }
  sum(result)
}



