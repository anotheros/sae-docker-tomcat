# VERSION 0.0.1
# Ĭ��ubuntu server����֧�ְ汾����ǰ��12.04
FROM ubuntu
# ǩ����
MAINTAINER laozhang "zhangshanhai123@gmail.com"

# ����Դ����װssh server
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe"> /etc/apt/sources.list
RUN apt-get update

# ���orache java8Դ��һ���԰�װvim��wget��curl��java8��tomcat8�ȱر����
RUN apt-get update
RUN apt-get install -y vim wget curl zip tar
RUN wget http://7xl6gx.com1.z0.glb.clouddn.com/apache-tomcat-8.0.36.zip  -O /data/apache-tomcat-8.0.36.zip 
#RUN unzip /data/apache-tomcat-8.0.36.zip
#RUN mv /data/apache-tomcat-8.0.36 /data/tomcat

RUN wget http://7xl6gx.com1.z0.glb.clouddn.com/jdk-8u92-linux-x64.tar.gz  -O /data/jdk-8u92-linux-x64.tar.gz 
#RUN tar -zxvf /data/jdk-8u92-linux-x64.tar.gz
#RUN mv /data/jdk1.8.0_92  /data/jdk

# ����JAVA_HOME��������

ENV JAVA_HOME /data/jdk
ENV JRE_HOME $JAVA_HOME/jre
ENV CLASSPATH .:$JAVA_HOME/lib:$JRE_HOME/lib
ENV PATH $PATH:$JAVA_HOME/bin



# ������Ҫ����Tomcat 5050�˿�
EXPOSE 5050

# ����Tomcat7��ʼ�����У�SSH�ն˷�������Ϊ��̨����
CMD tomcat/bin/catalina.sh run