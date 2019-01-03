#
# Oracle Java 8 Dockerfile
#
# https://github.com/dockerfile/java
# https://github.com/dockerfile/java/tree/master/oracle-java8
#

# Pull base image.
FROM rafaelcarreira/docker-java8

COPY entrypoint.sh /entrypoint.sh
COPY maintenance.sh /maintenance.sh

ENTRYPOINT ["/entrypoint.sh"]

