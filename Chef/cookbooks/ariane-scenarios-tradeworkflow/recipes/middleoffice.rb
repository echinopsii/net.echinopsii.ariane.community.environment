#
# Cookbook Name:: ariane-scenarios-tradeworkflow
# Recipe:: middleoffice
#
# Copyright 2014, echinopsii
#
# All rights reserved - AGPLv3 licensed
#

include_recipe 'ariane-scenarios-tradeworkflow::java'
include_recipe 'ariane-scenarios-tradeworkflow::distrib'


template "/etc/init.d/middleoffice" do
  source "process.init.d.erb"
  mode   0744
  owner  "root"
  group  "root"
  variables({
              :processdesc => "MiddleOffice Simulator",
              :processstartcmd => "/opt/ariane/scenarios/tradeworkflow/distrib/bin/middleoffice.sh",
              :processmainclass => "net.echinopsii.ariane.community.scenarios.tradworkflow.moapp.MiddleOffice"
            })
end

service "middleoffice" do
  supports :status => true, :restart => false, :reload => false
  action [:enable, :start]
end
