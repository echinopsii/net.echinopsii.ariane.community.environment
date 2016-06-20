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

# possible conf where bundle name == net.echinopsii.ariane.community.core.mapping.ds.msg-cli (Karaf)
# mapping.ds.msgcli.mom.protocol =  # currently possible : AMQP-RBQ
# mapping.ds.msgcli.broker.fqdn =
# mapping.ds.msgcli.broker.port =