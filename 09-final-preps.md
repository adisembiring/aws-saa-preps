My Background, I am a Software Developer. I've been using AWS to deploy our system at my current company.
I also cleared up my AWS Developer Associate last month June 2019. 

Preperations: 
- Watch AWS SAA from Cloud Guru and did all the lab
- I also did lab from Linux Academy
- Read FAQ related to AWS common services (EC2, Cloudfront, ELB etc)
- Jon Boso practice test


Labs to do:
-  VPC 
    - create VPC private, public, nat gateway, bastion host, ELB
    - setup security group and NACL
- Route 53:
    - create new domain
    - try all routing (weigth, geo, failover )
    - point the domain to ELB
- ELB and Auto scaling:
    - create ELB 
    - setup TLS /  HTTPS
    - setup TLS / HTTPS for multiple domains to the same LB
    - Scheduled Scaling
    - Dynamic Scaling

- Cloudfront:
    - setup cloudfront with multiple origins: Load balancer, On-premise IP, S3
    - Create private content and include TTL in the private content
    - Serve different content based on user location ie: US, UK, AU, Japan
    - Ensure the viewer get the latest updated content
    - Cache invalidation

- RDS: 
    - Create RDS with multi AZ
    - Try Read replica
    - RDS Aurora with multiple endpoints
    - RDS SSL Connection


- S3
    - Setup bucket policy to move S3 object to different S3 class (glacier, IA, One Zone IA)
    - S3 encryption
    - Versioning
    - Cross region replication


- Log and Monitoring:
    - LB request monitoring
    - RDS: Ehanced monitoring
    - EC2: monitoring
    - Setup alarm and alerts in CloudWatch and send it to email


- Backup:
    - DynamoDB Backup and schedule backup
    - EBS backup, scheduleed backup and cross region backup
    - Redshift cluster backup, scheduleed backup and cross region backup