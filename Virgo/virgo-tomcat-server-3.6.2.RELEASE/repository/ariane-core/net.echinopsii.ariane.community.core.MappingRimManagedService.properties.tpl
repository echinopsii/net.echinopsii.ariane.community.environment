#####################################################################################################################################
# Possible Mapping API implementation :
# + net.echinopsii.ariane.community.core.mapping.ds.blueprints
# + net.echinopsii.ariane.community.core.mapping.ds.msgcli
#
#
# Typical Mapping integrations :
#====================================================================================================================================
# Graph DB :   |--- rim => ds.blueprints ---|--- ds.wat     ---||  <<<-- REST APIs and End User
# Neo4J        |                            |~ ~ ~ ~ ~ ~ ~ ~ ~ ||~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~|
# T.D. : Titan |--- rim => ds.blueprints ---|--- ds.msgsrv  ---||....... MoM : .......||--- rim => ds.msgcli ---|--- ds.wat ---  <<<-- REST APIs and End User
# T.D. : ...   |                            |                  || NATS                ||--- rim => ds.msgcli ---|--- custom injector ---
#              |                            |                  || RabbitMQ            ||<<<-- Non Java Messaging Client (python)
#              |                            |                  || T.D. : ZeroMQ       ||

mapping.ds.bundle.name                 = net.echinopsii.ariane.community.core.mapping.ds.blueprints


#####################################################################################################################################

# possible conf where bundle name == net.echinopsii.ariane.community.core.mapping.ds.blueprints (Virgo And Karaf)
mapping.ds.blueprints.implementation   = Neo4j
mapping.ds.blueprints.neo4j.configfile = %%VIRGO_HOME/ariane/neo4j/conf/neo4j-server.properties

# possible conf where bundle name == net.echinopsii.ariane.community.core.mapping.ds.msgcli (Karaf)
#
# NATS msgcli conf
# -----------------
# mom_cli.impl=net.echinopsii.ariane.community.messaging.nats.Client
# mom_host.fqdn=localhost
# mom_host.port=4222
# mom_cli.nats.connection_name=ArianeConnection
#
# RabbitMQ msgcli conf
# ---------------------
# mom_cli.impl=net.echinopsii.ariane.community.messaging.rabbitmq.Client
# mom_host.fqdn=localhost
# mom_host.port=5672
# mom_host.user=ariane
# mom_host.password=password
# mom_host.rbq_vhost=/ariane