#!/usr/bin/env bash

function ReplaceConf { 
    sed -i "s/pr0xysql/$PROXYSQL_PASSWORD/" /etc/proxysql/proxysql.cnf
    sed -i "s/proxysqlpassword/$MONITORING_PASSWORD/" /etc/proxysql/proxysql.cnf
    sed -i "s/db1.cluster.node/$CLUSTER_IP1/" /etc/proxysql/proxysql.cnf
    sed -i "s/db2.cluster.node/$CLUSTER_IP2/" /etc/proxysql/proxysql.cnf
    sed -i "s/db3.cluster.node/$CLUSTER_IP3/" /etc/proxysql/proxysql.cnf
    sed -i "s/passw0rd/$PROXYSQL_USER/" /etc/proxysql/proxysql.cnf
    
}

function StartProxy { 
    /etc/init.d/proxysql
}

ReplaceConf
StartProxy
