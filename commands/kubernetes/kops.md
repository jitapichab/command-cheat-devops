### Create kops clusters ###
```console
foo@bar:~$ export KOPS_STATE_STORE=s3://elretake-kops
foo@bar:~$ kops create cluster \
    --node-count 1 \
    --zones us-east-1a \
    --master-zones us-east-1a,us-east-1b,us-east-1c \
    --dns-zone dev.elretake.com \
    --node-size t2.medium \
    --master-size t2.large \
    --topology private \
    --networking amazonvpc \
    --ssh-public-key ~/.ssh/kops.pub \
    --kubernetes-version 1.18.8 \
    --bastion \
    --name cluster.dev.elretake.com
foo@bar:~$ kops update cluster cluster.dev.elretake.com --yes
```
