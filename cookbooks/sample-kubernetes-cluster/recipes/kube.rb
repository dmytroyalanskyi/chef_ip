
apt_repository 'kubernetes' do
    uri 'https://apt.kubernetes.io/'
    components ['main']
    key 'https://packages.cloud.google.com/apt/doc/apt-key.gpg'
    distribution 'kubernetes-xenial'
end



node[cookbook_name]['kube']['kube_packages'].each do |p, v|
    package p do
        version v
        action :install
    end
end

