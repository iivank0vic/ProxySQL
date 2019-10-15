FROM centos:7

RUN yum install epel* -y
RUN yum update -y

ADD conf/proxysql.repo /etc/yum.repos.d/proxysql.repo
ADD conf/proxysql.cnf /etc/proxysql/proxysql.cnf

RUN ln -s -f /bin/true /usr/bin/chfn
RUN rm -fr /etc/localtime   
RUN ln -sf /usr/share/zoneinfo/Europe/Sarajevo /etc/localtime 

RUN yum -y install \
        sudo vim curl curl-devel \
        wget git htop ncdu net-tools \
        less unzip nano vim bash-completion bash-completion-extras \
        proxysql
        
CMD  /root/start.sh && tail -f /dev/null
