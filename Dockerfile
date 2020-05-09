FROM jenkinsci/blueocean
MAINTAINER milardo@mit.edu

USER root

RUN apk add docker && addgroup jenkins docker
RUN touch /var/run/docker.sock 
RUN chmod 777 /var/run/docker.sock
RUN echo "Please run: docker run --privileged=true -p 8080:8080 --name='jenkins' -p 8080:8080 -v /home/$USER/docker/jenkins:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -it <imagename>"

USER jenkins

