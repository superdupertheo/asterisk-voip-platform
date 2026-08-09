# Phase 3D --- `rtp.conf`

`rtp.conf` contains the **RTP media configuration** used by the Asterisk VoIP Platform.

It defines **the UDP port range Asterisk uses to carry voice audio between registered endpoints during calls**.

### Responsibilities

* Define the general RTP configuration.
* Set the starting RTP port to `10000`.
* Set the ending RTP port to `10100`.
* Limit Asterisk media traffic to the configured RTP port range.
* Enable strict RTP handling.
* Support voice traffic between registered SIP endpoints.

### Deliverables

* [ ] The RTP configuration loads successfully.
* [ ] RTP traffic starts at UDP port `10000`.
* [ ] RTP traffic ends at UDP port `10100`.
* [ ] Asterisk uses ports `10000-10100/udp` for media traffic.
* [ ] Strict RTP is enabled.
* [ ] RTP traffic matches the firewall and AWS security group configuration.
* [ ] Registered endpoints can successfully send and receive audio during calls.

### Why `strictrtp=yes`?

security feature , basically once we get the rtp (real time protocol) packets from our desired sources we don't want it from unknown sources


## Phase 3D Completion

Phase 3D is complete when **Asterisk successfully loads the RTP configuration and voice traffic can pass through the configured UDP port range of `10000-10100`**.

The completed configuration should allow **Asterisk to handle RTP media traffic for internal calls while keeping the media port range limited and consistent with the network and firewall configuration used throughout the project**.

