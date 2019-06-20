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

## Restore
- it will create a new RDS instance with new DNS endpoint


## Multi AZ
- allows to have exact copy of DB in oter `AZ`.
- AWS handle replication
- it's a stand by DB for disaster replica not read replica DB
- When the DB instance down, RDS will automatically fail over to the standby instance
- It also good for instance upgrade with Zero Downtime


## Read replicase
- Can multiple AZ
- increase performance
- can be different region
- can be promoted as master
- should have automatic turn on
- 5 read replicas for 1 DB
- read replica can have other read replica
- read replica can be in multiple AZ
- 

## Encyrption
- KMS
- configured on creation
- automated backup, snapshot and read replicate also encprypted

## Aurora
- MySQL and Postgress compatible
- Start 10GB instance and and Increment 10GB
- 2 copies of data in each AZ, minimum 3 AZ = Total 6 copies
- 2 types of replica: Aurora and MySQL
- automatic backup turn on by default
- max 15 read replicas
- Backup don not DB performance, and also snapshot

## NoSQL
- Amazon Neptune: Graph
- Amazon DynamoDB: Key Value

## Limitation
- RDS runs on VM
- Can't login
- Can't RDP / SSH
- Aurora Serverless

## Custom DB
- DB2 ??? => Setup the DB in EC2 instance and handle everything by yourself

# Elastic Cache
- memchanced: Simple and Can be scale horizontally
- Redis
    - Multi AZ
    - Backup / Restore Redis


# TODO
- update RDS with bigger instance size
- update RDS IOPS