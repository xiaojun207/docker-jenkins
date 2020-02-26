# docker-jenkins

# build
```
 docker build -t xiaojun207/jenkins -f Dockerfile .
```

# test
```
docker run --name test-jenkins xiaojun207/jenkins
```

# use, eg.
```
docker run -d --name jenkins -p 8080:8080 -p 50000:50000 -v /data/jenkins_home:/var/jenkins_home/ -v /data/docker/hosts:/etc/hosts -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):/usr/bin/docker xiaojun207/jenkins:latest

```

# 国内插件安装慢
进入jenkins_home目录下的配置目录，并执行：

```
cd ${JENKINS_HOME}/updates  #进入更新配置位置

sed -i 's/http:\/\/updates.jenkins-ci.org\/download/https:\/\/mirrors.tuna.tsinghua.edu.cn\/jenkins/g' default.json && sed -i 's/http:\/\/www.google.com/https:\/\/www.baidu.com/g' default.json
```

* 具体操作：可在
