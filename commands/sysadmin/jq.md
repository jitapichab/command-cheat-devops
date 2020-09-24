## Filter using select ##
```
aws route53 list-hosted-zones | jq '.HostedZones[] | select(.Name=="dev.elretake.com.") | .Id'
```

