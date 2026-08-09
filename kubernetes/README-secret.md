# Phase 4B --- `secret.example.yml`

`secret.example.yml` contains the **Kubernetes Secret template** used to provide the Asterisk PJSIP configuration to the Asterisk VoIP Platform.

It defines **the SIP endpoint configuration and authentication credentials required for extensions `1001` and `1002` while keeping those values separate from the main Kubernetes Deployment configuration**.

### Responsibilities

* Create the `asterisk-pjsip-secret` Kubernetes Secret.
* Deploy the Secret into the `voip` namespace.
* Store the Asterisk `pjsip.conf` configuration.
* Define authentication credentials for extension `1001`.
* Define authentication credentials for extension `1002`.
* Define the AOR configuration for each extension.
* Define the PJSIP endpoint configuration for each extension.
* Configure SIP transport over UDP port `5060`.
* Provide the PJSIP configuration to the Asterisk container.
* Keep real SIP passwords out of the example configuration committed to the repository.
* Provide placeholder passwords that must be replaced before deployment.

### Deliverables

* [ ] The `asterisk-pjsip-secret` Secret is defined.
* [ ] The Secret is created inside the `voip` namespace.
* [ ] `pjsip.conf` is stored in the Secret.
* [ ] Extension `1001` authentication is configured.
* [ ] Extension `1002` authentication is configured.
* [ ] Placeholder passwords are replaced before deployment.
* [ ] Real SIP passwords are not committed to the Git repository.
* [ ] The Asterisk Deployment can reference the Secret.
* [ ] `pjsip.conf` can be mounted into `/etc/asterisk/pjsip.conf`.
* [ ] Asterisk can load the mounted PJSIP configuration.
* [ ] Softphones can authenticate using the configured extension credentials.

### Why secrets specifically for Asterisk and not FFmpeg?

Asterisk uses a username and password needed to connect and its preferred if someone pulled the image they have everything except my pws


## Phase 4B Completion

Phase 4B is complete when **a deployment copy of the Secret is created with strong SIP passwords, applied to the `voip` namespace, and successfully mounted into the Asterisk container as `pjsip.conf`**.

The completed Secret should allow **Asterisk to authenticate extensions `1001` and `1002` without storing the real SIP passwords directly in the example manifest committed to the repository**.

