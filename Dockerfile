FROM jenkins

USER root

RUN apt-get update && apt-get install -y rsync maven

USER jenkins
