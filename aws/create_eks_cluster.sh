eksctl create cluster \
--name bn-prod \
--version 1.21 \
--nodegroup-name standard-workers \
--node-type t2.micro \
--nodes 3 \
--nodes-min 1 \
--nodes-max 4 