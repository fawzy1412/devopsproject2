FROM  centos:latest
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum update -y
RUN yum install -y httpd \
 zip\
 unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page288/medic-care.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip medic-care.zip
RUN cp -rvf medic-care/* .
RUN rm -rf medic-care medic-care.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80 22