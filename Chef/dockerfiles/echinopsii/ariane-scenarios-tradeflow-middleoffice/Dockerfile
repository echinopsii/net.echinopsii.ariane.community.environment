FROM chef/ubuntu-12.04:latest

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y net-tools telnet ethtool iputils-ping vim

ADD chef/ /etc/chef/
RUN chef-init --bootstrap
#RUN rm -rf /etc/chef/secure/*
ENTRYPOINT ["chef-init"]
CMD ["--onboot"]
