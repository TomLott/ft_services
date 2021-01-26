#!/bin/bash

kubectl delete pods --all
kubectl delete deploy --all

docker build -t nginx_image nginx/

kubectl apply -f nginx.yaml
kubectl apply -f configmap.yaml

minikube dashboard