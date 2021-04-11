default['sample-kubernetes-cluster']['base_packages']['base_packages_list'] = %w(apt-transport-https curl)
default['sample-kubernetes-cluster']['kernel']['enabled_params'] = [ 'net.ipv4.ip_forward', 'net.bridge.bridge-nf-call-ip6tables', 'net.bridge.bridge-nf-call-iptables']
default['sample-kubernetes-cluster']['kernel']['load_modules'] = %w(overlay br_netfilter)
default['sample-kubernetes-cluster']['kube']['kube_packages'] = { 'kubelet' => '1.20.1-00', 'kubeadm' => '1.20.1-00', 'kubectl' => '1.20.1-00' }

default['sample-kubernetes-cluster']['master']['default_network_cidr'] = '192.168.0.0/16'
