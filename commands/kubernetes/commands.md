### Delete pods ###
```console
foo@bar:~$ kubectl delete pod `kubectl get pods --all-namespaces | awk '$4 == "ImagePullBackOff" {print $2 " -n " $1 }'`' 
foo@bar:~$ kubectl delete pod `kubectl get pods  | grep pod_name | awk '{print $1}'`
```
### Delete all resouces in specific namespace ###
```console
kubectl delete all --all -n default
```





