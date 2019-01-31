FROM lokori/clamav-rest:v1

# Update distribution
RUN yum update -y

# Set working directory
WORKDIR /var/clamav-rest/

# Open up the server
EXPOSE 8080

# Get localhost/127.0.0.1 version of upstream configuration
ADD bootstrap.sh /
ENTRYPOINT ["/bootstrap.sh"]

# Change user
USER 1000
