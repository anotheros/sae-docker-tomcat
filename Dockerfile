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
RUN apt-get install -y vim wget curl 
RUN wget http://7xl6gx.com1.z0.glb.clouddn.com/apache-tomcat-8.0.36.zip  -O /data/
RUN unzip /data/apache-tomcat-8.0.36.zip
RUN mv /data/apache-tomcat-8.0.36 /data/tomcat

# ����JAVA_HOME��������
RUN update-alternatives --display java
RUN echo "JAVA_HOME=/usr/lib/jvm/java-8-oracle">> /etc/environment

#ENV JAVA_HOME /usr/local/java/jdk1.7.0_67
#ENV JRE_HOME $JAVA_HOME/jre
#ENV CLASSPATH .:$JAVA_HOME/lib:$JRE_HOME/lib
#ENV PATH $PATH:$JAVA_HOME/bin



# ������Ҫ����Tomcat 5050�˿�
EXPOSE 5050

# ����Tomcat7��ʼ�����У�SSH�ն˷�������Ϊ��̨����
ENTRYPOINT service tomcat7 start && /usr/sbin/sshd -D