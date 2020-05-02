FROM jenkinsci/blueocean
MAINTAINER milardo@mit.edu

USER root

RUN apk add docker && addgroup jenkins docker && chmod 755 /var/run/docker.sock
RUN echo "Please run: docker run --privileged=true -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock -it <imagename>"

USER jenkins

