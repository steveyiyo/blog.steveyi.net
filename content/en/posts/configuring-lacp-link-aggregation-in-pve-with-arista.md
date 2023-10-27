---
title: "PVE Configuration of Arista LACP Link Aggregation"
author: "SteveYi"
date: 2023-02-07T02:39:05+08:00
draft: false
---

Recently, we encountered a machine using two NVIDIA Mellanox ConnectX-4 network cards, with maximum speed support of 25G. However, since our optical module is only 10G, and Arista 7050QX also cannot support 25G Only, we decided to set up LACP.

## Environment

- Arista 7050QX-32S
- Proxmox VE
    - ovs-vsctl (Open vSwitch) 2.15.0

## LACP Configuration on Arista

This is divided into two steps:

- Establish a Port Channel
- Assign Port Channel to physical network cards

***
Note: Keep the `switchport` part as is, and remember to set up both Port Channel and Ethernet Interface on both ends.
***

### Create a Port Channel on Arista

```shell
interface Port-Channel1001
   description PVE-N1-LACP
   switchport mode trunk
```

### Assign Channel Group to Ethernet Interface

It is better to set it to Active rather than Passive here to prevent LACP neighbor from failing to establish.

```shell
interface Ethernet7/1
   description PVE-N1-P0(R)
   switchport mode trunk
   channel-group 1001 mode active
!
interface Ethernet8/1
   description PVE-N1-P1(L)
   switchport mode trunk
   channel-group 1001 mode active
```

## LACP Configuration on PVE

There are two methods on PVE, which are:

- Linux Bond
- OVS Bond

> In this article, we will demonstrate using OVS Bond.

### Install Open vSwitch

Enter PVE Shell and enter the following command to install.

```shell
sudo apt install openvswitch-switch -y
```

### Configure the Interface Card

*Note: Linux Bridge and OVS cannot be used together!*

1. First, create an OVS Bridge

![](https://i.imgur.com/PRJDx2A.png)

2. Create an OVS Bond

Select LACP (balance-tcp) for Mode, and fill in the name of the physical network card in Slaves and bind it to the newly created OVS Bridge. If the network card is not in Trunk Mode, you can write the VLAN ID here or specify it when creating a VM.

![](https://i.imgur.com/7fvU2gd.png)

> If you want to learn more about OVS Bonding, you can refer to [Hwchiu](https://www.hwchiu.com/)'s [Understanding the OpenvSwitch Bonding](https://www.hwchiu.com/openvswitch-bonding.html).

3. Create OVS IntPort (optional)

If you need to access the PVE panel through this LACP network card, you need to set the VLAN or Native VLAN card here.

![](https://i.imgur.com/yqPhGCm.png)

After everything is done, click Apply Configuration. At this point, the system will use the command `ifreload --all` to restart the entire PVE Host network and establish an LACP connection.

If everything is normal, LACP can be used normally~

## Results

There are mainly two types here:
1. LACP status
2. Speed test results

### Check LACP status

Arista

```shell
core#show interfaces Port-Channel 1001
Port-Channel1001 is up, line protocol is up (connected)
  Hardware is Port-Channel, address is 7483.ef49.cfda
  Description: PVE-N1-LACP
  Ethernet MTU 9214 bytes, BW 20000000 kbit
  Full-duplex, 20Gb/s
  Active members in this channel: 2
  ... Ethernet7/1 , Full-duplex, 10Gb/s
  ... Ethernet8/1 , Full-duplex, 10Gb/s
  Fallback mode is: off
  Up 2 days, 10 hours, 21 minutes, 6 seconds
  4 link status changes since last clear
  Last clearing of "show interface" counters never
  5 minutes input rate 324 kbps (0.0% with framing overhead), 200 packets/sec
  5 minutes output rate 582 kbps (0.0% with framing overhead), 496 packets/sec
     913814733 packets input, 1101680299997 bytes
     Received 52458 broadcasts, 61239 multicast
     0 input errors, 0 input discards
     1430249790 packets output, 1734991390380 bytes
     Sent 13679583 broadcasts, 5532412 multicast
     0 output errors, 1235 output discards
```

PVE

```shell
root@node2:~# ovs-appctl bond/list
bond    type    recircID        members
bond0   balance-tcp     1       ens20f1np1, ens20f0np0
root@node2:~# ovs-appctl bond/show bond0
---- bond0 ----
bond_mode: balance-tcp
bond may use recirculation: yes, Recirc-ID : 1
bond-hash-basis: 0
lb_output action: disabled, bond-id: -1
updelay: 0 ms
downdelay: 0 ms
next rebalance: 7952 ms
lacp_status: negotiated
lacp_fallback_ab: false
active-backup primary: <none>
active member mac: b8:59:9f:ab:ff:89(ens20f1np1)

member ens20f0np0: enabled
  may_enable: true
  hash 1: 1 kB load
  hash 2: 1 kB load
  hash 8: 5 kB load
  hash 15: 3 kB load
  hash 42: 1 kB load
  hash 45: 1 kB load
  hash 46: 1 kB load
  hash 49: 1 kB load
  hash 56: 1 kB load
  hash 63: 2 kB load
  hash 65: 1 kB load
  hash 70: 1 kB load
  hash 72: 1 kB load
  hash 84: 2 kB load
  hash 90: 4 kB load
  hash 99: 3 kB load
  hash 102: 32 kB load
  hash 105: 36 kB load
  hash 108: 33 kB load
  hash 111: 30 kB load
  hash 118: 13 kB load
  hash 122: 1 kB load
  hash 127: 8 kB load
  hash 135: 1 kB load
  hash 142: 2 kB load
  hash 151: 1 kB load
  hash 155: 30 kB load
  hash 169: 1 kB load
  hash 172: 5 kB load
  hash 176: 2 kB load
  hash 178: 3 kB load
  hash 184: 3 kB load
  hash 195: 3 kB load
  hash 204: 5 kB load
  hash 205: 1 kB load
  hash 207: 1 kB load
  hash 208: 6 kB load
  hash 210: 3 kB load
  hash 215: 1 kB load
  hash 235: 1 kB load
  hash 244: 30 kB load
  hash 247: 1 kB load
  hash 254: 3 kB load

member ens20f1np1: enabled
  active member
  may_enable: true
  hash 3: 2 kB load
  hash 13: 1 kB load
  hash 21: 10 kB load
  hash 27: 1 kB load
  hash 32: 3 kB load
  hash 34: 2 kB load
  hash 40: 20 kB load
  hash 60: 40
