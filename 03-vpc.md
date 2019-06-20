VPC
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

Custom VPC by deafult create following resources:
- Access Control List
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
- 1 NAC -> Many Subnets. 1 Subnets -> 1 NACL
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

```
outbound-bound rule
```
Rule    Type              Protocol   Port         Source            Allow / Deny
100     All TCP           TCP        1024 - 65535 0.0.0.0/0         Allow
110     DNS (UDP)         UDP        80           0.0.0.0/0         Allow
120     DNS (UDP)         UDP        443          0.0.0.0/0         Allow
120     DNS (UDP)         UDP        3633         0.0.0.0/0         Allow
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
- Interface Endpoints
- Gateways Endpoint



TODO: 
- What is Network Interface?
- Read VPC -> VPN
- Create your own VPN in AWS
- create VPC -> Create ec2 instance without public ip -> assign public IP to the instance
- Subnet basic , CIDR

