# SQS

## Messages
- DelaySeconds: this will be hiddens in certain seconds by other consumer
- VisiblityTimeout: this will be hiddens by other consumers in certain time

## LongPooling
- ReceiveMaxWaitTimeSeconds: long pooling

# Kinesis Fire Horse
- load streaming data to data stores and analytics tools
- it capture streaming data and load it to:
    - S3
    - Redshift
    - ES
    - Splunk
    
# Athena
Amazon Athena is an interactive query service that makes it easy to analyze data in Amazon S3 using standard SQL

# AWS Resource  Name
Amazon Resource Names (ARNs) uniquely identify AWS resources. We require an ARN when you need to specify a resource unambiguously across all of AWS, such as in IAM policies, Amazon Relational Database Service (Amazon RDS) tags, and API calls.

# Redshift
## Backup
- create snapshot, set retention period and s3 bucket
- you can also enable multiple region backup

## Redshift Performance
When you create a parameter group, the default WLM configuration contains one queue that can run up to five queries concurrently


# AWS Glue
AWS Glue is a fully managed extract, transform, and load (ETL) service that makes it easy for customers to prepare and load their data for analytics. You can create and run an ETL job with a few clicks in the AWS Management Console


# AWS Work Space / Main Frame
Amazon WorkSpaces is a managed, secure cloud desktop service. You can use Amazon WorkSpaces to provision either Windows or Linux desktops in just a few minutes and quickly scale to provide thousands of desktops to workers across the globe


# Billing
## AWS Budget
AWS Budgets gives you the ability to set custom budgets that alert you when your costs or usage exceed (or are forecasted to exceed) your budgeted amount.

Budgets can be tracked at the monthly, quarterly, or yearly level, and you can customize the start and end dates. You can further refine your budget to track costs associated with multiple dimensions, such as AWS service, linked account, tag, and others. Budget alerts can be sent via email and/or Amazon Simple Notification Service (SNS) topic.

