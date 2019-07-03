# On Premise

## Active Directory
- Directory Service AD Connector: trusted relationship beetween AD-AWS Account
- Use IAM role mapping
- STS:AssumeRole


# S3
encryption in Transit
- SSL/TLS

Encryption at Rest (Server Side)
- S3 Managed key (SSE-S3)
- AWS key management service / Managed Keys (SSE-KMS)
- Server Encryption with Customer Privided Key (SSE-C)

Cros region replication
- regions must be unique
- versioning must be enabled both source and destination bucket
- delete individual version / delete markers will not be replicated

Lifecycle Policies
- automates moving your object between different storage tiers
- can be used with versioning
- can be applied to current version and previous version

- Ec2 - S3 network transfer cost is free if it in the same region

# S3 Event Notification
- Lambda
- SQS
- SNS   

## Storage Gateway
AWS Storage Gateway is a hybrid storage service that enables your on-premises applications to seamlessly use AWS cloud storage.

usages:
- backup and archiving, 
- disaster recovery, 
- cloud data processing, 
- storage tiering, and migration
- Encrypt by default


File Gateway 
- File gateway - for flat files, stored directly to s3
- Big data analytics, data processing, machine learning or cloud data migration workloads 


Gateway Virtual Tape Library (VTL)
- Used for backup and uses popular backup applications like Net Backup

Volume Gateay
- Cached Volumes - entire data set is stored on S3 and most freq acces data is cached on site
- Stored voumes: entired data set is stored on site and is asyhcournus backed up to S3

For low latency gateway:
- File Gateway
- Cached Volume Gateway
TODO S3 FAQ


# Glacier
- Encrypt by default

## Galcier retrieval options
- expedited: 1 - 5 minutes, purchase provisioned capacity if you dan't want inturuption during high load period
- standard (default): 3 - 5 hours
- bulk: 5 - 12 hours 

## Glacier Ranged Archive Retrievals
This is a query filter:
- Manage your data download: 24 hours, date time range window
- retrive targeted large file: fetch file that > 5GB


# Snowball
- Import S3
- Move large amount data to S3

## Standard Snowball (Snowball Device)
- 50 TB (42 TB) - US regions only	
- 80 TB (72 TB)	
- E Ink display – used to track shipping information and configure your IP address.	



## AWS Snowball Edge:
- LCD display – used to manage connections and provide some administrative functions.	
- shipping the data in the appliances through a regional carrier
- Snowball Edge
- 100 TB (83 TB)	
- 100 TB Clustered (45 TB per node)	