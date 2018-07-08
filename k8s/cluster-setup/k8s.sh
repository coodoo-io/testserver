kops create cluster \
    --node-count 3 \
    --master-count 1 \
    --cloud-labels kubernetes.io/cluster/$KOPS_CLUSTER_NAME=owned \
    --zones eu-central-1a,eu-central-1b,eu-central-1c \
    --bastion \
    ${KOPS_CLUSTER_NAME}

# kops create cluster \
#     --cloud aws \
#     --node-count 3 \
#     --master-count 2 \
#     --zones eu-centa-1a,eu-west-1b,eu-west-1c \
#     --master-zones eu-west-1a,eu-west-1b,eu-west-1c \
#     --dns-zone ${KOPS_CLUSTER_NAME} \
#     --node-size t2.medium \  
#     --master-size t2.medium \
#     --topology private \
#     --networking canal \
#     --name=${KOPS_CLUSTER_NAME} \
#     --vpc=${VPC_ID} \
#     --cloud-labels kubernetes.io/cluster/$KOPS_CLUSTER_NAME=owned
#     --bastion \
#     ${KOPS_CLUSTER_NAME}