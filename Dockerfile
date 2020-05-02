FROM jenkinsci/blueocean
MAINTAINER milardo@mit.edu
USER root

# Install the latest Docker CE binaries
RUN apt-get update && \
    apt-get -y install apt-transport-https \
      ca-certificates \
      curl \
      gnupg2 \
      software-properties-common && \
    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
    add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
      $(lsb_release -cs) \
      stable" && \
   apt-get update && \
   apt-get -y install docker-ce && \
   echo "Please run: docker run -d -p 8080:8080 -p 50000:50000 \ -v /var/run/docker.sock:/var/run/docker.sock \ -v /usr/bin/docker:/usr/bin/docker SebMilardo/jenkins-withdocker"
