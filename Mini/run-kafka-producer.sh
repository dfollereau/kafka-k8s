kubectl get svc -n kafka-air
kubectl run kafka-producer -n kafka-air -ti --image=strimzi/kafka:0.20.0-rc1-kafka-2.6.0 --rm=true --restart=Never -- bin/kafka-console-producer.sh --broker-list my-kafka-kafka-bootstrap:9092 --topic my-topic
