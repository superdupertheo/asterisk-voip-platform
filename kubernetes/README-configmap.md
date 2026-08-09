# Phase 4C --- `configmap.yaml`

`configmap.yaml` contains the **Kubernetes ConfigMap** used to provide the non-sensitive Asterisk configuration files to the Asterisk VoIP Platform.

It stores the **dialplan and RTP configuration separately from the container image**, allowing Kubernetes to provide the configuration to the Asterisk container when the workload is deployed.

### Responsibilities

* Create the `asterisk-config` Kubernetes ConfigMap.
* Deploy the ConfigMap into the `voip` namespace.
* Store the `extensions.conf` dialplan configuration.
* Store the `rtp.conf` media configuration.
* Define internal call routing for extensions `1001` and `1002`.
* Configure extension `600` for the Asterisk Echo test.
* Configure extension `700` for the `hello-world` audio test.
* Define the RTP UDP port range as `10000-10100`.
* Enable strict RTP handling.
* Provide the configuration files to the Asterisk Deployment.
* Keep non-sensitive configuration separate from authentication credentials.

### Deliverables

* [ ] The `asterisk-config` ConfigMap is defined.
* [ ] The ConfigMap is created inside the `voip` namespace.
* [ ] `extensions.conf` is stored in the ConfigMap.
* [ ] `rtp.conf` is stored in the ConfigMap.
* [ ] Internal routing for extensions `1001` and `1002` is configured.
* [ ] Extension `600` provides the Echo test.
* [ ] Extension `700` provides the `hello-world` playback test.
* [ ] RTP ports `10000-10100` are configured.
* [ ] Strict RTP is enabled.
* [ ] The Asterisk Deployment can reference the ConfigMap.
* [ ] `extensions.conf` can be mounted into `/etc/asterisk/extensions.conf`.
* [ ] `rtp.conf` can be mounted into `/etc/asterisk/rtp.conf`.
* [ ] Asterisk successfully loads the mounted configuration files.

### Why is `extensions.conf` stored here?

contains no sensitive data unlike pjsip.conf

just general settings and dialplan(describing how the call should be acted out)


## Phase 4C Completion

Phase 4C is complete when **the `asterisk-config` ConfigMap is successfully created in the `voip` namespace and the Asterisk container can load the provided dialplan and RTP configuration**.

The completed ConfigMap should allow **the Asterisk configuration to be managed through Kubernetes without rebuilding the container image whenever the dialplan or RTP settings need to be changed**.

