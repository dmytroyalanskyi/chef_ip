Ohai.plugin(:K8s) do
  provides 'k8s', 'k8s/join_key', 'k8s/discovery_token_ca_cert_hash'

  collect_data do
    k8s Mash.new
    k8s[:discovery_token_ca_cert_hash] = shell_out("openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null |    openssl dgst -sha256 -hex | sed 's/^.* //'|tr -d '\n'").stdout
    k8s[:join_key] = shell_out("sudo kubeadm token list|grep default-node-token |awk '{print $1}'|head -n 1|tr -d '\n'").stdout
  end
end