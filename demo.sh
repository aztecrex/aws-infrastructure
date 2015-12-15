# source this into your shell

launch-demo-cluster() {
  template="file://$DEMO_ROOT/src/cloudformation/cf-containers.json"

  aws cloudformation create-stack \
    --stack-name demo-cluster \
    --template-body "$template"

}

update-demo-cluster() {
  template="file://$DEMO_ROOT/src/cloudformation/cf-containers.json"

  aws cloudformation update-stack \
    --stack-name demo-cluster \
    --template-body "$template"

}

show-demo-cluster() {
  aws cloudformation describe-stacks \
    --query 'Stacks[?StackName==`demo-cluster`]'
}

teardown-demo-cluster() {
  aws cloudformation delete-stack \
    --stack-name demo-cluster
}

launch-demo-service() {
  template="file://$DEMO_ROOT/src/cloudformation/cf-http-service.json"
  temp=$(aws cloudformation describe-stacks \
       --query 'Stacks[?StackName==`demo-cluster`] | [0].Outputs[?OutputKey==`Cluster`].OutputValue | [0]' )
  temp="${temp%\"}"
  temp="${temp#\"}"
  cluster=$temp
  aws cloudformation create-stack \
    --stack-name demo-service \
    --parameters ParameterKey=ClusterName,ParameterValue=$cluster \
    --template-body "$template"
}

teardown-demo-service() {
  aws cloudformation delete-stack --stack-name demo-service
}

show-demo-service() {
  aws cloudformation describe-stacks \
    --query 'Stacks[?StackName==`demo-service`]'
}

launch-demo-task() {
  template="file://$DEMO_ROOT/src/cloudformation/cf-one-shot.json"
  aws cloudformation create-stack \
    --stack-name demo-task \
    --template-body "$template"
}

show-demo-task() {
  aws cloudformation describe-stacks \
    --query 'Stacks[?StackName==`demo-task`]'
}

teardown-demo-task() {
  aws cloudformation delete-stack --stack-name demo-task
}


if [ "$DEMO_ROOT" = "" ]; then
  echo "DEMO_ROOT must be set before running demo-commands."
else
  echo "DEMO_ROOT is '$DEMO_ROOT'"
fi
