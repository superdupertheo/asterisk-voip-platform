# Phase 4A --- `namespace.yaml`

`namespace.yaml` contains the **Kubernetes Namespace configuration** used by the Asterisk VoIP Platform.

It creates the `voip` namespace that is used to organize and separate the Asterisk Kubernetes resources from other workloads running inside the k3s cluster.

### Responsibilities

* Create the `voip` Kubernetes namespace.
* Provide a dedicated namespace for the Asterisk workload.
* Group Asterisk Kubernetes resources together.
* Keep the VoIP resources separated from other workloads in the cluster.
* Apply the `app.kubernetes.io/part-of` label to identify the resources as part of the Asterisk platform.
* Provide the namespace used by the Asterisk Deployment, ConfigMap, Secret, and PersistentVolumeClaim.

### Deliverables

* [ ] The `voip` namespace is defined.
* [ ] The namespace is created successfully in k3s.
* [ ] The `app.kubernetes.io/part-of: asterisk-platform` label is applied.
* [ ] Asterisk Kubernetes resources can be deployed into the `voip` namespace.
* [ ] The namespace can be verified using `kubectl get namespaces`.
* [ ] Resources inside the namespace can be viewed using `kubectl get all -n voip`.

### Why `app.kubernetes.io/part-of`?

this is a kubernetes best practice

basically saying this object belongs to a larger application


## Phase 4A Completion

Phase 4A is complete when **the `voip` namespace is successfully created in the k3s cluster and is ready to contain the Kubernetes resources required by the Asterisk platform**.

The completed namespace should provide **a dedicated location for organizing and managing the Asterisk Deployment, configuration, credentials, and persistent storage resources**.

