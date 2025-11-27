#!/usr/bin/env bash
set -e
echo "Building images..."
docker build -t api:latest ./app/api
docker build -t frontend:latest ./app/frontend
echo "Loading images into kind..."
kind load docker-image api:latest
kind load docker-image frontend:latest
kubectl apply -f k8s/namespace.yaml
kubectl apply -f k8s/runtimeclass-gvisor.yaml || true
kubectl apply -f k8s/runtimeclass-kata.yaml || true
kubectl apply -f k8s/redis-deployment.yaml
kubectl apply -f k8s/api-deployment.yaml
kubectl apply -f k8s/frontend-deployment.yaml
kubectl apply -f k8s/service-all.yaml
echo "Deployed. Port-forward svc/frontend 8080:80 -n confidential to access the frontend."
