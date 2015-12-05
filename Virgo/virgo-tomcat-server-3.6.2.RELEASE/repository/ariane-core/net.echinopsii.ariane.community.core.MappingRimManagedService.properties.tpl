#####################################################################################################################################
# Possible Mapping API implementation :
# + net.echinopsii.ariane.community.core.mapping.ds.blueprints
# + net.echinopsii.ariane.community.core.mapping.ds.msg-cli
#
#
# Typical Mapping integrations :
#=========================================================================================
# Graph DB :   |--- rim => ds.blueprints ---|--- ds.wat ---  <<<-- REST APIs and End User
# Neo4J        |                            |~ ~ ~ ~ ~ ~ ~ ~ ~ |~ ~ ~ ~ ~ ~|
# T.D. : Titan |                            |--- ds.msg-srv ---|....... MoM : .......|--- rim => ds.msg-cli ---|--- ds.wat ---  <<<-- REST APIs and End User
# T.D. : ...   |                            |                  | RabbitMQ            |
#              |                            |                  | T.D. : ZeroMQ       |
#              |                            |                  | T.D. : ...          |

mapping.ds.bundle.name                 = net.echinopsii.ariane.community.core.mapping.ds.blueprints


#####################################################################################################################################

# possible conf where bundle name == net.echinopsii.ariane.community.core.mapping.ds.blueprints (Virgo And Karaf)
mapping.ds.blueprints.implementation   = Neo4j
mapping.ds.blueprints.neo4j.configfile = %%VIRGO_HOME/ariane/neo4j/conf/neo4j-server.properties

# possible conf where bundle name == net.echinopsii.ariane.community.core.mapping.ds.msg-cli (Karaf)
mapping.ds.msg-cli.mom.protocol =  # currently possible : AMQP-RBQ
mapping.ds.msg-cli.broker.fqdn =
mapping.ds.msg-cli.broker.port =