# NATS MESSAGING PROVIDER CONFIGURATION
mom_cli.impl=net.echinopsii.ariane.community.messaging.nats.Client
mom_cli.msg_debug_on_timeout=true
mom_cli.nb_routees_per_service=10
mom_host.fqdn=localhost
mom_host.port=4222
mom_host.user=ariane
mom_host.password=password

# RABBITMQ MESSAGING PROVIDER CONFIGURATION
# mom_cli.impl=net.echinopsii.ariane.community.messaging.rabbitmq.Client
# mom_cli.rabbitmq.product=Ariane
# mom_cli.rabbitmq.information=Ariane Remote Mapping Messaging Service
# mom_host.fqdn=localhost
# mom_host.port=5672
# mom_host.user=ariane
# mom_host.password=password
# mom_host.rbq_vhost=/ariane

# ARIANE CLIENT PROPERTIES
ariane.pgurl=http://dekatonmac:6969/ariane
ariane.osi=dekatonmac
ariane.otm=AROps
ariane.app=Ariane Core Monolith
ariane.cmp=echinopsii
