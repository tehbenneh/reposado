FROM ubuntu:latest

MAINTAINER benharker@mac.com
RUN apt-get update && apt-get install -y git ;
RUN git clone https://github.com/wdas/reposado.git /reposado ;
RUN wget -O - http://ppa.moosefs.com/moosefs.key | apt-key add - && echo "deb http://ppa.moosefs.com/current/apt/ubuntu/trusty trusty main" >> /etc/apt/sources.list.d/moosefs.list ;
RUN apt-get update ; apt-get install -y moosefs-client moosefs-cli nano wget python curl net-tools ; rm -rf /var/lib/apt/lists/* ; mkdir /mnt/MFS ;

COPY ./run-reposado /usr/local/bin/run-reposado
RUN chmod -Rv 777 /usr/local/bin/* ;

CMD ["/usr/local/bin/run-reposado"]
