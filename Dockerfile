# Use the official Ubuntu as parent image
FROM centos:latest

# Update the package repository && install HTTP
RUN yum -y update && yum install -y httpd

# Expose default HTTP port
EXPOSE 80

# Copy custom index.html to the container
COPY index.html /var/www/html/index.html

# Start HTTP in the foreground
CMD [ "/usr/sbin/httpd", "-D", "FOREGROUND" ]

