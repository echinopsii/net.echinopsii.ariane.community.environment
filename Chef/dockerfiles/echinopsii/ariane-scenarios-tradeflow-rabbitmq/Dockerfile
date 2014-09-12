FROM chef/ubuntu-12.04:latest

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y net-tools telnet ethtool iputils-ping vim

#RUN mount -o rw,remount /etc/hosts
#RUN cp /etc/hosts /tmp ; more /tmp/hosts | sed "s/ rbmq11//g" > /etc/hosts
#RUN cp /etc/hosts /tmp ; more /tmp/hosts | sed "s/ rbmq21//g" > /etc/hosts
#RUN cp /etc/hosts /tmp ; more /tmp/hosts | sed "s/ rbmq31//g" > /etc/hosts
#RUN rm /tmp/hosts

#RUN echo "192.168.33.22     rbmq11" >> /etc/hosts
#RUN echo "192.168.33.23     rbmq21" >> /etc/hosts
#RUN echo "192.168.33.24     rbmq31" >> /etc/hosts

ADD chef/ /etc/chef/
RUN chef-init --bootstrap
#RUN rm -rf /etc/chef/secure/*
ENTRYPOINT ["chef-init"]
CMD ["--onboot"]

#RBQ AMQP
EXPOSE 5672
#RBQ MGT
EXPOSE 15672
#RBQ CLUSTERING
EXPOSE 25672
#RBQ MQTT
EXPOSE 1883
#RBQ STOMP
EXPOSE 61613

#EPMD 
EXPOSE 4369
EXPOSE 44001
