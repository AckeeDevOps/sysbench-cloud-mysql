# sysbench-cloud-mysql
Cloud Mysql benchmark test using sysbench

# run it with Docker
```
docker build -t sysbench . 
docker run -e TEST_SYSTEM=test -e MYSQL_HOST=localhost \
           -e MYSQL_USER=root -e MYSQL_PASSWORD=toor \
              sysbench 
```
# without Docker
```
chmod +x run.sh && ./run.sh MYSQL_HOST MYSQL_USER MYSQL_PASSWORD
```

# plot the data
```
chmod +x plot/parse-data.sh && plot/parse-data.sh
```

# links
https://cloudplatform.googleblog.com/2016/08/Cloud-SQL-Second-Generation-performance-and-feature-deep-dive.html
https://github.com/akopytov/sysbench
