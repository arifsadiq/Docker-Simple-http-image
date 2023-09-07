# Use the official Ubuntu as parent image
FROM centos:latest

# Update CentOS 8 to change the mirrors to vault.centos.org
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

# Update the package repository && install HTTP
RUN yum -y update && yum install -y httpd

# Expose default HTTP port
EXPOSE 80

# Copy custom index.html to the container
COPY index.html /var/www/html/index.html

# Start HTTP in the foreground
CMD [ "/usr/sbin/httpd", "-D", "FOREGROUND" ]

