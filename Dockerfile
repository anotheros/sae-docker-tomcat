# VERSION 0.0.1
# 默认ubuntu server长期支持版本，当前是12.04
FROM ubuntu
# 签名啦
MAINTAINER laozhang "zhangshanhai123@gmail.com"

# 更新源，安装ssh server
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe"> /etc/apt/sources.list
RUN apt-get update

# 添加orache java8源，一次性安装vim，wget，curl，java8，tomcat8等必备软件
RUN apt-get install python-software-properties
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update
RUN apt-get install -y vim wget curl oracle-java8-installer 
RUN wget http://7xl6gx.com1.z0.glb.clouddn.com/apache-tomcat-8.0.36.zip  -O /data/
RUN unzip /data/apache-tomcat-8.0.36.zip
RUN mv /data/apache-tomcat-8.0.36 /data/tomcat

# 设置JAVA_HOME环境变量
RUN update-alternatives --display java
RUN echo "JAVA_HOME=/usr/lib/jvm/java-8-oracle">> /etc/environment

#ENV JAVA_HOME /usr/local/java/jdk1.7.0_67
#ENV JRE_HOME $JAVA_HOME/jre
#ENV CLASSPATH .:$JAVA_HOME/lib:$JRE_HOME/lib
#ENV PATH $PATH:$JAVA_HOME/bin



# 容器需要开放Tomcat 5050端口
EXPOSE 5050

# 设置Tomcat7初始化运行，SSH终端服务器作为后台运行
ENTRYPOINT service tomcat7 start && /usr/sbin/sshd -D