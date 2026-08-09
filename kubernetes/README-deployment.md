# Phase 4E --- `deployment.yml`

`deployment.yml` contains the **Kubernetes Deployment** used to run the Asterisk VoIP Platform inside the k3s cluster.

It defines **how the Asterisk container is deployed, configured, secured, monitored, connected to the host network, and provided with configuration and persistent storage**.

### Responsibilities

* Create the `asterisk` Deployment inside the `voip` namespace.
* Run one Asterisk Pod using `replicas: 1`.
* Use the `Recreate` deployment strategy.
* Run the Pod using the host network.
* Use `ClusterFirstWithHostNet` for DNS resolution.
* Pull the Asterisk container image from GHCR.
* Use the `ghcr-credentials` image pull Secret.
* Run the container as a non-root user.
* Prevent privilege escalation.
* Drop unnecessary Linux capabilities.
* Configure UDP port `5060` for SIP signaling.
* Configure the RTP UDP port range used for voice traffic.
* Define CPU and memory resource requests and limits.
* Configure readiness and liveness probes using the Asterisk CLI.
* Mount `pjsip.conf` from the `asterisk-pjsip-secret` Secret.
* Mount `extensions.conf` from the `asterisk-config` ConfigMap.
* Mount `rtp.conf` from the `asterisk-config` ConfigMap.
* Mount persistent Asterisk data from the `asterisk-data` PVC.
* Restart or replace the Asterisk Pod when required by Kubernetes.

### Deliverables

* [ ] The `asterisk` Deployment is created inside the `voip` namespace.
* [ ] One Asterisk replica is configured.
* [ ] The `Recreate` deployment strategy is configured.
* [ ] Host networking is enabled.
* [ ] The Asterisk container image is configured correctly.
* [ ] GHCR credentials can be used to pull the image.
* [ ] The container runs as a non-root user.
* [ ] Privilege escalation is disabled.
* [ ] Unnecessary Linux capabilities are dropped.
* [ ] SIP UDP port `5060` is configured.
* [ ] RTP UDP ports `10000-10100` are available for media traffic.
* [ ] CPU and memory requests are configured.
* [ ] CPU and memory limits are configured.
* [ ] The readiness probe successfully checks Asterisk.
* [ ] The liveness probe successfully checks Asterisk.
* [ ] `pjsip.conf` is mounted from the Kubernetes Secret.
* [ ] `extensions.conf` is mounted from the Kubernetes ConfigMap.
* [ ] `rtp.conf` is mounted from the Kubernetes ConfigMap.
* [ ] Persistent Asterisk storage is mounted from the PVC.
* [ ] The Asterisk Pod reaches the `Running` and `Ready` state.
* [ ] Asterisk successfully starts using the Kubernetes-provided configuration.

### Why `replicas: 1`?

we only want one asterisk pod running since this is just testing

### Why `hostNetwork: true`?

asterisk uses the kubernetes nodes network stack rather than using kubernetes internal IP , NAT can get messy and I would rather things not get complicated

### Why `dnsPolicy: ClusterFirstWithHostNet`?

even though the pod is using the host network

we want it to still get access to the kubernetes cluster DNS

sometimes DNS behavior can differ for host networked pods

### Why `SecurityContext`?

basically like in podman we want to make sure asterisk is ran with the user’s privileges and not in any form with root privileges

### Why `readinessProbe`?

form of a health check, showing the uptime, has it exited, what is the exit status, can the asterisk server recieve traffic

### Why `livenessProbe`?

the sister to readinessProve ,is asterisk still alive

### Why `asterisk-data`?

this is the persistent runtime data, in the context of asterisk this is used for things like voicemail, recordings, etc things that are pretty static and dont change


## Phase 4E Completion

Phase 4E is complete when **the Asterisk Deployment successfully creates a Pod in the `voip` namespace and the Pod reaches the `Running` and `Ready` state**.

The completed Deployment should run **Asterisk as a secured non-root container, load its configuration from Kubernetes Secrets and ConfigMaps, use persistent storage from the PVC, handle SIP and RTP traffic through the host network, and automatically recover the workload if the container becomes unhealthy**.

