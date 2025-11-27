#!/usr/bin/env bash
set -e
CLUSTER_NAME=confidential-kind
echo "Deleting existing cluster (if any)..."
kind delete cluster --name $CLUSTER_NAME || true
echo "Creating kind cluster: $CLUSTER_NAME"
kind create cluster --name $CLUSTER_NAME --config=- <<EOF
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
  extraMounts:
  - hostPath: /var/lib/docker
    containerPath: /var/lib/docker
EOF
echo "Kind cluster created: $CLUSTER_NAME"
echo "Note: To use runsc (gVisor) or kata you must install and configure them on the host." 
