#
# Cookbook Name:: ariane-scenarios-tradeworkflow
# Recipe:: feeder
#
# Copyright 2014, echinopsii
#
# All rights reserved - AGPLv3 licensed
#

include_recipe 'ariane-scenarios-tradeworkflow::java'
include_recipe 'ariane-scenarios-tradeworkflow::distrib'

template "/etc/init.d/feeder" do
  source "process.init.d.erb"
  mode   0744
  owner  "root"
  group  "root"
  variables({
              :processdesc => "Feeder Simulator",
              :processstartcmd => "/opt/ariane/scenarios/tradeworkflow/distrib/bin/feeder.sh",
              :processmainclass => "net.echinopsii.ariane.community.scenarios.tradeworkflow.feederapp.Feeder"
            })
end

service "feeder" do
  supports :status => true, :restart => false, :reload => false
  action [:enable, :start]
end

