
pacman::p_load(tidyverse,magrittr,dplyr,lubridate,zoo,stringr,highfrequency,xts)

sep = ','
df_trades <- read.csv2('dataset_trades.csv', sep = sep)
scale_microseconds = 1000000

df_trades%<>% as_tibble() %>%
  mutate(timestamp =
           as_datetime(as.POSIXct(df_trades$timestamp / scale_microseconds,
                                  origin = "1970-01-01",tz = 'UTC')))


df_trades %<>% mutate(price = as.numeric(price),
                           amount = as.numeric(amount))

df_trades %>% rename(SYMBOL = symbol,DT = timestamp,PRICE = price) %>%
  select(DT,PRICE, SYMBOL)%>% mutate(PRICE = as.numeric(PRICE))%>%
  data.table::data.table() ->df_BTC


ggplot(df_BTC,aes(x=DT,y=PRICE)) + geom_line() +theme_light() +
xlab('Date') + ggtitle('BTC/USD', subtitle = 'second-by-second: 06-06-2021- 2021-06-13' )





plot(HAR_RV)   

