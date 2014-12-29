#
# Cookbook Name:: ariane-scenarios-tradeworkflow
# Recipe:: distrib
#
# Copyright 2014, echinopsii
#
# All rights reserved - AGPLv3 licensed
#

include_recipe 'java'

directory "/opt/ariane/scenarios/tradeworkflow" do
	recursive true
	owner "root"
	group "root"
	mode 00755
	action :create
end

%w[ /opt /opt/ariane /opt/ariane/scenarios ].each do |path|
  directory path do
    recursive true
    owner "root"
    group "root"
    mode 00755
  end
end

remote_file "/opt/ariane/scenarios/tradeworkflow/net.echinopsii.ariane.community.scenarios.distrib-0.2.0.zip" do
  source "http://nexus.echinopsii.net/nexus/content/groups/public/net/echinopsii/ariane/community/scenarios/net.echinopsii.ariane.community.scenarios.distrib/0.2.0/net.echinopsii.ariane.community.scenarios.distrib-0.2.0.zip"
end

package "zip" do
	action :install
end

execute "unzip_distrib" do
	cwd '/opt/ariane/scenarios/tradeworkflow/'
	command 'unzip -n net.echinopsii.ariane.community.scenarios.distrib-0.2.0.zip'
end

execute "rm_zip" do
	cwd "/opt/ariane/scenarios/tradeworkflow/"
	command "rm net.echinopsii.ariane.community.scenarios.distrib-0.2.0.zip"
end

#%w[ backoffice.properties feeder.properties frontoffice.properties middleoffice.properties risk.properties ].each do |conffile|
#	execute "sed_conf" do
#		cwd '/opt/ariane/scenarios/tradeworkflow/distrib/conf'
#TODO: #{conffile} return nothing - check why later, I'm tired now...
#		command 'sed -i "s/localhost/172.17.42.1/g" ./#{conffile}'
#	end
#end

execute "sed_rbmq_bo" do
	cwd '/opt/ariane/scenarios/tradeworkflow/distrib/conf'
	command 'sed -i "s/localhost/172.17.0.2/g" ./backoffice.properties'
end

execute "sed_rbmq_feeder" do
        cwd '/opt/ariane/scenarios/tradeworkflow/distrib/conf'
        command 'sed -i "s/localhost/172.17.0.2/g" ./feeder.properties'
end

execute "sed_rbmq_frontoffice" do
        cwd '/opt/ariane/scenarios/tradeworkflow/distrib/conf'
        command 'sed -i "s/localhost/172.17.0.2/g" ./frontoffice.properties'
end

execute "sed_rbmq_middleoffice" do
        cwd '/opt/ariane/scenarios/tradeworkflow/distrib/conf'
        command 'sed -i "s/localhost/172.17.0.2/g" ./middleoffice.properties'
end

execute "sed_rbmq_risk" do
        cwd '/opt/ariane/scenarios/tradeworkflow/distrib/conf'
        command 'sed -i "s/localhost/172.17.0.2/g" ./risk.properties'
end
