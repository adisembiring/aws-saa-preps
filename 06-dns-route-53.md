# DNS / Route 53
DNS Service
- Domain registration
- DNS Service: translate domain name to IP
- Health Check
- Failover to other resource (IP / S3 (service down / maintenance))
- It only accesible via AWS resource only

Zone Apex / Naked Domain / Root Domain

## Record Set
- instructon to match IP address
- Record Set Type:
    - A (Addresa): point domain to IPv4 Address
    - AAAA: point domain name to IPv6
    - CNAME ( Canonical Name ): point a domain to other host name
    - MX (mail exchange): use to route email

# Routing Policy
- Simple 
- Failover
- Geolocation
- Geoproximity
- latency
- multi value answer
- weight

# Certificate Manager Service:
- create request certificate 
- added domain name (adi2godev.com, *.adi2godev.com)
- verify registered cerificate in your DNS by added a CNAME record with cretificate)_id

# IAM Sertificate Store
used AWS CLI to import third party certificate to AWS Store