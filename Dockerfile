# VERSION 0.0.1
# 默认ubuntu server长期支持版本，当前是12.04
FROM ubuntu
# 签名啦
MAINTAINER laozhang "zhangshanhai123@gmail.com"
#COPY ROOT /ROOT # 第一个地址为git里面 的编译好的java程序，第二个为tomcat/conf 里最后面 docBase 的路径 
COPY dsp.web /data/webapp/dsp.web
# 更新源
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe"> /etc/apt/sources.list
RUN apt-get update

# 添加orache java8源，一次性安装vim，wget，curl，java8，tomcat8等必备软件
#RUN apt-get update
RUN apt-get install -y vim wget curl zip tar
RUN wget http://mirrors.tuna.tsinghua.edu.cn/apache/tomcat/tomcat-8/v8.0.36/bin/apache-tomcat-8.0.36.zip  -O apache-tomcat-8.0.36.zip 
RUN unzip apache-tomcat-8.0.36.zip

RUN rm -rf tomcat
RUN mv apache-tomcat-8.0.36 tomcat
RUN rm -rf tomcat/conf
COPY conf tomcat/conf
RUN ls -l tomcat/conf
RUN chmod u+x tomcat -R






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
RUN chmod u+x tomcat/bin/catalina.sh
CMD tomcat/bin/catalina.sh run

