# Actualización cluster EKS Ocean Cluster version 1.14 a 1.16  #

## Pasos ##

1. Upgradear el control Plane a la version 1.15.
2. Crear un nuevo *Virtual_Node_Group* en *spotinst* con el ami de la version 1.15  [Amazon Eks Ami's](https://docs.aws.amazon.com/eks/latest/userguide/eks-optimized-ami.html), agregarle a este un label. 
3. Testiar que todo este bien creando un pod con node selector para que haga schedule en el Virtual_Node_Group de prueba.

```yaml
---
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  labels:
    env: test
spec:
  containers:
  - name: nginx
    image: nginx
    imagePullPolicy: IfNotPresent
  nodeSelector:
    purpose: upgrade
```
4. Hacer backup de los servicios **kube-proxy**, **coredns** y **awscni**.
5. Actualizar los servicios **kube-proxy**, **coredns** y **awscni** a sus versiones compatibles para la version __1.15__.
  * **kube-proxy**:
  ```kubectl patch daemonset kube-proxy -n kube-system -p '{"spec": {"template": {"spec": {"containers": [{"image": "602401143452.dkr.ecr.us-east-1.amazonaws.com/eks/kube-proxy:v1.15.11","name":"kube-proxy"}]}}}}'```
  * **coredns**:
  ```kubectl set image --namespace kube-system deployment.apps/coredns coredns=602401143452.dkr.ecr.us-east-1.amazonaws.com/eks/coredns:v1.6.6```
  * **aws-cni**: 
  ```bash
  foo@bar:~$ curl -o aws-k8s-cni.yaml https://raw.githubusercontent.com/aws/amazon-vpc-cni-k8s/v1.7.5/config/v1.7/aws-k8s-cni.yaml
  foo@bar:~$ sed -i -e 's/us-west-2/{{ mi-region}} /' aws-k8s-cni.yaml
  foo@bar:~$ kubectl apply -f aws-k8s-cni.yaml
  ```
6. Upgradear el control plane de EKS a la version 1.16.
7. Cambiar el **AMI** en el *Virtual_Node_Group* correspondiente a la version 1.16 y retestear.
8. Actualizar el kube-proxy a la nueva version.
```console
kubectl patch daemonset kube-proxy -n kube-system -p '{"spec": {"template": {"spec": {"containers": [{"image": "602401143452.dkr.ecr.us-west-2.amazonaws.com/eks/kube-proxy:v1.16.13-eksbuild.1","name":"kube-proxy"}]}}}}'
```
9. Testiar que se planche un pod en ese nodo con la nueva version sin ningun problema.
10. Proceso de Rolling de las instancias. Basados en que el cluster migrado usa el kube-controller de Spotinst ocean. Para el schedule de las instancias, el proceso recomendado es el siguiente.
  * Cordonear todos los nodos de manera que no se puedan schedulear nuevos pods en estos.
  ```
  kubectl cordon `kubectl get nodes | grep -v NAME | awk '{print $1}'` 
  ```
  * Empezar a hacer draining de  todos los nodos uno por uno con un tiempo prudente entre el drain de uno y del otro, para el cluster de astronomer de desarrollo este tiempo fue de 3 min aproximadamente, para el cluster de producción lo vamos ampliar a 5 min.
  


