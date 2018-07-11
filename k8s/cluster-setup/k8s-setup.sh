kops create cluster \
    --node-count 3 \
    --master-count 1 \
    --cloud-labels kubernetes.io/cluster/${KOPS_CLUSTER_NAME}=owned \
    --master-size t2.medium \
    --zones ${AWS_AVAILABILITY_ZONES} \
    --name ${KOPS_CLUSTER_NAME} \
    --yes

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

# kops delete cluster --name ${KOPS_CLUSTER_NAME} --yes

# kops validate cluster --name ${KOPS_CLUSTER_NAME}

# kops get clusters