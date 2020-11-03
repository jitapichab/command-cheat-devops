### Delete pods ###
```console
foo@bar:~$ kubectl delete pod `kubectl get pods | awk '$3 == "CrashLoopBackOff" {print $1}' 
foo@bar:~$ kubectl delete pod `kubectl get pods  | grep pod_name | awk '{print $1}'`
```
### Delete all resouces in specific namespace ###
```console
kubectl delete all --all -n default
```





