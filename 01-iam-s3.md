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

Snowball
- Import S3
- Move large amount data to S3

## Storage Gateway
File Gateway 
- File gateway - for flat files, stored directly to s3

Volume Gateay
- Stored voumes: entired data set is stored on site and is asyhcournus backed up to S3
- Cached Volumes - Entier data set is stored on S3 and most freq acces data is cached on site

Gateway Virtual Tape Library
- Used for backup and uses popular backup applications like Net Backup

TODO S3 FAQ