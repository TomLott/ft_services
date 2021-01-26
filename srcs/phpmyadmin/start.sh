#!/bin/sh

kubectl delete phpmyadmin_deploy
kubectl delete svc phpmyadmin_svc
eval $(minikube docker-env)
docker build -t phpmyadmin_image .
kubectl apply -f ../phpmyadmin.yaml