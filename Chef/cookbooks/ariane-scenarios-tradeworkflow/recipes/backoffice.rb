#
# Cookbook Name:: ariane-scenarios-tradeworkflow
# Recipe:: backoffice
#
# Copyright 2014, echinopsii
#
# All rights reserved - AGPLv3 licensed
#

include_recipe 'ariane-scenarios-tradeworkflow::java'
include_recipe 'ariane-scenarios-tradeworkflow::distrib'

template "/etc/init.d/backoffice" do 
  source "process.init.d.erb"
  mode   0744
  owner  "root"
  group  "root"
  variables({
              :processdesc => "BackOffice Simulator",
              :processstartcmd => "/opt/ariane/scenarios/tradeworkflow/distrib/bin/backoffice.sh",
              :processmainclass => "net.echinopsii.ariane.community.scenarios.tradeworkflow.boapp.BackOffice"
            }) 
end

service "backoffice" do
  supports :status => true, :restart => false, :reload => false
  action [:enable, :start]
end
