FROM jenkins

USER root

RUN apt-get update
RUN apt-get install -y rsync
RUN apt-get install -y maven
RUN mvn -version

USER jenkins
