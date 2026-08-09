# Phase 3 --- Podman Asterisk Container Image

This directory contains the **Containerfile and Asterisk configuration files** used to build the container image for the **Asterisk VoIP Platform**.

Podman is responsible for building the OCI container image that runs the Asterisk PBX application. The image uses Debian 12 Slim as the base, installs Asterisk and Tini, copies the required Asterisk configuration files, prepares the required runtime directories, and runs the Asterisk service as a non-root user.

This phase receives the **Rocky Linux server configured by Ansible in Phase 2** and prepares the container image that will later be deployed through k3s using the Kubernetes manifests.

## Phase 3 Deliverables

* [ ] `Containerfile` defines the Asterisk container image.
* [ ] `asterisk-config/extensions.conf` defines the internal Asterisk dialplan.
* [ ] `asterisk-config/pjsip.conf` defines the SIP endpoints and authentication configuration.
* [ ] `asterisk-config/rtp.conf` defines the RTP media port range.
* [ ] Debian 12 Slim is used as the base image.
* [ ] Asterisk and Tini are installed successfully.
* [ ] Required Asterisk directories are created with the correct ownership.
* [ ] The container runs as the non-root `asterisk` user.
* [ ] SIP UDP port `5060` is exposed.
* [ ] RTP UDP ports `10000-10100` are exposed.
* [ ] The Podman image builds successfully.
* [ ] The completed image starts Asterisk successfully.

---

# Phase 3A --- `Containerfile`

`Containerfile` contains the instructions Podman uses to build the Asterisk container image.

It defines **the operating system, packages, configuration files, permissions, networking, and startup command required to run Asterisk inside the container**.

### Responsibilities

* Use `debian:12-slim` as the container base image.
* Add OCI metadata describing the Asterisk image.
* Install the `asterisk` package.
* Install `tini` as the container init process.
* Remove unnecessary APT package data after installation.
* Copy `extensions.conf` into `/etc/asterisk/`.
* Copy `pjsip.conf` into `/etc/asterisk/`.
* Copy `rtp.conf` into `/etc/asterisk/`.
* Create the required Asterisk runtime directories.
* Assign the Asterisk files and directories to the `asterisk` user.
* Run the container as the non-root `asterisk` user.
* Expose the SIP and RTP UDP ports.
* Use Tini as the container entrypoint.
* Start Asterisk in the foreground so it remains attached to the container process.

### Deliverables

* [ ] The Debian 12 Slim base image is pulled successfully.
* [ ] Asterisk and Tini install successfully.
* [ ] Asterisk configuration files are copied into the image.
* [ ] `/var/lib/asterisk` is created.
* [ ] `/var/log/asterisk` is created.
* [ ] `/var/spool/asterisk` is created.
* [ ] Asterisk configuration and runtime directories have the correct ownership.
* [ ] The container switches to the `asterisk` user before startup.
* [ ] UDP port `5060` is exposed for SIP signaling.
* [ ] UDP ports `10000-10100` are exposed for RTP media.
* [ ] Tini launches as PID 1.
* [ ] Asterisk starts successfully in the foreground.

### Why Debian?

1. container image author chooses the base image
2. has a large package repo, very common in container ecosystems so alot of support think docker vs podman, yes both can achieve the same things one is just used by more people so you can always find support much more

### Why `DEBIAN_FRONTEND`?

similar to what we did in ansible we want to stop much of the interactive prompts since this is automation and we want it to just flow

### Why `/etc` folder?

this is a linux practice, remember debian is still a linux os in itself and the practice still remains configuration files go here

### Why `USER asterisk`?

not specifying asterisk automatically defaults to root and for security purposes if an attacker compromised the container they would have much more limited permissions of the asterisk user rather than container root

## Phase 3 Completion

Phase 3 is complete when **Podman** can successfully build the Asterisk container image and the resulting container can start Asterisk using the required configuration, permissions, SIP port, and RTP port range.

```bash
podman build -t asterisk-voip:1.0.0 -f container/Containerfile container/

podman images

podman run --rm \
  --name asterisk-test \
  asterisk-voip:1.0.0

podman image inspect asterisk-voip:1.0.0
```

The resulting image should be **small, reproducible, configured to run Asterisk as a non-root user, capable of handling SIP and RTP traffic, and ready to be tagged and deployed through Kubernetes in the next phase**.

