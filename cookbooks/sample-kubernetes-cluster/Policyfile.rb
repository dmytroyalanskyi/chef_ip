# Policyfile.rb - Describe how you want Chef Infra Client to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile/

# A name that describes what the system you're building with Chef does.
name 'sample-kubernetes-cluster'

# Where to find external cookbooks:
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list 'sample-kubernetes-cluster::default'
run_list 'sample-kubernetes-cluster::base_packages'
run_list 'sample-kubernetes-cluster::kernel'
run_list 'sample-kubernetes-cluster::containerd'
run_list 'sample-kubernetes-cluster::kube'
# Specify a custom source for a single cookbook:
cookbook 'sample-kubernetes-cluster', path: '.'
