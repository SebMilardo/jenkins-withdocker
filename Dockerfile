FROM jenkinsci/blueocean
MAINTAINER milardo@mit.edu
USER root

# Install the latest Docker CE binaries
RUN apk add docker && \
   echo "Please run: docker run -d -p 8080:8080 -p 50000:50000 \ -v /var/run/docker.sock:/var/run/docker.sock \ -v /usr/bin/docker:/usr/bin/docker SebMilardo/jenkins-withdocker"
