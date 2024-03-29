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
    - Suitable for not re-creatable object

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

How to setup LB:
- create two or more instances in different AZ
- select LB internet facing/not
- define port
- define target group: health check 

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

## Autoscaling: Cooldown
In Auto Scaling, the following statements are correct regarding the cooldown period:
- It ensures that the Auto Scaling group does not launch or terminate additional EC2 instances before the previous scaling activity takes effect.
- Its default value is 300 seconds.
- It is a configurable setting for your Auto Scaling group.


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
    

## Cloudfront: Private content
Use signed URLs for the following cases:
- You want to use an RTMP distribution. Signed cookies aren't supported for RTMP distributions.
- You want to restrict access to individual files, for example, an installation download for your application.
- Your users are using a client (for example, a custom HTTP client) that doesn't support cookies.

Use signed cookies for the following cases:
- You want to provide access to multiple restricted files, for example, all of the files for a video in HLS format or all of the files in the subscribers' area of a website.
-You don't want to change your current URLs.


## Cloudfront: Performance Improvement
- setup two origin group: 1: primary and 2: secondary, if primary return 504, it fail over to secondary
- Lambda@Edge to allow cloudfront delivery and execute customize content. ie: authentication, images based on country, etc.

## Cloudfront: S3 Changes and Versioning
To control the versions of files that are served from your distribution, you can either invalidate files or give them versioned file names. If you want to update your files frequently, AWS recommends that you primarily use file versioning for the following reasons:

-Versioning enables you to control which file a request returns even when the user has a version cached either locally or behind a corporate caching proxy. If you invalidate the file, the user might continue to see the old version until it expires from those caches.
-CloudFront access logs include the names of your files, so versioning makes it easier to analyze the results of file changes.
-Versioning provides a way to serve different versions of files to different users.
-Versioning simplifies rolling forward and back between file revisions.
-Versioning is less expensive. You still have to pay for CloudFront to transfer new versions of your files to edge locations, but you don't have to pay for invalidating files.
