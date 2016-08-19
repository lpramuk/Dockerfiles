FROM fedora:latest
MAINTAINER https://github.com/SatelliteQE
 
RUN dnf -y update; yum clean all
RUN dnf groupinstall -y "Development Tools"
RUN dnf install -y git python-pip
 
# Clone Robottelo
RUN git clone https://github.com/SatelliteQE/robottelo.git
 
# Install Python deps
RUN pip install -r requirements.txt
RUN pip install -r requirements-optional.txt
 
# Add phantomjs
#
 
# runtime
EXPOSE 22
