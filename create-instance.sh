

LID="lt-0e4f7d924175204ce" # spot instance launch template id
LVR=2 # launch template version

aws ec2 run-instances --launch-template LaunchTemplateId=$LID Version=$LVR | jq.Instances[].InstanceId