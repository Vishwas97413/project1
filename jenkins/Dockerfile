FROM jenkins/jenkins:lts-jdk21

USER root

RUN apt-get update && \
    apt-get install -y docker.io && \
    apt-get clean

# Change docker group's GID to match the host
RUN groupmod -g 992 docker

# Add Jenkins user to docker group
RUN usermod -aG docker jenkins

USER jenkins
