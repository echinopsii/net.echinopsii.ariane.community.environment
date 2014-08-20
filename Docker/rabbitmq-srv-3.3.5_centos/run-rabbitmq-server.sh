#!/bin/sh

if [ ! -f /.run-rabbitmq-server-firstrun ]; then
	# TBD
	cat >/etc/rabbitmq/rabbitmq.config <<EOF
[
	{rabbit, [{default_user, <<"admin">>}, {default_pass, <<"admin">>}, {loopback_users, []}]}
].
EOF
	touch /.run-rabbitmq-server-firstrun
fi

exec /usr/sbin/rabbitmq-server
