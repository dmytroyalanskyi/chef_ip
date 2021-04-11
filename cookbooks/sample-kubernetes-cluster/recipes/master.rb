cookbook_file '/etc/kubeadm-config.yaml' do
  source 'master/kubeadm-config.yaml'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

kubernetes 'init_cluster' do
  action :init
  cluster_init_conf '/etc/kubeadm-config.yaml'
end

default_admin_user = node[cookbook_name]['master']['default_admin_user']

directory "/home/#{default_admin_user}/.kube"

file "/home/#{default_admin_user}/.kube/config" do
  owner "#{default_admin_user}"
  group "#{default_admin_user}"
  mode '0600'
  content lazy { File.open('/etc/kubernetes/admin.conf').read }
  action :create
end

kubernetes 'network' do
  action :install_network_addon
  network_addon "#{node[cookbook_name]['master']['network_addon_url']}"
end

ohai 'reload' do
  action :reload
end

cookbook_file '/opt/chef/embedded/lib/ruby/gems/2.7.0/gems/ohai-16.13.0/lib/ohai/plugins/kubernetes.rb' do
  source 'ohai/kubernetes.rb'
  notifies :reload, 'ohai[reload]'
end
