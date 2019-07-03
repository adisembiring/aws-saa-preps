# S3 HA

S3 Storage Classes
- Standard 
    - 99,9999% SLA Durable
    - 99.99% Available
    - Multiple AZ
    - 
- Inteligent Tiering (New 2018)
    - Automaticly move infrequent access to Lower class
    - 99,99999% SLA Dura
    - 99.99% Available  
    - if the file neeaded, it automaticlly moved to other system
- Standard I/A
    - Less frequent access but Rapid access when needed
    - 99,9999% SLA

- One Zone-IA
    - like backup copies, disaster recovery copies
    - something re-creatable
    - Data could be gone if the Zone is destructed
    - Availability: 99.5%
    - Durability: 99.99%
    
- Glaccier:
    - Long term archive
    - Slow to download

```
x-amz-storage-class: STANDARD_IA
Cache-Control: 
Content-Encoding: 
Content-MD5	
Content-Type	

x-amz-meta-: metad
x-amz-meta-author: Janet
```

## Storage Class Policy
the policy only able to set minimu 30 days STANDARD_IA or ONEZONE_IA 

## S3 Tips:
expire incomplete multipart uploads
multipart upload:
- ability to pause and resume
- imporve upload throughput
- Quick recovery from any network issues: if network broken, you can simply retry the small chunk
- begin upload any chunk without knowing which on completed



URL Format:
- https://adi-paywall-demo.s3-us-west-2.amazonaws.com/aptimize.html
- http://s3-aws-region.amazonaws.com/mynewbucket




# Elastic Load Blanacer
- HA and multi AZ
- Pair Auto Scalling to enhance HA and fault tolerant
- Health check to make sure target healty
- It owns DNS
- SSL/TLS termination and EC2 instance no needs to do Enc/Decr which CPU intensive
- Cross zone: enable LB accross multiple AZ

Two types of LB:
- Classic
    - Simple balancing traffic to EC2s
    - No rule routing (URL, Content Type, ETC)
    - TCP HTTP, SSL/HTTPS
- Application
    - Layer 7
    - route traffic rule to target group
        - content -> content store TG (instance 1, instance 2)
        - email -> delivery TG (instance1, instance 2)
    - Support ECS, EKS, WebSocket, Sticky Session, WAF
    - Get ELB
    
- Network
    - plain layer 4 TCP / UDP
    - extreme performance
    - No SLL offloading
    - Static IP address per AZ
    - It's not bottleneck 
    - Route traffic to IP Address

Statefull application:
- Sticky Sessions If we want to store information in the same EC2 instance
- Problem with sticky sessions it will impact no balance
- What happend if the EC2 instance down, their data will be lost
- Can't use auto scalling


ELB Errors:
- 504:  Web Server error

HA vs Fault Tolerant
- HA: The user still able to access the system even of a component system failure. Solve this by Multi AZ, but it still have a performance degradation problem.
- Fault Tolerant: Not only HA but it should not impact with performance degradation. Impement Extra redudancy, but problem is Cost.


# Auto scaling
- CI/CD Autoscaling pipeline
- Zero Downtime Autoscalling
- Zero downtime DB when upgrade
- Max 

## Cost affective Auto Scaling
- use Spot Instance as primary
- on demand as secondary
- 

## Autoscaling Termination Policy
- OldestInstance
- NewestInstance
- OldestLaunchConfiguration: This policy is useful when you're updating a group and phasing out the instances from a previous configuration.
- ClosestToNextInstanceHour: Good for cost 


# Foult Tolerant
- AWS Auto Recovery: if EC2 broken, It will be replaced with new instance
- Elastic IP: it can be mapped to the replacement instance

# FAQ:
Predictive Scaling: machine learning model deliver faster and accurate and low cost scaling

# CloudFront
Use cases:
- Good for frequent access static content
    - web images
    - videos
    - software dwonload
    


#