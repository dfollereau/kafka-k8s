kubectl create ns kafka-operator
kubectl create ns kafka-res
kubectl create ns kafka-air
kubectl create ns kafka-dcs
kubectl -n kafka-operator apply -f 010-ServiceAccount-strimzi-cluster-operator.yaml
kubectl -n kafka-operator apply -f 020-ClusterRole-strimzi-cluster-operator-role.yaml
kubectl -n kafka-operator apply -f 020-RoleBinding-strimzi-cluster-operator.yaml
kubectl -n kafka-operator apply -f 021-ClusterRole-strimzi-cluster-operator-role.yaml
kubectl -n kafka-operator apply -f 021-ClusterRoleBinding-strimzi-cluster-operator.yaml
kubectl -n kafka-operator apply -f 030-ClusterRole-strimzi-kafka-broker.yaml
kubectl -n kafka-operator apply -f 030-ClusterRoleBinding-strimzi-cluster-operator-kafka-broker-delegation.yaml
kubectl -n kafka-operator apply -f 031-ClusterRole-strimzi-entity-operator.yaml
kubectl -n kafka-operator apply -f 031-RoleBinding-strimzi-cluster-operator-entity-operator-delegation.yaml
kubectl -n kafka-operator apply -f 032-ClusterRole-strimzi-topic-operator.yaml
kubectl -n kafka-operator apply -f 032-RoleBinding-strimzi-cluster-operator-topic-operator-delegation.yaml
kubectl -n kafka-operator apply -f 033-ClusterRole-strimzi-kafka-client.yaml
kubectl -n kafka-operator apply -f 033-ClusterRoleBinding-strimzi-cluster-operator-kafka-client-delegation.yaml
kubectl -n kafka-operator apply -f 042-Crd-kafkaconnects2i.yaml
kubectl -n kafka-operator apply -f 043-Crd-kafkatopic.yaml
kubectl -n kafka-operator apply -f 044-Crd-kafkauser.yaml
kubectl -n kafka-operator apply -f 045-Crd-kafkamirrormaker.yaml
kubectl -n kafka-operator apply -f 046-Crd-kafkabridge.yaml
kubectl -n kafka-operator apply -f 047-Crd-kafkaconnector.yaml
kubectl -n kafka-operator apply -f 040-Crd-kafka.yaml
kubectl -n kafka-operator apply -f 041-Crd-kafkaconnect.yaml
kubectl -n kafka-operator apply -f 048-Crd-kafkamirrormaker2.yaml
kubectl -n kafka-operator apply -f 049-Crd-kafkarebalance.yaml
kubectl -n kafka-operator apply -f 050-ConfigMap-strimzi-cluster-operator.yaml
kubectl -n kafka-air apply -f 020-RoleBinding-strimzi-cluster-operator-NS-AIR.yaml
kubectl -n kafka-air apply -f 031-RoleBinding-strimzi-cluster-operator-entity-operator-delegation-NS-AIR.yaml
kubectl -n kafka-air apply -f 032-RoleBinding-strimzi-cluster-operator-topic-operator-delegation-NS-AIR.yaml
kubectl -n kafka-res apply -f 020-RoleBinding-strimzi-cluster-operator-NS-RES.yaml
kubectl -n kafka-res apply -f 031-RoleBinding-strimzi-cluster-operator-entity-operator-delegation-NS-RES.yaml
kubectl -n kafka-res apply -f 032-RoleBinding-strimzi-cluster-operator-topic-operator-delegation-NS-RES.yaml
kubectl -n kafka-dcs apply -f 020-RoleBinding-strimzi-cluster-operator-NS-DCS.yaml
kubectl -n kafka-dcs apply -f 031-RoleBinding-strimzi-cluster-operator-entity-operator-delegation-NS-DCS.yaml
kubectl -n kafka-dcs apply -f 032-RoleBinding-strimzi-cluster-operator-topic-operator-delegation-NS-DCS.yaml
kubectl delete clusterrolebinding strimzi-cluster-operator-namespaced
kubectl delete clusterrolebinding strimzi-cluster-operator-entity-operator-delegation
kubectl delete clusterrolebinding strimzi-cluster-operator-topic-operator-delegation
kubectl create clusterrolebinding strimzi-cluster-operator-namespaced --clusterrole=strimzi-cluster-operator-namespaced --serviceaccount kafka-operator:strimzi-cluster-operator
kubectl create clusterrolebinding strimzi-cluster-operator-entity-operator-delegation --clusterrole=strimzi-entity-operator --serviceaccount kafka-operator:strimzi-cluster-operator
kubectl create clusterrolebinding strimzi-cluster-operator-topic-operator-delegation --clusterrole=strimzi-topic-operator --serviceaccount kafka-operator:strimzi-cluster-operator
kubectl -n kafka-operator apply -f 060-Deployment-strimzi-cluster-operator.yaml
