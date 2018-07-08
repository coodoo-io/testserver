aws s3api create-bucket --bucket ${KOPS_CLUSTER_NAME} --region ${AWS_REGION} --create-bucket-configuration LocationConstraint=eu-central-1
aws s3api put-bucket-versioning --bucket ${KOPS_CLUSTER_NAME}  --versioning-configuration Status=Enabled
#aws s3api put-bucket-encryption --bucket ${KOPS_CLUSTER_NAME} --server-side-encryption-configuration file://s3-encryption.json