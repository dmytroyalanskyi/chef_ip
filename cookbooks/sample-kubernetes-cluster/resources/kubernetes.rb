resource_name :kubernetes
provides :kubernetes

property :cluster_init_conf, String
property :discovery_token_ca_cert_hash, String
property :master_ip, String
property :join_token, String
property :network_addon, String

action_class do
  def run_command(command)
    kubernetes = Mixlib::ShellOut.new(command)
    kubernetes.run_command
    kubernetes.stdout
  end
end

action :init do
  run_command("kubeadm init --config #{new_resource.cluster_init_conf}")
end

action :join do
  run_command(
    "sudo kubeadm join #{new_resource.master_ip}:6443 \
    --token #{new_resource.join_token} \
    --discovery-token-ca-cert-hash sha256:#{new_resource.discovery_token_ca_cert_hash}"
  )
end

action :install_network_addon do
  run_command(
    "kubectl apply -f #{new_resource.network_addon}"
  )
end
