#
# Cookbook Name:: ariane-scenarios-tradeworkflow
# Recipe:: java
#
# Copyright 2014, echinopsii
#
# All rights reserved - AGPLv3 licensed
#

node.set['java']['install_flavor'] = 'oracle'
node.set['java']['oracle']['accept_oracle_download_terms'] = true
node.set['java']['jdk_version'] = "7"
node.set['java']['set_default'] = true

include_recipe 'java'
