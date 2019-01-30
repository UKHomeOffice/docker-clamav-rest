FROM lokori/clamav-rest:v1

# Update distribution
RUN yum update -y

# Get localhost/127.0.0.1 version of upstream configuration
COPY ./bootstrap.sh /bootstrap.sh

# Set working directory
WORKDIR /var/clamav-rest/

# Change user
USER 1000
