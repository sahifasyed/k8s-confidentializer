# Brownfield Conversion Checklist

1. Inventory: List services, images, secrets, and dependencies.
2. Security Requirements: Identify data sensitivity and required confidentiality guarantees.
3. Runtime selection: Choose gVisor, Kata, or provider-specific confidential VMs.
4. Compatibility testing: Ensure syscalls used by app are supported under sandbox runtime.
5. Networking: Validate CNI behavior and pod-to-pod encryption.
6. Storage and secrets: Use sealed secrets, provider KMS for keys.
7. Attestation: Define what attestation is required (TPM, cloud provider attestation).
8. Performance testing: Measure overhead and latency.
9. Deployment: Use RuntimeClass, node labels and taints to schedule confidential workloads.
10. Monitoring & Logging: Ensure logs are protected and encrypted end-to-end.

Notes: Cloud provider differences (AWS Nitro, Azure DCAP, GCP Confidential VMs) require extra provider-specific steps.
