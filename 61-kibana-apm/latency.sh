count=0 && while [ $count -lt 1000 ];
do
  curl -i http://127.0.0.1:8080/insert;
  curl -i http://127.0.0.1:8080/select;
  curl -i http://127.0.0.1:8080/groupby;
  curl -i http://127.0.0.1:8080/insert;
  curl -i http://127.0.0.1:8080/insert;
  curl -i http://127.0.0.1:8080/insert;
  curl -i http://127.0.0.1:8080/insert;
  curl -i http://127.0.0.1:8080/select;
  curl -i http://127.0.0.1:8080/groupby;
  curl -i http://127.0.0.1:8080/groupby;
  curl -i http://127.0.0.1:8080/insert;
  curl -i http://127.0.0.1:8080/insert;
  curl -i http://127.0.0.1:8080/groupby;
  curl -i http://127.0.0.1:8080/groupby;
  count=$((count+1));
done
