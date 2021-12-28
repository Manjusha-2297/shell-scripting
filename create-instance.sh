

LID="lt-0e4f7d924175204ce" # spot instance launch template id
LVR=2 # launch template version
INSTANCE_NAME=$1

if [ -z "${INSTANCE_NAME}" ]; then
  echo "Input is missing"
  exit 1
fi

aws ec2 describe-instances --filters "Name=tag:Name,Values=$INSTANCE_NAME" | jq .Reservations[].Instances[].State.Name | grep running &>/dev/null
if [ $? -eq 0 ]; then
  echo "Instance $INSTANCE_NAME is already running"
  exit 0
fi

IP=$(aws ec2 run-instances --launch-template LaunchTemplateId=$LID,Version=$LVR --tag-specifications "ResourceType=spot-instances-request,Tags=[{Key=Name,Value=$INSTANCE_NAME}]" "ResourceType=instance,Tags=[{Key=Name,Value=$INSTANCE_NAME}]" | jq .Instances[].PrivateIpAddress | sed -e 's/"//g')
# same name to the spot instance and normal instance also