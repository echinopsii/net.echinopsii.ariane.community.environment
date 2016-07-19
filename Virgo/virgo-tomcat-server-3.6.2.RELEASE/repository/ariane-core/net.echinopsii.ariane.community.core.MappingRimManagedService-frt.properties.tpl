# Possible Mapping API implementation :
# + net.echinopsii.ariane.community.core.mapping.ds.blueprints
# + net.echinopsii.ariane.community.core.mapping.ds.msgcli

# mapping.ds.bundle.name                 = net.echinopsii.ariane.community.core.mapping.ds.blueprints
mapping.ds.bundle.name = net.echinopsii.ariane.community.core.mapping.ds.msgcli

# possible conf where bundle name == net.echinopsii.ariane.community.core.mapping.ds.blueprints
# mapping.ds.blueprints.implementation   = Neo4j
# mapping.ds.blueprints.neo4j.configfile = %%VIRGO_HOME/ariane/neo4j/conf/neo4j-server.properties

# possible conf where bundle name == net.echinopsii.ariane.community.core.mapping.ds.msgcli
#
# NATS
# mom_cli.impl=net.echinopsii.ariane.community.messaging.nats.Client
# mom_host.fqdn=localhost
# mom_host.port=4222
# mom_host.user=ariane
# mom_host.password=password
# RABBITMQ
mom_cli.impl=net.echinopsii.ariane.community.messaging.rabbitmq.Client
mom_host.fqdn=localhost
mom_host.port=5672
mom_host.user=ariane
mom_host.password=password
mom_host.rbq_vhost=/ariane
# ARIANE
ariane.pgurl=http://dekatonmac:6969/ariane
ariane.osi=dekatonmac
ariane.otm=AROps
ariane.app=Ariane Core Front MS
ariane.cmp=echinopsii
