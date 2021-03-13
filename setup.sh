#Stop and clean minikube
eval $(minikube docker-env -u)
minikube stop
minikube delete

#Linux setup
printf "user42\nuser42" | sudo -S chmod 666 /var/run/docker.sock
printf "user42\nuser42" | sudo usermod -aG docker $(whoami;)

#Start minikube
rm -rf /home/user42/.minikube/certs
minikube start --driver=docker --memory 4096
minikube addons enable dashboard

eval $(minikube docker-env)
sed -i -E "s/(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])/CLUSTERIP/" srcs/secret.yaml
sed -i -E "s/(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])/CLUSTERIP/g" srcs/MetalLB.yaml
grep -lr "value: " srcs/ | xargs sed -i  -E "s/value: (([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])/value: CLUSTERIP/g" 
export CLUSTERIP="$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address'| sed -n 2p)"
grep -lr "loadBalancerIP:" srcs/ | xargs sed -i -E "s/loadBalancer:.*/loadBalancer: ${CLUSTERIP}/"

grep -lr "value: CLUSTERIP" srcs/ | xargs sed -i -E "s/value: CLUSTERIP/value: ${CLUSTERIP}/"
sed -i "s/CLUSTERIP/$CLUSTERIP/g" srcs/secret.yaml
sed -i "s/CLUSTERIP/$CLUSTERIP/g" srcs/MetalLB.yaml

#Build Docker containers
eval $(minikube docker-env)
docker build -t ftps srcs/ftps/ --no-cache
docker build -t grafana srcs/grafana/ --no-cache
eval $(minikube docker-env)
docker build -t influxdb srcs/influxDB/ --no-cache
docker build -t mysql srcs/mysql/ --no-cache
eval $(minikube docker-env)
docker build -t nginx srcs/nginx/ --no-cache
docker build -t phpmyadmin srcs/phpmyadmin/ --no-cache
eval $(minikube docker-env)
docker build -t telegraf srcs/telegraf/ --no-cache
docker build -t wordpress srcs/wordpress/ --no-cache

#LoadBalancer
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

#Build pods
kubectl apply -f srcs/secret.yaml
kubectl apply -f srcs/MetalLB.yaml
kubectl apply -f srcs/ftps/ftps.yaml
kubectl apply -f srcs/grafana/grafana.yaml
kubectl apply -f srcs/telegraf/telegraf.yaml
kubectl apply -f srcs/influxDB/influxDB.yaml
kubectl apply -f srcs/mysql/mysql.yaml
kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml
kubectl apply -f srcs/wordpress/wordpress.yaml

sleep 3
minikube dashboard
#watch kubectl get all
