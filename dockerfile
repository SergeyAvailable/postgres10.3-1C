FROM centos:centos7.9.2009
WORKDIR /rpm
COPY ./rpm/* /rpm/
COPY ./pg_hba.conf /rpm/
COPY ./postgresql.conf /rpm/
RUN pwd
RUN ulimit -n 1024 && yum localinstall -y ./*.rpm
RUN pwd
RUN cp /rpm/pg_hba.conf /var/lib/pgsql/10/data/ && cp ./postgresql.conf /var/lib/pgsql/10/data/ && chown postgres:postgres -R /var/lib/pgsql/10/data
CMD ["postgres", "-D", "/usr/local/pgsql/data"]




https://support.rdb24.com/hc/ru/articles/212468369-%D0%9D%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0-%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%BE%D0%B9-%D0%BB%D0%BE%D0%BA%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D0%B8-utf-8-%D0%B2-CentOS
