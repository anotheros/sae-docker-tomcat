# VERSION 0.0.1
# 默认ubuntu server长期支持版本，当前是12.04
FROM ubuntu
# 签名啦
MAINTAINER laozhang "zhangshanhai123@gmail.com"

# 更新源，安装ssh server
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe"> /etc/apt/sources.list
RUN apt-get update

# 添加orache java8源，一次性安装vim，wget，curl，java8，tomcat8等必备软件
RUN apt-get update
RUN apt-get install -y vim wget curl zip tar
RUN wget http://7xl6gx.com1.z0.glb.clouddn.com/apache-tomcat-8.0.36.zip  -O /data/apache-tomcat-8.0.36.zip 
#RUN unzip /data/apache-tomcat-8.0.36.zip
#RUN mv /data/apache-tomcat-8.0.36 /data/tomcat

RUN wget http://7xl6gx.com1.z0.glb.clouddn.com/jdk-8u92-linux-x64.tar.gz  -O /data/jdk-8u92-linux-x64.tar.gz 
#RUN tar -zxvf /data/jdk-8u92-linux-x64.tar.gz
#RUN mv /data/jdk1.8.0_92  /data/jdk

# 设置JAVA_HOME环境变量

ENV JAVA_HOME /data/jdk
ENV JRE_HOME $JAVA_HOME/jre
ENV CLASSPATH .:$JAVA_HOME/lib:$JRE_HOME/lib
ENV PATH $PATH:$JAVA_HOME/bin



# 容器需要开放Tomcat 5050端口
EXPOSE 5050

# 设置Tomcat7初始化运行，SSH终端服务器作为后台运行
CMD tomcat/bin/catalina.sh run