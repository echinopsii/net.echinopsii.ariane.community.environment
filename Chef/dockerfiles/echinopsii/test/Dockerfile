# BASE chef/ubuntu-12.04:latest
FROM echinopsii/test
ADD chef/ /etc/chef/
RUN chef-init --bootstrap
RUN rm -rf /etc/chef/secure/*
ENTRYPOINT ["chef-init"]
CMD ["--onboot"]
