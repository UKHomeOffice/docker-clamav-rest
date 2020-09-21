ARG API_VER="1.0.0"

FROM amazoncorretto:8-alpine as base
ARG API_VER
# Get the JAR file 
COPY --from=lokori/clamav-rest:v1 /var/clamav-rest/clamav-rest-${API_VER}.jar /app/clamav-rest.jar
ADD bootstrap.sh /
RUN set -eux; \
  apk update; \
  apk add --no-cache \
  bash \
  openssl \
  shadow \
  less \
  curl; \
  rm -rf /var/cache/apk/* ; \
  find /usr/lib/jvm/ -name src.zip -delete || echo "skipping src.zip removal" ; \
  groupadd -r java -g 1000 && useradd -u 1000 -m --no-log-init -r -g java java ; \
  mkdir /etc/keystore  ; \
  chown -R java:java /home/java /app /etc/keystore ; \
  chmod 755 /bootstrap.sh



FROM base as clamavapi
WORKDIR /app
# Set environment variables.
ENV HOME /home/java
# Open up the server
EXPOSE 8080
# Get localhost/127.0.0.1 version of upstream configuration
ENTRYPOINT ["/bootstrap.sh"]
# Change user
USER 1000
