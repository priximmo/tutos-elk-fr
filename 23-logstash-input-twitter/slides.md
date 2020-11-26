%title: ELK
%author: xavki


# LOGSTASH : INPUT PLUGIN  TWITTER


<br>


* créer un accès à l'API Twitter

```
https://developer.twitter.com/en/application/
```

* input twitter


```
input {
  twitter {
      consumer_key => "<API key>"
      consumer_secret => "<API Secret Key>"
      oauth_token => "<Access token>"
      oauth_token_secret => "<Access token secret"
      keywords => ["xavki"]
      full_tweet => false
  }
}
output {
  elasticsearch {
    hosts => ["localhost:9200"]
    index => "twitter-%{+YYYY.MM.dd}"     
 }
}
```

