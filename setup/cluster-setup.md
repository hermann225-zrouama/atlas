[RKE server]
curl -sfL https://get.rke2.io | INSTALL_RKE2_TYPE=server sh -
systemctl enable rke2-server.service
systemctl start rke2-server.service
ln -s $(find /var/lib/rancher/rke2/data/ -name kubectl) /usr/local/bin/kubectl 
export KUBECONFIG=/etc/rancher/rke2/rke2.yaml
kubectl  get node

[RKE AGENT]
 curl -sfL https://get.rke2.io | INSTALL_RKE2_TYPE=agent sh -
 mkdir -p /etc/rancher/rke2/

 echo "server: https://$RANCHER1_IP:9345" > /etc/rancher/rke2/config.yaml

 # change the Token to the one from rancher1 /var/lib/rancher/rke2/server/node-token
 echo "token: $TOKEN" >> /etc/rancher/rke2/config.yaml

 systemctl enable rke2-agent.service
 systemctl start rke2-agent.service


[LONGHORN]
helm repo add longhorn https://charts.longhorn.io
helm repo update

[ARGO]
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml


DgHMJ24L559Csnad #amoaman
 v
FG82ajZrweH1Ty7B

[TRINO]
helm repo add trinodb https://trinodb.github.io/charts/
helm repo update
helm template presto trinodb/trino --namespace <namespace> > presto-manifests.yaml

[NESSIE]
helm repo add nessie-helm https://charts.projectnessie.org
helm repo update
helm template nessie nessie-helm/nessie --namespace lakehouse > nessie-manifests.yaml

[RANCHER]
curl -#L https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
helm repo add rancher-latest https://releases.rancher.com/server-charts/latest
helm repo add jetstack https://charts.jetstack.io

kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.6.1/cert-manager.crds.yaml
helm upgrade -i cert-manager jetstack/cert-manager --namespace cert-manager --create-namespace
helm upgrade -i rancher rancher-latest/rancher   --create-namespace --namespace cattle-system   --set hostname=147.79.114.72   --set bootstrapPassword=bootStrapAllTheThings   --set replicas=1   --set ingress.enabled=false

[CLICK HOUSE]
helm install clickchouse oci://registry-1.docker.io/bitnamicharts/clickhouse --namespace clickhouse
STnJ8hkwsB