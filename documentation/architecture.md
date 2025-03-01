# Multi-Site Infrastructure Architecture
Overview
ProTechServices’ infrastructure is designed to provide high availability of critical IT services across two geographical sites. The architecture adopts an “active-active” approach where both sites are operational simultaneously, with full load balancing and redundancy.
Network Topology
Show Image
Components by Site

# Site 1

FW1: Primary OPNsense Firewall
SW1: Cisco IOSLv2 Switch for local switching
ADMIN: Site Administration VM
HAProxy: Load balancer for applications
Registry-Docker: Private Registry for Docker images
App1-1, App2-1: Containerized applications

# Site 2

FW2: Secondary OPNsense Firewall
SW2: Cisco IOSLv2 Switch for local switching
ADMIN1: Site Administration VM
HAProxy1: Load balancer for applications
CI-CD: Jenkins Server for continuous integration and deployment
App1-2, App2-2: Containerized applications

# Site Interconnection
The two sites are interconnected by a secure WAN, using OSPF for dynamic routing between the sites. This configuration ensures efficient communication and automatic redundancy in the event of a link failure. Network segmentation
Network segmentation is performed using VLANs to isolate different types of traffic and enhance security:

# Site 1

VLAN 10: Management (192.168.10.0/24)
VLAN 11: Services (192.168.11.0/24)
VLAN 12: Applications (192.168.12.0/24)

# Site 2

VLAN 20: Management (192.168.20.0/24)
VLAN 21: Services (192.168.21.0/24)
VLAN 22: Applications (192.168.22.0/24)

# High availability

High availability is ensured by several mechanisms:

Inter-site load balancing: HAProxy distributes traffic between the applications of the two sites
Automatic failover: In case of of a site failure, all traffic is redirected to the operational site
Proactive monitoring: Continuous monitoring of services to detect problems before they affect users
Replicated Docker Registry: Images are available on both sites for rapid deployment

# Data flow

User requests: Users access services via HAProxy load balancers
Application development: Developers publish code to the CI/CD server
CI/CD pipeline: Jenkins compiles, tests and deploys applications on both sites
Docker Registry: Stores Docker images used by different applications
Inter-site communications: Data is synchronized between sites via OSPF

# Security
The infrastructure implements several levels of security:

OPNsense firewalls: Filtering of incoming and outgoing traffic
VLAN segmentation: Isolation of different types of traffic
Zero-Trust Security: Systematic verification of access
SSH authentication: Secure access to servers
Encrypted communications: HTTPS for all external communications

# Scalability
The architecture is designed to evolve with the growth of the company:

Horizontal scalability: Easy addition of new containerized applications
Multi-site extension: Ability to add new sites following the same model
Elastic resources: Dynamic allocation of resources according to needs

# Technology dependencies

Cisco IOSLv2: Switching and VLANs
OPNsense: Firewall and routing
OSPF: Dynamic inter-site routing
Docker: Application containerization
HAProxy: Load balancing
Jenkins: CI/CD automation