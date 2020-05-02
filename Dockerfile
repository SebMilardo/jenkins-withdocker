FROM jenkins/jenkins:lts
MAINTAINER milardo@mit.edu

USER root

WORKDIR /usr/share

RUN git clone https://github.com/jenkinsci/blueocean-plugin blueocean  

RUN ls /usr/share/blueocean/blueocean

COPY /usr/share/blueocean/blueocean/target/plugins /usr/share/jenkins/ref/plugins/

RUN apk add docker && addgroup jenkins docker
RUN for f in /usr/share/jenkins/ref/plugins/*.hpi; do mv "$f" "${f%%hpi}jpi"; done
RUN install-plugins.sh antisamy-markup-formatter matrix-auth # for security, you know

# Force use of locally built blueocean plugin
RUN for f in /usr/share/jenkins/ref/plugins/blueocean-*.jpi; do mv "$f" "$f.override"; done

# let scripts customize the reference Jenkins folder. Used in bin/build-in-docker to inject the git build data
COPY docker/ref /usr/share/jenkins/ref

RUN echo "Please run: docker run --privileged=true -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock -it <imagename>

USER jenkins

