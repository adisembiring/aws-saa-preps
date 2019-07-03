# EC2 monitoring

## Default Monitoring
- CPU utilisation
- CPU Credit Usage / Balance
- Network In/OUt
- Status Check
- Instance Store iOPS
- T2 Credit balance
- running process

# Custom EC2 Monitoring
- averange memory


# RDS Monitoring
- Metrics:  
    - CPU Utilization
    - DB Connection
    - Free storage
    - Free memory
    - CPU Credit Usage / Balance
    - Write/Read IOPS

- It gathers metrics from HiperV for DB instances


# RDS Enahnced Monitoring
- Amazon RDS provides metrics in real time for the operating system (OS) that your DB instance runs on
- identify operating system issue
- it gather metrics from CloudWatch agents in the EC2 instances
- its good to get info for process and thread of DB instances
- Child process, OS Process, 


# Security
https://aws.amazon.com/waf/faq/

## WAF
- AWS WAF is a web application firewall that helps protect web applications from attacks by allowing you to configure rules that allow, block, or monitor (count) web requests based on conditions that you define
- IP Address
- HTTP Headers
- HTTP body
- SQL injection
- CROSS Site scripting

### HOW
- Attach WAF rule to ELB or Cloud Front
- XSS cross site scripting

## SHIELD
- AWS Shield is a managed service that provides protection against Distributed Denial of Service (DDoS) attacks for applications running on AWS
- AWS Shield Standard is automatically enabled to all AWS customers at no additional cost

AWS Shield Standard
- Layer 3/4 attach: UDP Flood
- 


AWS Shield Advanced
- protected Amazon EC2, Elastic Load Balancing (ELB), Amazon CloudFront, AWS Global Accelerator, and Route 53 resources against more sophisticated and larger attacks
=


# AWS Support
Types:
- Developer
    - 24 hours general guidences
    - 12 hours for system impered

- Business
    - Production system impaired: 4 hours
    - 1 hours prod system down
    - Arch Guidences: Contextual to your use-cases


- Enterprise
    - Business-critical system down: < 15 minutes
    - Consultative review and guidance based on your applications
