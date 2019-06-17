validate: 
	aws cloudformation validate-template --template-body file://infra/backend.yaml

create:
	aws cloudformation create-stack --stack-name adi-cfstack-demo  \
		--template-body file://infra/backend.yaml \
		--parameters  ParameterKey=KeyName,ParameterValue=adi-virginia-keypair
