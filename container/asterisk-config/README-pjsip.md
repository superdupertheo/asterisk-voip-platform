# Phase 3B --- `pjsip.conf`

`pjsip.conf` contains the **SIP endpoint, authentication, transport, and NAT configuration** used by Asterisk.

It defines **how softphones connect to the Asterisk server, authenticate with their extension credentials, and communicate using SIP over UDP**.

### Responsibilities

* Define the global PJSIP configuration.
* Configure the UDP transport on port `5060`.
* Listen for SIP traffic on all available network interfaces.
* Define authentication credentials for extension `1001`.
* Define authentication credentials for extension `1002`.
* Create Address of Record (AOR) configuration for each extension.
* Allow up to two registered devices for each extension.
* Remove old registrations when necessary.
* Define PJSIP endpoints for extensions `1001` and `1002`.
* Place registered endpoints in the `internal` dialplan context.
* Use the `ulaw` audio codec for calls.
* Disable direct media so RTP traffic passes through Asterisk.
* Enable symmetric RTP for NAT compatibility.
* Enable `force_rport` to correctly route SIP responses.
* Enable `rewrite_contact` to handle SIP clients connecting through NAT.

### Deliverables

* [ ] The global PJSIP configuration is defined.
* [ ] UDP transport is configured on `0.0.0.0:5060`.
* [ ] Extension `1001` has authentication credentials configured.
* [ ] Extension `1002` has authentication credentials configured.
* [ ] Extension `1001` has an AOR configured.
* [ ] Extension `1002` has an AOR configured.
* [ ] Each AOR supports up to two registered devices.
* [ ] Extension `1001` is configured as a PJSIP endpoint.
* [ ] Extension `1002` is configured as a PJSIP endpoint.
* [ ] Both endpoints use the `internal` dialplan context.
* [ ] Both endpoints allow the `ulaw` codec.
* [ ] Direct media is disabled.
* [ ] Symmetric RTP is enabled.
* [ ] `force_rport` is enabled.
* [ ] `rewrite_contact` is enabled.
* [ ] Softphones can successfully register extensions `1001` and `1002` with Asterisk.
* [ ] Registered extensions can communicate through the Asterisk server.


### Why `bind=0.0.0.0:5060`?

this allows on traffic on all interfaces and 5060 is the standard SIP port

### Why `1001-auth`?

when a softphone registers it would use the username and pw instead of certificates

### Why `max_contacts=2`?

this allows two registered devices, this allows us to register simultaneously for instance a laptop softphone and mobile softphone at the same time, if it were 1 only one device could stay logged in


## Phase 3B Completion

Phase 3B is complete when **Asterisk successfully loads the PJSIP configuration and softphones can authenticate and register using extensions `1001` and `1002`**.

The completed configuration should allow **SIP signaling over UDP port `5060`, authenticated endpoint registration, NAT-compatible communication, and internal calling between the configured extensions**.

