FROM centos:centos6
MAINTAINER Mathilde Ffrench <mathilde.ffrench@echinopsii.net>

RUN yum -y update; yum clean all
RUN rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
RUN yum install -y erlang logrotate wget net-tools bind-utils
RUN rpm -Uvh http://www.rabbitmq.com/releases/rabbitmq-server/v3.3.5/rabbitmq-server-3.3.5-1.noarch.rpm

RUN rabbitmq-plugins enable amqp_client mochiweb webmachine rabbitmq_amqp1_0 rabbitmq_web_dispatch rabbitmq_management_agent rabbitmq_management rabbitmq_management_visualiser rabbitmq_federation rabbitmq_federation_management rabbitmq_mqtt rabbitmq_shovel rabbitmq_shovel_management rabbitmq_stomp rabbitmq_test rabbitmq_tracing 

ADD run-rabbitmq-server.sh /run-rabbitmq-server.sh
RUN chmod 750 ./run-rabbitmq-server.sh
EXPOSE 5672 15672 4369 25672 61613 1883

CMD ["/run-rabbitmq-server.sh"]
