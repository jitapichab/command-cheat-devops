#### get kafkaacls ###
```./kafka-acls.sh --list --topic test_topic --bootstrap-server xxx:9092```

### Use Kafka Cat to consume messages ###
```docker run -it --network=host edenhill/kafkacat:1.6.0 -b $kafka_uy -t topic -p partition -o offset -f 'Topic  %t [%p] offset %o: message: %s Header: %h \n'```




