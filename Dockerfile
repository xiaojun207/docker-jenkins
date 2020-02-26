FROM jenkins

USER root

RUN apt-get update
RUN apt-get install -y rsync
RUN apt-get install -y maven

RUN rsync --version
RUN mvn -version

USER jenkins

# 解决中国国内插件安装慢问题
RUN cd ~/updates && sed -i 's/http:\/\/updates.jenkins-ci.org\/download/https:\/\/mirrors.tuna.tsinghua.edu.cn\/jenkins/g' default.json && sed -i 's/http:\/\/www.google.com/https:\/\/www.baidu.com/g' default.json
