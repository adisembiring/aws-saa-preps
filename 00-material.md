# Overview
- One year of hands-on experience designing high available, cost-efficient, fault-tolerant, and scalable distributed systems on AWS
- Hands-on experience using compute, networking, storage, and database AWS services

# Material
- AWS Architecting with The Cloud whitepaper
- AWS Well architect 

# References
Blueprint: https://d1.awsstatic.com/training-and-certification/docs-sa-assoc/AWS_Certified_Solutions_Architect_Associate_Feb_2018_%20Exam_Guide_v1.5.2.pdf
Material: https://tutorialsdojo.com/aws-auto-scaling/

# Next Step
Week 1: 
- summarize material from cloud guru
- 


aws cloudformation create-stack --stack-name adi-cf-stack \
    --template-body file://infra/backend.yaml --parameters \
    ParameterKey=ECSAmi,ParameterValue=us-east-1 \ 
    ParameterKey=KeyPairName,ParameterValue=adi-virginia-keypair



aws cloudformation create-stack \
  --stack-name adi-cf-stack \
  --template-body file://infra/backend.yaml


aws cloudformation create-stack --stack-name adi-cfstack-demo  \
    --template-body file://infra/backend.yaml \
    --parameters  ParameterKey=KeyName,ParameterValue=adi-virginia-keypair


aws cloudformation validate-template --template-body file://infra/backend.yaml
