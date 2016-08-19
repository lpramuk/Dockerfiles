#!/bin/bash
# author: Pavel Studenik <pstudeni@redhat.com>

# register.sh <server> <username> <password> [ <organization> <activationkey> ]

SERVER=${1:-$SERVER}
USERNAME=${2:-$USERNAME}
PASSWORD=${3:-$PASSWORD}
ORG=${4:-$ORG}
ENV=${5:-$ENV}

# Make sure we have DBus running, othervise SM complains with:
# DBusException: org.freedesktop.DBus.Error.FileNotFound: Failed to connect to socket /var/run/dbus/system_bus_socket: No such file or directory
service messagebus status || service messagebus start

rpm -Uvh http://$SERVER/pub/katello-ca-consumer-latest.noarch.rpm

subscription-manager register --username="$USERNAME" --password="$PASSWORD" --org="$ORG" --environment="$ENV" --auto-attach

[ $? -ne 0 ] && tail /var/log/rhsm/rhsm.log

# TODO: Deal with katello-agent
###yum -y install katello-agent

yum repolist
