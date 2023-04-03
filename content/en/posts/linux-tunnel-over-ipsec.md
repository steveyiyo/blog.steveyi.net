# Setting up IPSec Point-to-Point Tunnel in Linux Environment

Recently, I acquired a new server that requires IPSec encryption to be set up in its network environment. Otherwise, the GRE Tunnel packets will be visible.

To set up IPSec, run the following command in the Linux terminal:

```
apt install charon-systemd libcharon-extra-plugins libstrongswan-extra-plugins
```

This will install the necessary plugins for IPSec. The next step is to configure the IPSec tunnel, which involves setting up BGP and configuring the internet routing protocols.

Tags: IPSec, BGP, Internet.