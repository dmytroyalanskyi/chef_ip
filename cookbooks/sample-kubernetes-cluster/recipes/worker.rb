#search(:node, 'role:k8s-master') do |n|
#  master_node_ip = n['ipaddress']
#  master_join_key = n['k8s']['join_key']
#  discovery_token_ca_cert_hash = n['k8s']['discovery_token_ca_cert_hash']
#end

#String master_node_ip = search(:node, 'role:k8s-master')['ipaddress']
#master_join_key = search(:node, 'role:k8s-master')['k8s']['join_key']
#discovery_token_ca_cert_hash = search(:node, 'role:k8s-master')['k8s']['discovery_token_ca_cert_hash']

master = search(:node, 'role:k8s-master').first

kubernetes 'join_worker' do
  action :join
  master_ip master['ipaddress']
  join_token master['k8s']['join_key']
  discovery_token_ca_cert_hash master['k8s']['discovery_token_ca_cert_hash']
end
