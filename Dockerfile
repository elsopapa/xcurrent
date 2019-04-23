FROM rhel7
ENV ACCEPT_EULA=Y 
#RUN rpm -i http://dszbx01.bue299.comafi.com.ar/zabbix/jre-8u211-linux-x64.rpm
#RUN curl https://packages.microsoft.com/config/rhel/7/prod.repo > /etc/yum.repos.d/msprod.repo && \
RUN    curl http://dszbx01.bue299.comafi.com.ar/zabbix/ose.repo  > /etc/yum.repos.d/ose.repo && \
    yum install -y iputils wget  nss_wrapper gettext && yum clean all
        #yum install -y mssql-tools  iputils wget  nss_wrapper gettext && yum clean all

#RUN wget -c http://dszbx01.bue299.comafi.com.ar/zabbix/xcurrent-server-v4.1.1.tar.gz  -O - | tar -xz -C /opt/
#RUN tar -zx /paquetes/xcurrent-server-v4.1.1.tar.gz -C /opt/
#RUN rpm -ih /paquetes/jre-8u211-linux-x64.rpm

# Drop the root user and make the content of /opt/app-root owned by user 1001
COPY ./root /



#USER 1000
RUN /usr/bin/fix-permissions 
ENTRYPOINT ["/usr/bin/runxcurrent"]


