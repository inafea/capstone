eksctl create cluster \
--name capstone-cluster \
--version 1.21 \
--nodegroup-name capstone-workers-ng \
--node-type t2.micro \
--nodes 2 \
--nodes-min 1 \
--nodes-max 3 