library(httr)
library(dplyr)
#library(rjson)
library(jsonlite)
library(RJSONIO)

http://i.yjapi.com/ECI/Search?key=ApiKey&keyword=小米科技有限责任公司&province=BJ

api <- "http://dev.i.yjapi.com/ECI/GetDetailsByName?"
apikey <- ""
keyword <- "苏州朗动网络科技有限公司"

response_content2 <- api %>% 
  paste0("key=", apikey) %>%
  paste0("&keyword=", keyword) %>%
  GET() 

response_content2 <- fromJSON(rawToChar(response_content2$content))

this.content <- fromJSON(this.raw.content)

df = data.frame()
for(i in 1:length(response_content2$Result)){
  record = response_content2$Result[[i]]
  
  df_record = data.frame("_"=1)
  for(j in 1:length(record)){
    temp = as.data.frame(record[j])
    df_record = cbind(df_record, temp)
  }
  #df_record = do.call(what = "cbind", args = lapply(record, as.data.frame))
  df = rbind(df, df_record)
}

record = response_content2$Result
df_record = data.frame("_"=1)
for(j in 1:length(record)){
  if(record[j]=="NULL"){
    feat = names(record)[j]
    temp = data.frame(feat = " ")
  }else{ 
    temp = as.data.frame(record[j])
    print(j)
  }
  df_record = cbind(df_record, temp)
}
  
this.raw.content <- rawToChar(response_content$content)

this.content <- fromJSON(this.raw.content)

this.content.df <- do.call(what = "rbind",
                           args = lapply(response_content$Result, as.data.frame))

this.raw.content <- lapply(response_content[3], function(x) {
  x[sapply(x, is.null)] <- NA
  unlist(x)
})
# the following function is to convert the 
list_file <- lapply(response_content[3], function(x) {
  x[sapply(x, is.null)] <- NA
  unlist(x)
})
do.call("rbind", list_file)



api <- "http://dev.i.yjapi.com/ECI/GetCityList?"
apikey <- ""
keyword <- "苏州朗动网络科技有限公司"

response_content <- api %>% 
  paste0("key=", apikey) %>%
  #paste0("&keyword=", keyword) %>%
  GET() %>%
  content() # 最后返回的结果是一个json，这里指定的话，会自动识别，json就转为list

list_file <- lapply(response_content[3], function(x) {
  x[sapply(x, is.null)] <- NA
  unlist(x)
})
df = do.call("rbind", list_file)



df = data.frame(matrix(unlist(response_content[3]), nrow=lengths(response_content[3]), byrow=T), 
                 stringsAsFactors=FALSE)


access_token <- response_contentdatadataaccess_token
refresh_token <- response_contentdatadatarefresh_token

req <- GET(paste0("https://api.dinghuo123.com/v2/order/pull_order.json?transportType=tcp&size=100&loadLog=false&loadDetail=true&loadRemark=true", "&access_token=", access_token))

status_code(req)
content(req,encoding = utf-8)
