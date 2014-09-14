require 'chef-init'

node_name                   ChefInit.node_name
chef_server_url             'https://chef.lab.prod.dekatonshivr.echinopsii.net:443'
validation_client_name      'chef-validator'
validation_key              '/etc/chef/secure/validation.pem'
client_key                  '/etc/chef/secure/client.pem'
trusted_certs_dir           '/etc/chef/secure/trusted_certs'
ssl_verify_mode             :verify_peer
