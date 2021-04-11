resource_name :kubernetes
provides :kubernetes

property :name, String
property :default_network_cidr, String

action_class do
  def run_command(command)
    kubernetes = Mixlib::ShellOut.new(command)
    kubernetes.run_command
    kubernetes.stdout
  end
end

action :init do
  stdout = run_command("kubeadm init --pod-network-cidr #{new_resource.default_network_cidr}")
end

action :join do
  stdout = run_command("kubeadm join")
end
