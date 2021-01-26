#!/bin/bash

minikube start --vm-driver=virtualbox
eval $(minikube docker-env)
minikube addons enable metallb

kubectl apply -f srcs/configmap.yaml
kubectl apply -f srcs/volume.yaml

docker build -t nginx_image srcs/nginx/
kubectl apply -f srcs/nginx.yaml

docker build -t mysql_image srcs/mysql/
kubectl apply -f srcs/mysql.yaml

docker build -t wordpress_image srcs/wordpress/
kubectl apply -f srcs/wordpress.yaml

docker build -t grafana_image srcs/grafana/
kubectl apply -f srcs/grafana.yaml

docker build -t influxdb_image srcs/influxdb/
kubectl apply -f srcs/influxdb.yaml

docker build -t phpmyadmin_image srcs/phpmyadmin/
kubectl apply -f srcs/phpmyadmin.yaml

docker build -t ftps_image srcs/ftps/
kubectl apply -f srcs/ftps.yaml

minikube dashboard
