FROM rhel7
ENV ACCEPT_EULA=Y 
RUN rpm -i http://dszbx01.bue299.comafi.com.ar/zabbix/jre-8u211-linux-x64.rpm
RUN curl https://packages.microsoft.com/config/rhel/7/prod.repo > /etc/yum.repos.d/msprod.repo && \
    curl http://dszbx01.bue299.comafi.com.ar/zabbix/ose.repo  > /etc/yum.repos.d/ose.repo && \
    yum install -y mssql-tools  iputils wget  nss_wrapper gettext && yum clean all
#COPY ./paquetes /
RUN wget -c http://dszbx01.bue299.comafi.com.ar/zabbix/xcurrent-server-v4.1.1.tar.gz  -O - | tar -xz -C /opt/
#RUN tar -zx /paquetes/xcurrent-server-v4.1.1.tar.gz -C /opt/
#RUN rpm -ih /paquetes/jre-8u211-linux-x64.rpm

# Drop the root user and make the content of /opt/app-root owned by user 1001
COPY ./root /


RUN /usr/bin/fix-permissions 
USER 1000
#ENTRYPOINT ["/usr/bin/rungrafana"]
CMD ping localhost

