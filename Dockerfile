FROM centos:7.7.1908 

RUN yum update -y && \
    yum install -y \
        m4 \
        gettext \
        automake \
        autoconf        

RUN yum install -y \
        net-snmp \
        net-snmp-utils \
        epel-release \
        perl-Net-SNMPd

RUN yum install -y \
        which \
        make \
        gcc



COPY . /var/www/plugins
WORKDIR  /var/www/plugins
RUN ls -al
RUN ./tools/setup
RUN ./configure
RUN make && make install


VOLUME ["/var/www/plugins"]

