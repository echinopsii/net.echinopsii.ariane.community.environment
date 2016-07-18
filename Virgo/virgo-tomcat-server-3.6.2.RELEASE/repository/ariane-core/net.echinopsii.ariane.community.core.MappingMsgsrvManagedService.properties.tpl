# NATS
# mom_cli.impl=net.echinopsii.ariane.community.messaging.nats.Client
# mom_host.fqdn=localhost
# mom_host.port=4222
# mom_host.user=ariane
# mom_host.password=password
# RABBITMQ
mom_cli.impl=net.echinopsii.ariane.community.messaging.rabbitmq.Client
mom_cli.rabbitmq.product=Ariane
mom_cli.rabbitmq.information=Ariane Remote Mapping Messaging Service
mom_host.fqdn=localhost
mom_host.port=5672
mom_host.user=ariane
mom_host.password=password
mom_host.rbq_vhost=/ariane
# ARIANE
ariane.pgurl=http://dekatonmac:6969/ariane
ariane.osi=dekatonmac
ariane.otm=AROps
ariane.app=Ariane Core Monolith
ariane.cmp=echinopsii
