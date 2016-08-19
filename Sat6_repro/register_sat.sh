#!/bin/bash
# author: Pavel Studenik <pstudeni@redhat.com>

# register.sh <activationkey> <organization>

AK=${1:-$AK}
ORG=${2:-$ORG}

# Make sure we have DBus running, othervise SM complains with:
# DBusException: org.freedesktop.DBus.Error.FileNotFound: Failed to connect to socket /var/run/dbus/system_bus_socket: No such file or directory
/sbin/service messagebus status || /sbin/service messagebus start


subscription-manager register --activationkey="$AK" --org="$ORG" --force

[ $? -ne 0 ] && tail /var/log/rhsm/rhsm.log

# TODO: Deal with katello-agent
###yum -y install katello-agent

