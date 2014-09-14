#
# Cookbook Name:: ariane-scenarios-tradeworkflow
# Recipe:: frontoffice
#
# Copyright 2014, echinopsii
#
# All rights reserved - AGPLv3 licensed
#

include_recipe 'ariane-scenarios-tradeworkflow::java'
include_recipe 'ariane-scenarios-tradeworkflow::distrib'

template "/etc/init.d/frontoffice" do
  source "process.init.d.erb"
  mode   0744
  owner  "root"
  group  "root"
  variables({
              :processdesc => "FrontOffice Simulator",
              :processstartcmd => "/opt/ariane/scenarios/tradeworkflow/distrib/bin/frontoffice.sh",
              :processmainclass => "net.echinopsii.ariane.community.scenarios.tradeworkflow.frontapp.FrontOffice"
            })
end

service "frontoffice" do
  supports :status => true, :restart => false, :reload => false
  action [:enable, :start]
end
