#!/usr/bin/env bash

function ReplaceConf { 
    sed -i "s/db1.cluster.node/$CLUSTER_IP1/" /etc/proxysql.cnf
    sed -i "s/db2.cluster.node/$CLUSTER_IP2/" /etc/proxysql.cnf
    sed -i "s/db3.cluster.node/$CLUSTER_IP3/" /etc/proxysql.cnf
    sed -i "s/pr0xyPass/$PROXYSQL_PASSWD/" /etc/proxysql.cnf
    sed -i "s/adminWebMON/$WEBMON_PASSWD/" /etc/proxysql.cnf
    sed -i "s/pr0xysql/$PSQLDBS_USER/" /etc/proxysql.cnf
    sed -i "s/passw0rd/$PSQLDBS_PASSWD/" /etc/proxysql.cnf
    
}

function StartProxy { 
    exec proxysql -f /etc/proxysql.cnf
}

ReplaceConf
StartProxy
