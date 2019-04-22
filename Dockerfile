FROM centos
ENV ACCEPT_EULA=Y 

RUN \
    curl https://packages.microsoft.com/config/rhel/7/prod.repo > /etc/yum.repos.d/msprod.repo && \
    yum install -y mssql-tools wget && \
    yum clean all
RUN rpm -Uvh http://dszbx01.bue299.comafi.com.ar/zabbix/jre-8u211-linux-x64.rpm
RUN wget -c http://dszbx01.bue299.comafi.com.ar/zabbix/xcurrent-server-v4.1.1.tar.gz  -O - | tar -xz -C /opt/
# Drop the root user and make the content of /opt/app-root owned by user 1001
RUN chown -R 1001:1001 /opt/xcurrent-server-4.1.1-SNAPSHOT
USER 1001
RUN "/opt/xcurrent-server-4.1.1-SNAPSHOT/bin/service start"

