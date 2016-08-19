#!/bin/bash
# author: Pavel Studenik <pstudeni@redhat.com>

# register.sh <server> <activationkey> <organization>

SERVER=${1:-$SERVER}
AK=${2:-$AK}
ORG=${3:-$ORG}

# Make sure we have DBus running, othervise SM complains with:
# DBusException: org.freedesktop.DBus.Error.FileNotFound: Failed to connect to socket /var/run/dbus/system_bus_socket: No such file or directory
service messagebus status || service messagebus start

rpm -Uvh http://$SERVER/pub/katello-ca-consumer-latest.noarch.rpm

subscription-manager register --activationkey="$AK" --org="$ORG"

[ $? -ne 0 ] && tail /var/log/rhsm/rhsm.log

# TODO: Deal with katello-agent
###yum -y install katello-agent

yum repolist
