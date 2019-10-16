FROM centos:7

RUN yum install epel* -y
RUN yum update -y

ADD conf/proxysql.repo /etc/yum.repos.d/proxysql.repo
ADD conf/proxysql.cnf /etc/proxysql/proxysql.cnf
ADD conf/proxysql-logrotate /etc/logrotate.d/proxysql
COPY start.sh /start.sh

RUN ln -s -f /bin/true /usr/bin/chfn
RUN rm -fr /etc/localtime   
RUN ln -sf /usr/share/zoneinfo/Europe/Sarajevo /etc/localtime 

RUN yum -y install \
        sudo vim curl curl-devel \
        wget git htop ncdu net-tools \
        less unzip nano vim bash-completion bash-completion-extras \
        proxysql mysql
        
VOLUME /var/lib/proxysql
EXPOSE 6032 6033 6080

ENTRYPOINT ["/start.sh"]
