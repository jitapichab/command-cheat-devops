### Chaos toolkit commands ###

## Create a report ##

```docker run \
    --user `id -u` \
    -v `pwd`:/tmp/result \
    -it \
    chaostoolkit/reporting -- report --export-format=html5 journal-*.json report.html```


