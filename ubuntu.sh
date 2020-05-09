kubectl proxy --address 0.0.0.0 --accept-hosts ^/.*



sudo swapoff -a 

nano /etc/fstab

========================

sudo snap install canonical-livepatch
sudo canonical-livepatch enable cb4bd687a44444828fafc9500a316dbe

========================

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -


sudo add-apt-repository \
         "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"


sudo apt-get update


sudo apt list docker-ce -a


sudo apt-get install -y docker-ce


sudo systemctl start docker

sudo systemctl enable docker

sudo apt-mark hold docker-ce


cat > /etc/docker/daemon.json <<EOF
{ "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"},
  "storage-driver": "overlay2"}
EOF



mkdir -p /etc/systemd/system/docker.service.d
# Reiniciar o docker.
systemctl daemon-reload
systemctl restart docker
# Verificar a versão instalada
sudo docker version







reboot





======================




https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/



=============================



=============================
sudo apt-get update && sudo apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
=============================






curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -


cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF



sudo apt-get update


sudo apt-get install -y kubelet kubeadm kubectl


sudo apt-mark hold kubelet kubeadm kubectl



cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sudo sysctl --system




nano   /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
Environment=”cgroup-driver=systemd/cgroup-driver=cgroupfs”





systemctl restart docker
systemctl daemon-reload
systemctl restart kubelet


reboot

kubeadm init --apiserver-advertise-address=0.0.0.0 --pod-network-cidr=10.244.0.0/16  --ignore-preflight-errors=NumCPU


kubectl apply -n kube-system -f \
    "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 |tr -d '\n')"



  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config
  
  



[preflight] Reading configuration from the cluster...
[preflight] FYI: You can look at this config file with 'kubectl -n kube-system get cm kubeadm-config -oyaml'
[kubelet-start] Downloading configuration for the kubelet from the "kubelet-config-1.18" ConfigMap in the kube-system namespace
[kubelet-start] Writing kubelet configuration to file "/var/lib/kubelet/config.yaml"
[kubelet-start] Writing kubelet environment file with flags to file "/var/lib/kubelet/kubeadm-flags.env"
[kubelet-start] Starting the kubelet
[kubelet-start] Waiting for the kubelet to perform the TLS Bootstrap...

This node has joined the cluster:
* Certificate signing request was sent to apiserver and a response was received.
* The Kubelet was informed of the new secure connection details.

Run 'kubectl get nodes' on the control-plane to see this node join the cluster.

