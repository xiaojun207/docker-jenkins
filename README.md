# docker-jenkins
>使用项目场景是：java springboot + maven + docker，vue项目页面推送，openresty配置信息推送。其中java程序经maven打包为jar包，然后打包为docker 镜像并推送到docker镜像仓储，再到生产环境集群中更新相关镜像的容器。

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
docker run -d --name jenkins -p 8080:8080 -p 50000:50000 -v /data/jenkins_home:/var/jenkins_home/ -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):/usr/bin/docker xiaojun207/jenkins:latest

```

参数说明：
* -p 端口参数就不多说了
* -v /data/jenkins_home:/var/jenkins_home/ ，这里把jenkins_home目录映射到宿主机，可以在容器删除后，重新启动容器，可保持jenkins的配置和项目；
* -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):/usr/bin/docker ，是为了让jenkins可以支持使用宿主机的docker命令，方便docker镜像操作。

# 国内插件安装慢
可在容器首次“docker run ... ” 后，进入jenkins_home目录下的配置目录，并执行：

```
cd ${JENKINS_HOME}/updates  #进入更新配置位置

sed -i 's/http:\/\/updates.jenkins-ci.org\/download/https:\/\/mirrors.tuna.tsinghua.edu.cn\/jenkins/g' default.json && sed -i 's/http:\/\/www.google.com/https:\/\/www.baidu.com/g' default.json
```

