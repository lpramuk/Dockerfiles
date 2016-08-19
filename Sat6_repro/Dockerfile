FROM rhel6.7
MAINTAINER "Jan Hutar" <jhutar@redhat.com>

RUN echo -e "[rhel67]\nname=RHEL67\nbaseurl=http://download.devel.redhat.com/released/RHEL-6/6.7/Server/x86_64/os/\nenabled=1\ngpgcheck=0" >/etc/yum.repos.d/rhel67.repo
RUN yum -y install dbus
RUN rm -f /etc/yum.repos.d/rhel67.repo
RUN /sbin/service messagebus status || /sbin/service messagebus start
RUN rpm -Uvh http://phenom-01.ml3.eng.bos.redhat.com/pub/katello-ca-consumer-latest.noarch.rpm

ADD register_sat.sh /root/register.sh
RUN chmod a+x /root/register.sh

CMD /root/register.sh
