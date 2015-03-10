#
# Cookbook Name:: ariane-scenarios-tradeworkflow
# Recipe:: rabbitmq
#
# Copyright 2014, echinopsii
#
# All rights reserved - AGPLv3 licensed
#

node.set['rabbitmq']['enabled_plugins'] = ['amqp_client','mochiweb','webmachine','rabbitmq_amqp1_0','rabbitmq_web_dispatch','rabbitmq_management_agent','rabbitmq_management','rabbitmq_management_visualiser','rabbitmq_federation','rabbitmq_federation_management','rabbitmq_mqtt','rabbitmq_shovel','rabbitmq_shovel_management','rabbitmq_stomp','rabbitmq_test','rabbitmq_tracing']

node.set['rabbitmq']['cluster'] = true
node.set['rabbitmq']['erlang_cookie'] = 'ariane-community-scenarios-tradeflow-rabbitmq-cluster'
node.default['rabbitmq']['kernel']['inet_dist_listen_min'] = 44001
node.default['rabbitmq']['kernel']['inet_dist_listen_max'] = 44001
node.default['rabbitmq']['loopback_users'] = []

include_recipe 'rabbitmq'
include_recipe 'rabbitmq::plugin_management'
include_recipe 'rabbitmq::user_management'

rabbitmq_user "admin" do
  password "sekret"
  action :add
end

rabbitmq_user "admin" do
  permissions ".* .* .*"
  action :set_permissions
end

rabbitmq_user "admin" do
  tag "administrator"
  action :set_tags
end

#rabbitmq_user "guest" do
#  action :delete
#end

