#!/bin/sh

varnishd \
	-a :8080 -T localhost:6082 \
	-f /etc/varnish/default.vcl \
	-s malloc,64m

sleep 5

./varnishstatbeat -c varnishstatbeat.yml -e -d "*"
