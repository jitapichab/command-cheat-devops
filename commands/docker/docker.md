### Delete all images exited 
```docker rm -vf $(docker ps -a -q -f status=exited)```


