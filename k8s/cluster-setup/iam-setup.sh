#
# Sets up a new IAM role+user for kubernetes
# -----------------------------------------------------
# Run like this 'iam-setup.sh <your-iam-username>' or
# iam-setup.sh which will create a new user named kops
# ------------------------------------------------------
#
aws iam create-group --group-name kops

aws iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/AmazonEC2FullAccess --group-name kops
aws iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/AmazonRoute53FullAccess --group-name kops
aws iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess --group-name kops
aws iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/IAMFullAccess --group-name kops
aws iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/AmazonVPCFullAccess --group-name kops

if [ $# -eq 0 ]
  then
    echo "No arguments supplied, creating new user kops"
    # Add new user
    aws iam create-user --user-name kops
    aws iam add-user-to-group --user-name kops --group-name kops
    aws iam create-access-key --user-name kops
  else
    # Or assign to a user
    aws iam add-user-to-group --user-name $1 --group-name kops
fi