mapping.ds.bundle.name = net.echinopsii.ariane.community.core.mapping.ds.msgcli

# NATS MESSAGING PROVIDER CONFIGURATION
mom_cli.impl=net.echinopsii.ariane.community.messaging.nats.Client
mom_host.fqdn=localhost
mom_host.port=4222
mom_host.user=ariane
mom_host.password=password

# RABBITMQ MESSAGING PROVIDER CONFIGURATION
# mom_cli.impl=net.echinopsii.ariane.community.messaging.rabbitmq.Client
# mom_host.fqdn=localhost
# mom_host.port=5672
# mom_host.user=ariane
# mom_host.password=password
# mom_host.rbq_vhost=/ariane

# ARIANE CLIENT PROPERTIES
ariane.pgurl=http://dekatonmac:6969/ariane
ariane.osi=dekatonmac
ariane.otm=AROps
ariane.app=Ariane Core Front MS
ariane.cmp=echinopsii
