source("./Code/0_loadpackages.R")


# Get the data from the Grayscale website

GBTC <- read.csv("https://grayscale.com/wp-content/uploads/market-data/btc.csv?v=218155",skip = 0, header = TRUE) %>%
          as_tibble() %>% 
          select(-contains(c("24","Inception","Trailing","YTD","ProductName","Asset","Disclaimer")))

# Get the first date of the data and print it to the screen
MinDate <- GBTC %>%
            select(Date) %>%
            top_n(n = -1) %>%
            pull(Date) %>%
            as.Date()     


paste0("The first date of record is ", 
       lubridate::month(MinDate, label = TRUE, , abbr = FALSE), " ",
       lubridate::day(MinDate), " ",
       lubridate::year(MinDate), "."
)

# Get the last date of the data and print it to the screen
MaxDate <- GBTC %>%
            select(Date) %>%
            top_n(n = 1) %>%
            pull(Date) %>%
            as.Date() 


paste0("The last date of record is ", 
       lubridate::month(MaxDate, label = TRUE, , abbr = FALSE), " ",
       lubridate::day(MaxDate), " ",
       lubridate::year(MaxDate), "."
       )

saveRDS(GBTC, "./Data/GBTC.RDS")
