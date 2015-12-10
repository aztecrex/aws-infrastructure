# source this into your shell

launch-demo-cluster() {
  template="file://$DEMO_ROOT/src/cloudformation/cf-containers.json"

  aws cloudformation create-stack \
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

if [ "$DEMO_ROOT" = "" ]; then
  echo "DEMO_ROOT must be set before running demo-commands."
else
  echo "DEMO_ROOT is '$DEMO_ROOT'"
fi
