# VERSION 0.0.1
# Ĭ��ubuntu server����֧�ְ汾����ǰ��12.04
FROM ubuntu
# ǩ����
MAINTAINER laozhang "zhangshanhai123@gmail.com"
#COPY ROOT /ROOT # ��һ����ַΪgit���� �ı���õ�java���򣬵ڶ���Ϊtomcat/conf ������� docBase ��·�� 
COPY dsp.web /data/webapp/dsp.web
# ����Դ
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe"> /etc/apt/sources.list
RUN apt-get update

# ���orache java8Դ��һ���԰�װvim��wget��curl��java8��tomcat8�ȱر����
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
# ����JAVA_HOME��������

ENV JAVA_HOME jdk
ENV JRE_HOME $JAVA_HOME/jre
ENV CLASSPATH .:$JAVA_HOME/lib:$JRE_HOME/lib
ENV PATH $PATH:$JAVA_HOME/bin

RUN echo $JAVA_HOME

# ������Ҫ����Tomcat 5050�˿�
EXPOSE 5050

# ����Tomcat7��ʼ�����У�SSH�ն˷�������Ϊ��̨����
RUN chmod u+x tomcat/bin/catalina.sh
CMD tomcat/bin/catalina.sh run

