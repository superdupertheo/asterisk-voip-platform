# Phase 4D --- `pvc.yaml`

`pvc.yaml` contains the **Kubernetes PersistentVolumeClaim** used to provide persistent storage to the Asterisk VoIP Platform.

It requests **persistent storage from the k3s `local-path` storage class so Asterisk data can remain available independently of the container lifecycle**.

### Responsibilities

* Create the `asterisk-data` PersistentVolumeClaim.
* Deploy the PVC into the `voip` namespace.
* Request `5Gi` of persistent storage.
* Use the k3s `local-path` storage class.
* Use the `ReadWriteOnce` access mode.
* Provide persistent storage to the Asterisk Deployment.
* Allow the Asterisk Pod to mount the requested storage.
* Keep Asterisk data separate from the container filesystem.
* Preserve stored data when the Asterisk container is recreated.

### Deliverables

* [ ] The `asterisk-data` PersistentVolumeClaim is defined.
* [ ] The PVC is created inside the `voip` namespace.
* [ ] `5Gi` of storage is requested.
* [ ] The `local-path` storage class is configured.
* [ ] The `ReadWriteOnce` access mode is configured.
* [ ] k3s successfully provisions storage for the claim.
* [ ] The PVC reaches the `Bound` state.
* [ ] The Asterisk Deployment can reference the PVC.
* [ ] The PVC can be mounted into the Asterisk container.
* [ ] Asterisk data persists when the container or Pod is recreated.

## Phase 4D Completion

Phase 4D is complete when **the `asterisk-data` PersistentVolumeClaim is successfully created and reaches the `Bound` state in the `voip` namespace**.

The completed PVC should provide **`5Gi` of persistent storage that can be mounted by the Asterisk Deployment, allowing application data to remain available even when the Asterisk Pod is recreated**.

