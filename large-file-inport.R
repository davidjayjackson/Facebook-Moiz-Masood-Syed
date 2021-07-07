## Source Data: https://drive.google.com/file/d/1VLqWYu4Bpe9RvNr2joPuPf_Fd6s3lDgE/view?fbclid=IwAR1xiX7VqyfRbqnQBkgmTpp0oyDA3Wuq8f8xwEKHOSl6oK3WF8qjcLJUkLg
rm(list=ls())
## Begin Code:

library(tidyverse)
# library(dplyr)
library(zoo)
library(lubridate)
library(xts)
# library(tidyr)
library(DBI)
library(odbc)

df<- read.csv(file = "./JanFeb20.csv")
df$Time <- as.factor(df$Time)
df$Day <- as.Date(df$Day,format="%m/%d/%y")
# df$Day <- as.factor(df$Day)

moiz <- DBI::dbConnect(odbc::odbc(),Driver = "SQL Server",
                      Server = "abc.database.windows.net",
                      database = "abc",
                      uid='abc',
                      pwd= 'abc',
                      port=1433
)

DBI::dbWriteTable(moiz,"abc",df,overwrite=TRUE)

### MY code:
dbSendCREATE DATABASE testDB;