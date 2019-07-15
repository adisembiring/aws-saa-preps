# VPC

```
________________________________________________________________________________________________________________
                                                                                                                |
----------------------------------------    |   |       |          |       |                                    | 
                                            |   |       |          |       |                                    |
     ( instances )                          |   |       |          |       |                                    |
     Security Group                         |   |       |          | Route |                                    |
                                            |   |       |          | Table |______________                      |
                                            |   |       |          |       |              |                     |   
                                            |   |       |          |       |              |                     |
                           NAT Gateway      |   |       |          |       |        |-----------|               |
----------------------------------------    |   |   N   |          |_______|        |           |               |
                            |   |               |   A   |                           |   Router  |           Internet 
                            |   |               |   C   |                           |           |            Gateway   
----------------------------------------    |   |   L   |           ________        |           |               |
                                            |   |       |          |       |        |___________|               |
                                            |   |       |          |       |               |                    |
                                            |   |       |          |       |               |                    |    
                                            |   |       |          | Route | ______________|                    |
                                            |   |       |          | Table |                                    |
    ( instances )                           |   |       |          |       |                                    |
    Security Group                          |   |       |          |       |                                    |
----------------------------------------    |   |       |          |       |                                    |
                                                                                                                |
________________________________________________________________________________________________________________|
```

Custom VPC by deafult create following resources:
- Network Access Control List
- Route Table
- Security Group

Limitation:
- 1 internet gateway per VPC
- 5 IGWs per region
- 5 VPC per region
- By default custom vpc can talk to any vpc in the same AZ.
- By default custom vpc can talk to any vpc in the same AZ because Security group also open .


# NACL
Security group vs NACL
- NAcl: additional security layer on VPC
- Security Group: Firewall in the instance level.
- you need associate NACL with Subnet
- If want to block specific IP Address, you need to use NACL.
- 1 NACL -> Many Subnets. 1 Subnets -> 1 NACL
- The rule is evaluate in order based on order number
- stateless

## Default NACL
- it will create a default NACL at VPC creation, it allow all traffic by default
- creating custom NACL, by default it deny all inbound/outbound traffic

## NACL Rule
in-bound rule
```
Rule    Type              Protocol   Port         Source            Allow / Deny
100     MS SQL            TCP        1433         192.168.0.0/16    Allow  
110     RDP               TCP        3389         192.168.0.0/16    Allow  
110     DNS (UDP)         UDP        53           0.0.0.0/0         Allow      
110     RDP               TCP        3389         10.0.5.0/24       Deny
100     MS SQL            TCP        1433         192.168.1.22/32    Allow

# 192.168.1.22/32 this is only allow specific IP not entire network

```
outbound-bound rule
```
Rule    Type              Protocol   Port         Source            Allow / Deny
100     All TCP           TCP        1024 - 65535 0.0.0.0/0         Allow
110     DNS (UDP)         UDP        80           0.0.0.0/0         Allow
120     DNS (UDP)         UDP        443          0.0.0.0/0         Allow
120     DNS (UDP)         UDP        3633         0.0.0.0/0         Allow
```

# Security Group
- inbound traffic blocked by default
- outbound traffic allowd
- Change security group affect immediately
- EC2 instance can have multiple security group
- It operates at instance level not VPC
- Security Group can have multiple EC2 ( many - many )
- Statefull
- In traffic allowd then out traffic are allowed too
- You can't block specific IP Address
- There is no Deny Rule

in-bound rule
```
Type              Protocol   Port         Source  
MS SQL            TCP        1433         192.168.0.0/16  
RDP               TCP        3389         192.168.0.0/16  
DNS (UDP)         UDP        53           0.0.0.0/0  
RDP               TCP        3389         10.0.5.0/24  
```
outbound-bound rule
```
Type              Protocol   Port         Source  
All TCP           TCP        0 - 65535    0.0.0.0/0  
DNS (UDP)         UDP        53           0.0.0.0/0
```

# VPC Flow Log
- Capture information about IP Traffic going to/from network interface in your VPC
- It storeed in Amazon Cloudwatch Log

Flow Log Creation:
- VPC
- Subnet
- Network Interface Level

Limitation:
- Unable flow log that VPC peer
- Unable to tag flow log
- after the creation, you can't mondify 

Not all IP Traffic is monitored
- Traffic go to Amazon DNS
- instace metadata
- Windows License activation
- DHCP traffic

# VPC Endpoint
- enable us to privately connect AWS service via Private Link without IGW, NAT Device, VPN, or Direct COnnect.
- the traffic in AWS resources does not leave AMAZON network
- it's a virtual devices, HA, 

VPC Endpoint Types:
- Interface Endpoints: 
An interface endpoint is an elastic network interface with a private IP address that serves as an entry point for traffic destined to a supported service. The following services are supported.

- Gateways Endpoint
A gateway endpoint is a gateway that is a target for a specified route in your route table, used for traffic destined to a supported AWS service. The following AWS services are supported:
    - S3
    - DynamoDB

# VPC and VPN
## scnario #1: Private Subnet Only and AWS Site-to-Site VPN Access
This is required when you want to extens your AWS system without exposing your private network to the world
- Attach VPG to VPC
- VPC Router -> Virtual Private Gateway
- VPG -> Do connection via VPN Connection -> on-premise Customer Gateway
- Customer Gateway: VPN Hardware / Software  on premise network

## scnario #2: VPC with Public and Private Subnets and AWS Site-to-Site VPN Access

TODO: 
- What is Network Interface?
- Read VPC -> VPN
- Create your own VPN in AWS
- create VPC -> Create ec2 instance without public ip -> assign public IP to the instance
- Subnet basic , CIDR


# CIDR Calculation
Rule:
- allowed subnet max a/16 - a/28
- AWS reserved 4 IPs

given: - CIDR Block `/27`
question: total available `ips`?
answer: 
```
CONST MAX_BLOCK = 32
CONST RESERVED_IP = 4
const n = MAX_BLOCK - 27
        = 5

const total_ips = (2 ^ 5) - RESERVED_IP
                = 32 - 4
                = 28
``` 


# Elastic Network Interface
An elastic network interface (ENI) is a logical networking component in a VPC that represents a virtual network card.
3 ways to attach ENI to EC2:
- hot attach: when instance running
- warm attach: instance stop
- cold attach: instance is being launched

# Elastic IP Address
Types:
- Amazon Pool
- Owned By me

Pricing: 
- Free if it only 1
- normally it used for NAT

# Access private resource from AWS Lambda
- Select VPC
- Select subnets, idealy you should select multiple subnets to improve lambda network latency though your resources. if there no sufficient ENI on subnet, it can't scale the process and it will throw `EC2ThrottledException`