FROM rhel6.7
MAINTAINER "Jan Hutar" <jhutar@redhat.com>

RUN echo -e "[rhel67]\nname=RHEL67\nbaseurl=http://download.devel.redhat.com/released/RHEL-6/6.7/Server/x86_64/os/\nenabled=1\ngpgcheck=0" >/etc/yum.repos.d/rhel67.repo
RUN yum -y install dbus
RUN rm -f /etc/yum.repos.d/rhel67.repo

ADD register.sh /root/register.sh
RUN chmod a+x /root/register.sh

CMD /root/register.sh
