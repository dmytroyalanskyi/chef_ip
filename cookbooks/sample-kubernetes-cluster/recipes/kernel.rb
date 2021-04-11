node[cookbook_name]['kernel']['load_modules'].each do |m|
  kernel_module m do
    action :install
  end
end

node[cookbook_name]['kernel']['enabled_params'].each do |p|
  sysctl p do
    value '1'
    action :apply
  end
end
