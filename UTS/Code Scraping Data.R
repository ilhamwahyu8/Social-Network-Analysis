#install.packages("rtweet")
library(rtweet)
if (!requireNamespace("httpuv", quietly = TRUE)) {
  install.packages("httpuv")
}
## store api keys (these are fake example values; replace with your own keys)
api_key <- "SbLuZCXqiyJBRNPsWLo9JDOzO"
api_secret_key <- "txJidGFR8k1dcN0VToFV22sJLEJi8JJjnHSiH3zGYdzqlk24NL"
access_token <- "1913090960-lmFKNMzV1qtGVHGGpRm15KGh1RnfdWiXs2Jz51J"
access_token_secret <- "8YEFD4bk5qXf3r2KySfD0kQ0cUWYYEA32gfYp0bkWclpd"

## authenticate via web browser
token <- create_token(
  app = "TugasAnalisisSosmed",
  consumer_key = api_key,
  consumer_secret = api_secret_key,
  access_token = access_token,
  access_secret = access_token_secret)

library(rtweet)
get_token()


dataProtokol <- search_tweets(
  "protokol kesehatan", n = 40000, geocode = lookup_coords("Jakarta"), retryonratelimit = TRUE
)

dataSocial <- search_tweets(
  "jaga jarak", n = 40000, geocode = lookup_coords("Jakarta"), retryonratelimit = TRUE
)

dataTangan <- search_tweets(
  "cuci tangan", n = 40000, geocode = lookup_coords("Jakarta"), retryonratelimit = TRUE
)

dataMasker <- search_tweets(
  "gunakan masker", n = 40000, geocode = lookup_coords("Jakarta"), retryonratelimit = TRUE
)

dataProtokolPop <- search_tweets(
  "protokol kesehatan", n = 10000, geocode = lookup_coords("Jakarta"), retryonratelimit = TRUE, type = "popular"
)

dataSocialPop <- search_tweets(
  "jaga jarak", n = 10000, geocode = lookup_coords("Jakarta"), retryonratelimit = TRUE, type = "popular"
)

dataTanganPop <- search_tweets(
  "cuci tangan", n = 10000, geocode = lookup_coords("Jakarta"), retryonratelimit = TRUE, type = "popular"
)

dataMaskerPop <- search_tweets(
  "gunakan masker", n = 10000, geocode = lookup_coords("Jakarta"), retryonratelimit = TRUE, type = "popular"
)


save_as_csv(dataProtokol, file_name = "Data Penerapan Protokol Kesehatan Jakarta 2020")
save_as_csv(dataSocial, file_name = "Data Jaga Jarak Jakarta 2020")
save_as_csv(dataMasker, file_name = "Data Masker Jakarta 2020")
save_as_csv(dataTangan, file_name = "Data Cuci Tangan Jakarta 2020")
