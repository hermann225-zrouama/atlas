# Sur le master
$ kubeadm token create --print-join-command

# Sur le worker
$ sudo kubeadm join 192.168.64.23:6443 --token wotn8x.uk3hidfu5hvmuvtg --discovery-token-ca-cert-hash sha256:c65dc2e05433c82b46fff1d8ea52059eb8feb6a7cfa2f8e7596997e3bc164925