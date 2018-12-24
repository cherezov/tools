FROM centos:centos7
MAINTAINER Pavel Cherezov <pavelc@gmail.com>

RUN echo "root:toor" | chpasswd

RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum-config-manager --add-repo http://buildlogs.centos.org/centos/7/sclo/x86_64/rh/
RUN rpm --import http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-7 

RUN yum -y install wget

RUN yum -y install gcc
RUN yum -y install gcc-c++
RUN yum -y install make
RUN yum -y install cmake
RUN yum -y install --nogpgcheck p7zip
RUN yum -y install dos2unix
RUN yum -y install python36-devel

RUN yum -y install boost-devel
RUN yum -y install gtest-devel
RUN yum -y install gmock-devel
 
RUN yum -y install lm_sensors
RUN yum -y install gettext
RUN wget -P /tmp http://pagesperso-orange.fr/sebastien.godard/sysstat-12.1.1-1.x86_64.rpm 
RUN rpm -Uvh /tmp/sysstat-12.1.1-1.x86_64.rpm
