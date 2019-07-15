# Database 

# RDS
Types:
    - SQL           - MYSQ
    - Postgress     - Postgress         - Aurorra

DynamoDB and Redshift

## Backup 
Two backup types:
Automated
- scheduled 
- full dayly snapshot + transaction log
- to recover, choose the recent daily backup and apply relevant trans log to that day
- enabled by default
- max 35 days retention

Snapshot
- manually intervention

## instance types:
- General purpose: T3 (micro, xlarge, 2xlarge), M5
- Memory Optimize: R5 (db.r5.large	-> db.r5.24xlarge), (db.x1e.xlarge, db.x1e.32xlarge	)

## Restore
- it will create a new RDS instance with new DNS endpoint


## Multi AZ
- Sync Replication
- allows to have exact copy of DB in oter `AZ`.
- AWS handle replication
- it's a stand by DB for disaster replica not read replica DB
- When the DB instance down, RDS will automatically fail over to the standby instance
- It also good for instance upgrade with Zero Downtime
- max: 2 zones


## Read replicase
- Async Replication
- Can multiple AZ
- increase performance
- can be different region
- can be promoted as master
- should have automatic turn on
- 5 read replicas for 1 DB
- read replica can have other read replica
- read replica can be in multiple AZ
- No backup

## Encyrption
- KMS
- configured on creation
- automated backup, snapshot and read replicate also encprypted

## Write performance improvement
- `RAID 0`: Join multiple volumes and use avialable bandwith to write theses instance
- Increase EC2 size
- You can't use placement_group as it only used for inter service communication. 

## IAM Authentication
```
aws rds generate-db-auth-token \
   --hostname rdsmysql.cdgmuqiadpid.us-west-2.rds.amazonaws.com \
   --port 3306 \
   --region us-west-2 \
   --username jane_doe   

authToken = rdsmysql.cdgmuqiadpid.us-west-2.rds.amazonaws.com:3306/?Action=connect&DBUser=jane_doe&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Expires=900...

mysql --host=hostName --port=portNumber --ssl-ca=[full path]rds-combined-ca-bundle.pem --enable-cleartext-plugin --user=userName --password=authToken

```

## RDS Limitation
- RDS runs on VM
- Can't login
- Can't RDP / SSH
- Aurora Serverless

## Parameter Group
apply database-specific settings to all RDS in one-go. it's good for company who have multiple RDS and they want to staandardise.

## Aurora
- MySQL and Postgress compatible
- Start 10GB instance and and Increment 10GB
- 2 copies of data in each AZ, minimum 3 AZ = Total 6 copies
- 2 types of replica: Aurora and MySQL
- automatic backup turn on by default
- max 15 read replicas
- Backup don not DB performance, and also snapshot

## Aurora Performance Improvement
- `Custom endpoints`: somehow you need internal app that able to do read and write 

## Custom DB
- DB2 ??? => Setup the DB in EC2 instance and handle everything by yourself

# Elastic Cache
- memchanced: Simple and Can be scale horizontally
- Redis
    - Multi AZ
    - Backup / Restore Redis


# NoSQL
- Amazon Neptune: Graph
- Amazon DynamoDB: Key Value

# TODO
- update RDS with bigger instance size
- update RDS IOPS