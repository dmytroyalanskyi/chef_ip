cookbook_file 'cgroup_config' do
  source 'master/kubeadm-config.yaml'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

ohai "reload" do
  action :reload
end

cookbook_file '#{node[:ohai][:plugin_path]}/kubernetes.rb' do
  source 'ohai/kubernetes.rb'
  notifies :reload, "ohai[reload]"
end

kubernetes 'init_cluster' do
  action :init
  default_network_cidr node[cookbook_name]['master']['default_network_cidr']
end

