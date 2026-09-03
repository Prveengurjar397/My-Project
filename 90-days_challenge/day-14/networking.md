# Day 14 --- Computer Networking for DevOps

## 1. What is Computer Networking?

A computer network is a group of connected devices that communicate and
exchange data with each other.

**Interview answer:** \> A computer network is a collection of connected
devices that communicate and exchange data using networking protocols.

------------------------------------------------------------------------

## 2. Internet

The Internet is a global interconnected network of networks. It connects
users, servers, data centers, cloud infrastructure and other devices.

``` text
Laptop → Router → ISP → Internet → Data Center/Server
```

### Physical Internet

The Internet depends on physical infrastructure such as:

-   Fiber-optic cables
-   Undersea cables
-   Routers
-   Switches
-   Data centers
-   Internet exchange infrastructure

Undersea fiber cables carry a large amount of international Internet
traffic.

------------------------------------------------------------------------

## 3. Data Center

A data center is a facility containing computing, storage and networking
infrastructure.

It can contain:

-   Servers
-   Storage
-   Switches
-   Routers
-   Firewalls
-   Load balancers
-   Power and cooling systems

------------------------------------------------------------------------

## 4. Packet

A packet is a unit of data transmitted across a network.

Large data is divided into smaller units so it can be transferred
efficiently.

``` text
Large Data
   ├── Packet 1
   ├── Packet 2
   ├── Packet 3
   └── Packet 4
```

------------------------------------------------------------------------

## 5. Latency, Bandwidth and Jitter

### Latency

Latency is the time taken for data to travel between two points.

Usually measured in milliseconds (ms).

### Bandwidth

Bandwidth is the maximum amount of data a network connection can
transfer per unit of time.

Examples:

``` text
100 Mbps
1 Gbps
10 Gbps
```

### Jitter

Jitter is the variation in packet delay.

Example:

``` text
Packet 1 → 20 ms
Packet 2 → 22 ms
Packet 3 → 50 ms
Packet 4 → 25 ms
```

### Latency vs Bandwidth

  -----------------------------------------------------------------------
  Latency                             Bandwidth
  ----------------------------------- -----------------------------------
  Time taken for data to travel       Amount of data transferable per
                                      unit time

  Usually measured in ms              Usually measured in Mbps/Gbps

  Lower is generally better           Higher is generally better
  -----------------------------------------------------------------------

------------------------------------------------------------------------

## 6. LAN, MAN and WAN

### LAN

Local Area Network. Covers a small area such as a home, office or lab.

### MAN

Metropolitan Area Network. Covers a larger area such as a city.

### WAN

Wide Area Network. Connects networks across large geographical areas.

------------------------------------------------------------------------

## 7. Router, Switch and Hub

### Router

A router connects different networks and forwards packets based on
destination IP addresses and routing information.

``` text
Private Network → Router → Internet
```

### Switch

A switch connects devices within a LAN and primarily forwards Ethernet
frames using MAC addresses.

### Hub

A hub sends incoming traffic to all connected ports. It is inefficient
compared with a switch and is largely obsolete in modern networks.

### Router vs Switch

  Router                        Switch
  ----------------------------- ------------------------------
  Connects different networks   Connects devices in a LAN
  Uses IP/routing information   Primarily uses MAC addresses
  Network layer focus           Data-link layer focus

------------------------------------------------------------------------

## 8. MAC Address

MAC stands for Media Access Control.

A MAC address is a link-layer identifier associated with a network
interface.

Example:

``` text
00:1A:2B:3C:4D:5E
```

It is mainly used for communication within the local network.

------------------------------------------------------------------------

## 9. IP Address

An IP address is a logical network address used to identify an
interface/address for network communication and routing.

Example:

``` text
192.168.1.10
```

### MAC vs IP

  MAC                             IP
  ------------------------------- -----------------------------------
  Link/Data-link layer            Network layer
  Used mainly on local networks   Used for routing between networks
  Interface identifier            Logical network address

------------------------------------------------------------------------

## 10. IPv4 and IPv6

### IPv4

IPv4 uses 32-bit addresses.

Example:

``` text
192.168.1.10
```

### IPv6

IPv6 uses 128-bit addresses.

Example:

``` text
2001:db8::1
```

IPv6 was introduced mainly to provide a much larger address space than
IPv4.

------------------------------------------------------------------------

## 11. Public IP and Private IP

### Private IPv4 ranges

``` text
10.0.0.0/8
172.16.0.0/12
192.168.0.0/16
```

Private IPs are used inside private networks and are not directly
routable on the public Internet.

A public IP can be Internet-routable subject to routing and security
controls.

------------------------------------------------------------------------

## 12. NAT

NAT stands for Network Address Translation.

NAT translates network addresses between networks. A common use is
allowing private hosts to access external networks using a public
address.

``` text
Private IP
10.0.0.10
    ↓
   NAT
    ↓
Public IP
    ↓
Internet
```

NAT also helps conserve IPv4 addresses.

------------------------------------------------------------------------

## 13. Subnetting

A subnet is a logical subdivision of an IP network.

Subnetting helps with:

-   Network organization
-   Isolation
-   Security
-   IP management
-   Routing

``` text
Large Network
    ├── Subnet A
    └── Subnet B
```

------------------------------------------------------------------------

## 14. CIDR

CIDR stands for Classless Inter-Domain Routing.

Example:

``` text
192.168.1.0/24
```

`/24` means 24 bits are used for the network prefix.

IPv4 has 32 bits:

``` text
32 - 24 = 8 host bits
2^8 = 256 total addresses
```

Common examples:

``` text
/16 → 65,536 total IPv4 addresses
/24 → 256 total IPv4 addresses
/30 → 4 total IPv4 addresses
```

### Network Address

For:

``` text
192.168.1.0/24
```

Network address:

``` text
192.168.1.0
```

### Broadcast Address

For a traditional IPv4 /24 subnet:

``` text
192.168.1.255
```

------------------------------------------------------------------------

## 15. DNS

DNS stands for Domain Name System.

DNS translates domain names into IP addresses.

``` text
google.com
     ↓
    DNS
     ↓
IP address
```

### DNS Resolution --- High Level

``` text
Browser/OS Cache
       ↓
DNS Resolver
       ↓
Root DNS
       ↓
TLD DNS
       ↓
Authoritative DNS
       ↓
IP Address
```

Caching can allow some of these steps to be skipped.

### DNS Resolver

A resolver receives DNS queries and finds the answer, often using cached
data or querying other DNS servers.

### Authoritative DNS Server

An authoritative server contains the authoritative DNS records for a
domain.

### DNS Cache

Caching stores DNS answers temporarily and reduces repeated DNS queries.

TTL controls how long a DNS answer may normally remain cached.

------------------------------------------------------------------------

## 16. DNS Record Types

### A Record

Maps a domain name to an IPv4 address.

``` text
example.com → 192.0.2.10
```

### AAAA Record

Maps a domain name to an IPv6 address.

### CNAME Record

Creates an alias from one domain name to another domain name.

### MX Record

Specifies mail servers for a domain.

------------------------------------------------------------------------

## 17. OSI Model

The OSI model is a conceptual seven-layer networking model.

``` text
7. Application
6. Presentation
5. Session
4. Transport
3. Network
2. Data Link
1. Physical
```

### Layer responsibilities

  Layer          Main responsibility
  -------------- -------------------------------------------------
  Application    Network services used by applications
  Presentation   Data representation, encryption, compression
  Session        Session management
  Transport      TCP/UDP and end-to-end transport
  Network        IP addressing and routing
  Data Link      Frames and MAC addressing
  Physical       Bits, signals, cables and physical transmission

Memory trick:

``` text
All People Seem To Need Data Processing
```

------------------------------------------------------------------------

## 18. TCP/IP Model

A common simplified TCP/IP model is:

``` text
Application
Transport
Internet
Network Access
```

It represents the protocol architecture used by the Internet.

------------------------------------------------------------------------

## 19. TCP

TCP stands for Transmission Control Protocol.

TCP is connection-oriented and provides reliable, ordered delivery.

Important features:

-   Connection-oriented
-   Reliable delivery
-   Ordered data
-   Acknowledgements
-   Retransmission
-   Flow and congestion control

------------------------------------------------------------------------

## 20. UDP

UDP stands for User Datagram Protocol.

UDP is connectionless and has lower protocol overhead than TCP.

It does not provide TCP-style guarantees for reliable, ordered delivery.

UDP is useful when low overhead and speed are important.

------------------------------------------------------------------------

## 21. TCP vs UDP

  -----------------------------------------------------------------------
  TCP                                 UDP
  ----------------------------------- -----------------------------------
  Connection-oriented                 Connectionless

  Reliable                            No TCP-style reliability guarantee

  Ordered delivery                    No ordering guarantee

  Higher overhead                     Lower overhead

  Common for HTTP/HTTPS, SSH          Common for DNS and real-time
                                      applications
  -----------------------------------------------------------------------

------------------------------------------------------------------------

## 22. TCP Three-Way Handshake

TCP establishes a connection using a three-way handshake.

``` text
Client                    Server

  SYN -------------------->

      <---------------- SYN-ACK

  ACK -------------------->
```

Steps:

1.  Client sends SYN.
2.  Server sends SYN-ACK.
3.  Client sends ACK.
4.  TCP connection is established.

------------------------------------------------------------------------

## 23. Ports

A port number identifies a network service/process endpoint on a host.

Example:

``` text
192.168.1.10:22
```

Here:

``` text
IP   = 192.168.1.10
Port = 22
```

### Common ports

    Port Common service
  ------ ----------------
      22 SSH
      25 SMTP
      53 DNS
      80 HTTP
     443 HTTPS
    3306 MySQL
    5432 PostgreSQL
    6379 Redis

A port number is a conventional service endpoint; it does not by itself
prove which software is running.

------------------------------------------------------------------------

## 24. HTTP

HTTP stands for Hypertext Transfer Protocol.

It is an application-layer protocol commonly used for web communication.

Default port:

``` text
80
```

Flow:

``` text
Client → HTTP Request → Server
Client ← HTTP Response ← Server
```

------------------------------------------------------------------------

## 25. HTTPS

HTTPS is HTTP protected using TLS.

Default port:

``` text
443
```

HTTPS provides:

-   Encryption/confidentiality
-   Server authentication
-   Integrity protection

------------------------------------------------------------------------

## 26. SSL/TLS

TLS stands for Transport Layer Security.

TLS protects communication between client and server.

It provides:

-   Confidentiality
-   Integrity
-   Authentication

SSL is the older predecessor of TLS. Modern secure connections use TLS.

------------------------------------------------------------------------

## 27. Firewall

A firewall controls network traffic using security rules.

Rules can consider:

-   Source
-   Destination
-   Protocol
-   Port
-   Direction

### Ingress

Incoming traffic.

``` text
Internet → Server
```

### Egress

Outgoing traffic.

``` text
Server → Internet
```

------------------------------------------------------------------------

# AWS / Cloud Networking

## 28. VPC

VPC stands for Virtual Private Cloud.

A VPC is an isolated virtual network in a cloud environment.

It can contain:

-   Subnets
-   Route tables
-   Internet Gateway
-   NAT Gateway
-   Security Groups
-   Network ACLs
-   Compute resources

------------------------------------------------------------------------

## 29. Public Subnet

A subnet is commonly considered public when its route table has a route
to an Internet Gateway and its resources have the appropriate public
addressing/configuration.

``` text
Public Subnet
      ↓
Internet Gateway
      ↓
Internet
```

------------------------------------------------------------------------

## 30. Private Subnet

A private subnet does not have a direct route to an Internet Gateway for
inbound Internet access.

Private resources can use a NAT Gateway for outbound Internet access
when required.

``` text
Private Server
      ↓
Private Subnet
      ↓
NAT Gateway
      ↓
Internet Gateway
      ↓
Internet
```

------------------------------------------------------------------------

## 31. Internet Gateway

An Internet Gateway provides a VPC with a path to and from the public
Internet, subject to routing and security configuration.

It is commonly used with public subnets.

------------------------------------------------------------------------

## 32. NAT Gateway

A NAT Gateway allows resources in a private subnet to initiate
connections to external networks such as the Internet without making
those resources directly Internet-reachable.

Typical architecture:

``` text
Private Subnet
      ↓
NAT Gateway
      ↓
Public Subnet
      ↓
Internet Gateway
      ↓
Internet
```

------------------------------------------------------------------------

## 33. Route Table

A route table contains rules that determine where network traffic should
be sent.

Example:

``` text
Destination       Target

10.0.0.0/16       local
0.0.0.0/0         Internet Gateway
```

`0.0.0.0/0` is the default IPv4 route.

------------------------------------------------------------------------

## 34. Routing

Routing is the process of selecting a path for packets from source to
destination.

``` text
Client → Router A → Router B → Server
```

Routers use routing information to make forwarding decisions.

------------------------------------------------------------------------

## 35. Security Group

An AWS Security Group acts as a virtual firewall for associated
resources such as EC2 instances.

Characteristics:

-   Stateful
-   Controls inbound and outbound traffic
-   Uses protocol, port and source/destination rules
-   Return traffic is automatically allowed for an established permitted
    connection

------------------------------------------------------------------------

## 36. Network ACL

A Network ACL is a subnet-level network access control mechanism.

Characteristics:

-   Stateless
-   Inbound and outbound rules
-   Rules evaluated in order
-   Supports explicit allow and deny rules

### Security Group vs NACL

  -----------------------------------------------------------------------
  Security Group                      NACL
  ----------------------------------- -----------------------------------
  Resource/ENI level                  Subnet level

  Stateful                            Stateless

  Allow rules                         Allow and deny rules

  Return traffic automatically        Return traffic must be explicitly
  handled for allowed connections     allowed
  -----------------------------------------------------------------------

------------------------------------------------------------------------

## 37. CDN

CDN stands for Content Delivery Network.

A CDN caches/distributes content closer to users through edge locations.

``` text
User → Nearby Edge → Origin
```

Benefits:

-   Lower latency
-   Faster content delivery
-   Reduced origin load
-   Better global performance

------------------------------------------------------------------------

## 38. Cache

A cache stores frequently requested data temporarily.

``` text
User
 ↓
CDN Cache
 ├── Cache Hit → Return content
 └── Cache Miss → Origin Server
```

------------------------------------------------------------------------

## 39. Region and Availability Zone

### Region

A geographic cloud area containing cloud infrastructure.

### Availability Zone

An isolated infrastructure location/group within a Region.

``` text
Region
 ├── AZ-1
 ├── AZ-2
 └── AZ-3
```

Multiple AZs can improve availability and resilience.

------------------------------------------------------------------------

## 40. Load Balancer

A Load Balancer distributes incoming traffic across multiple backend
targets.

``` text
              ┌→ Server 1
User → LB ────┼→ Server 2
              └→ Server 3
```

Benefits:

-   Traffic distribution
-   Scalability
-   High availability
-   Health checks
-   Better fault tolerance

------------------------------------------------------------------------

## 41. Reverse Proxy

A reverse proxy receives client requests on behalf of backend servers.

``` text
Client
  ↓
Reverse Proxy
  ↓
Backend Servers
```

A reverse proxy can provide:

-   Routing
-   TLS termination
-   Caching
-   Access control
-   Load balancing in some implementations

------------------------------------------------------------------------

## 42. Load Balancer vs Reverse Proxy

These concepts can overlap.

A load balancer primarily focuses on distributing traffic among multiple
targets.

A reverse proxy sits in front of backend servers and can perform
routing, caching, TLS termination and sometimes load balancing.

------------------------------------------------------------------------

# 43. What Happens When You Type google.com?

Simplified flow:

``` text
Browser
   ↓
DNS Cache
   ↓
DNS Resolver
   ↓
IP Address
   ↓
TCP Connection
   ↓
TCP 3-Way Handshake
   ↓
TLS Handshake
   ↓
HTTP Request
   ↓
Routers / Internet
   ↓
Server-side infrastructure
   ↓
HTTP Response
   ↓
Browser renders response
```

The real process can involve browser/OS caches, CDNs, proxies, load
balancers, multiple routers and other infrastructure.

------------------------------------------------------------------------

# 44. Practical Networking Commands

## IP address

``` bash
ip addr
hostname -I
```

## Routing table

``` bash
ip route
```

## Connectivity

``` bash
ping -c 4 google.com
```

## DNS

``` bash
nslookup google.com
dig google.com
```

## Listening ports

``` bash
ss -tuln
```

## HTTP/HTTPS

``` bash
curl -I https://google.com
```

## Network path

``` bash
traceroute google.com
```

------------------------------------------------------------------------

# 45. Practical Troubleshooting Flow

If an application is not reachable:

``` text
1. Is the machine running?
        ↓
2. Does it have an IP address?
        ↓
3. Is the network interface up?
        ↓
4. Is the route correct?
        ↓
5. Is DNS resolving?
        ↓
6. Is the required port listening?
        ↓
7. Is the firewall/security rule allowing traffic?
        ↓
8. Is the application healthy?
        ↓
9. Is the Load Balancer/Reverse Proxy configured correctly?
```

Useful commands:

``` bash
ip addr
ip route
ping
nslookup
dig
ss -tuln
curl
traceroute
```

------------------------------------------------------------------------

# 46. Day 14 Practical Tasks

## Task 1 --- Check IP

``` bash
hostname -I
ip addr
```

Identify your IP addresses.

## Task 2 --- Check Route

``` bash
ip route
```

Identify:

-   Default route
-   Gateway
-   Network interface

## Task 3 --- DNS

``` bash
nslookup google.com
dig google.com
```

Understand the returned IP information.

## Task 4 --- Internet

``` bash
ping -c 4 google.com
```

Observe latency and packet loss.

## Task 5 --- HTTP/HTTPS

``` bash
curl -I http://example.com
curl -I https://example.com
```

Compare the responses.

## Task 6 --- Ports

``` bash
ss -tuln
```

Identify listening TCP/UDP ports.

------------------------------------------------------------------------

# 47. Interview Answer Framework

For most networking questions, use this structure:

1.  **Definition** --- What is it?
2.  **Purpose** --- Why do we need it?
3.  **Working** --- How does it work?
4.  **Example** --- Give a simple example.
5.  **Practical** --- Explain how you used or checked it.

### Example: DNS

> DNS stands for Domain Name System. It is used to resolve domain names
> into IP addresses. When a user enters a domain name, the client checks
> available caches and queries a DNS resolver if required. The resolver
> finds the appropriate DNS answer and returns the IP address. The
> client can then communicate with the destination using that IP
> address. Practically, I can check DNS resolution using `nslookup` or
> `dig`.

------------------------------------------------------------------------

# 48. High-Priority Interview Questions

Practice these without notes:

1.  What is a computer network?
2.  What is the Internet?
3.  What is a packet?
4.  What is latency?
5.  What is bandwidth?
6.  Router vs Switch?
7.  Switch vs Hub?
8.  MAC address vs IP address?
9.  IPv4 vs IPv6?
10. Public IP vs Private IP?
11. What is NAT?
12. What is subnetting?
13. What is CIDR?
14. What does `/24` mean?
15. What is DNS?
16. Explain complete DNS resolution.
17. Explain A, AAAA, CNAME and MX records.
18. Explain the OSI model.
19. TCP vs UDP?
20. Explain TCP three-way handshake.
21. What is a port number?
22. What are ports 22, 53, 80 and 443?
23. HTTP vs HTTPS?
24. What is TLS?
25. What is a firewall?
26. Ingress vs Egress?
27. What is a VPC?
28. Public subnet vs Private subnet?
29. Internet Gateway vs NAT Gateway?
30. What is a route table?
31. Security Group vs NACL?
32. What is a CDN?
33. Region vs Availability Zone?
34. What is a Load Balancer?
35. What is a Reverse Proxy?
36. What happens when you type `google.com` in a browser?
37. A website is not opening. How would you troubleshoot it?
38. DNS works but the website does not. What will you check?
39. A port is not reachable. How will you troubleshoot it?

------------------------------------------------------------------------

# 49. Final Day 14 Goal

By the end of Day 14, you should be able to:

-   Explain the Internet at a high level.
-   Understand packets, latency, bandwidth and jitter.
-   Explain routers, switches and hubs.
-   Understand MAC and IP addressing.
-   Understand IPv4 and IPv6.
-   Understand public/private IP and NAT.
-   Understand subnetting and CIDR.
-   Explain DNS and common DNS records.
-   Explain OSI and TCP/IP models.
-   Explain TCP, UDP and the TCP three-way handshake.
-   Remember common networking ports.
-   Explain HTTP, HTTPS and TLS.
-   Understand firewall concepts.
-   Understand VPC, subnets, route tables, Internet Gateway and NAT
    Gateway.
-   Understand Security Groups and NACLs.
-   Understand CDN, Regions and Availability Zones.
-   Understand Load Balancers and Reverse Proxies.
-   Troubleshoot basic networking issues using Linux commands.
-   Explain the `google.com` request flow in an interview.

## Core Interview Formula

``` text
What is it?
   ↓
Why is it needed?
   ↓
How does it work?
   ↓
Example
   ↓
My practical experience
```

**Do not memorize every definition word-for-word. Understand the concept
and practice explaining it in simple English.**
