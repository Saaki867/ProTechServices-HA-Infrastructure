# Infrastructure Security

Security Overview

ProTechServices infrastructure security is based on a defense-in-depth approach with multiple layers of protection:

# Network Segmentation

VLANs and Isolation
VLAN segmentation is a key element of the security strategy:
Site 1

VLAN 10: Management - Restricted administrative access
VLAN 11: Services - HAProxy, Docker Registry
VLAN 12: Applications - Application containers

Site 2

VLAN 20: Management - Restricted administrative access
VLAN 21: Services - HAProxy, CI/CD
VLAN 22: Applications - Application containers

This segmentation limits lateral propagation in the event of a system compromise.

# Firewall Configuration

OPNsense firewalls are configured according to the principle of least privilege:
Core firewall rules
Global rules

Block all traffic by default
Explicitly allow only necessary traffic
Log rejected login attempts

Management rules (VLAN 10, 20)

Inbound SSH access from specific IP addresses
Outbound access limited to necessary services

Services rules (VLAN 11, 21)

Inbound HTTP/HTTPS access for HAProxy
Communication between Docker Registry and CI/CD
Inbound SSH connection from Management VLANs

Applications rules (VLAN 12, 22)

Inbound communication only from HAProxy
Outbound access limited to Docker Registry
No direct access to the Internet

# Secure communications

TLS/SSL
All sensitive communications are encrypted:

HTTPS for external web services
TLS for inter-service communications
Securely generated and managed certificates