#
# Cookbook Name:: ariane-scenarios-tradeworkflow
# Recipe:: risk
#
# Copyright 2014, echinopsii
#
# All rights reserved - AGPLv3 licensed
#

include_recipe 'ariane-scenarios-tradeworkflow::java'
include_recipe 'ariane-scenarios-tradeworkflow::distrib'


template "/etc/init.d/risk" do
  source "process.init.d.erb"
  mode   0744
  owner  "root"
  group  "root"
  variables({
              :processdesc => "Risk Simulator",
              :processstartcmd => "/opt/ariane/scenarios/tradeworkflow/distrib/bin/risk.sh",
              :processmainclass => "net.echinopsii.ariane.community.scenarios.tradeworkflow.riskapp.Risk"
            })
end

service "risk" do
  supports :status => true, :restart => false, :reload => false
  action [:enable, :start]
end
