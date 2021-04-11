apt_update

package 'containerd' do
  action :upgrade
end

directory '/etc/containerd' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

cookbook_file '/etc/containerd/config.toml' do
  source 'containerd/config.toml'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

service 'containerd' do
  subscribes :reload, 'file[/etc/containerd/config.toml]', :immediately
end
