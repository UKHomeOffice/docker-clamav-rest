FROM lokori/clamav-rest:v1

# Update distribution
RUN yum update -y

# Get localhost/127.0.0.1 version of upstream configuration
COPY ./bootstrap.sh bootstrap.sh

# Entry point
CMD [ "bootstrap.sh" ]
