### Get name metrics by job ###
```console
sum by (__name__) ({__name__=~".+",job="istio-mesh"})
```
### Big metrics by Job ###
```console
topk(10, count by (__name__, job)({__name__=~".+"}))
````

