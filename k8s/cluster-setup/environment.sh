#
# Sets up your environment for kubernetes
# -----------------------------------------------------
# Run like this '. environment.sh k8s.yourdomain.org'
# ------------------------------------------------------
#
export AWS_REGION=eu-central-1
export KOPS_CLUSTER_NAME=$1
export KOPS_STATE_STORE=s3://$KOPS_CLUSTER_NAME

# Check AWS
if ! [ -x "$(command -v aws)" ]; then
  echo 'Error: aws is not installed.' >&2
  exit 1
fi

# Check jq
if ! [ -x "$(command -v jq)" ]; then
  echo 'Error: jq is not installed.' >&2
  exit 1
fi

# Read Zones to string
ZONES=($(aws ec2 describe-availability-zones --region eu-central-1 | jq -r '.AvailabilityZones[].ZoneName'))
ZONE_STRING=""
for i in "${ZONES[@]}"
do ZONE_STRING+="${i},";
done

# Removes last character from string
export AWS_AVAILABILITY_ZONES=${ZONE_STRING%?}

echo ""
echo "AWS_REGION              : ${AWS_REGION}"
echo "AWS_AVAILABILITY_ZONES  : ${AWS_AVAILABILITY_ZONES}"
echo "KOPS_CLUSTER_NAME       : ${KOPS_CLUSTER_NAME}"
echo "KOPS_STATE_STORE        : ${KOPS_STATE_STORE}"
echo ""