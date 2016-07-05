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
#RUN wget http://7xl6gx.com1.z0.glb.clouddn.com/apache-tomcat-8.0.36.zip  -O apache-tomcat-8.0.36.zip 
#RUN unzip apache-tomcat-8.0.36.zip


RUN wget http://7xl6gx.com1.z0.glb.clouddn.com/jetty-runner.jar  -O jetty-runner.jar 
#RUN ls -l /data
#RUN yes |cp jetty-runner.jar /data/

#RUN rm -rf tomcat
#RUN mv apache-tomcat-8.0.36 tomcat
#RUN chmod u+x tomcat -R

RUN wget http://7xl6gx.com1.z0.glb.clouddn.com/jdk-8u92-linux-x64.tar.gz  -O jdk-8u92-linux-x64.tar.gz 
RUN tar -zxvf jdk-8u92-linux-x64.tar.gz
RUN rm -rf jdk
RUN mv jdk1.8.0_92 jdk

RUN chmod u+x jdk -R
# 设置JAVA_HOME环境变量

ENV JAVA_HOME jdk
ENV JRE_HOME $JAVA_HOME/jre
ENV CLASSPATH .:$JAVA_HOME/lib:$JRE_HOME/lib
ENV PATH $PATH:$JAVA_HOME/bin

RUN echo $JAVA_HOME

# 容器需要开放Tomcat 5050端口
EXPOSE 5050

# 设置Tomcat7初始化运行，SSH终端服务器作为后台运行
#RUN chmod u+x tomcat/bin/catalina.sh
#CMD tomcat/bin/catalina.sh run


RUN chmod u+x jetty-runner.jar

CMD java -jar jetty-runner.jar --port $PORT /data/webapp/jpa-start