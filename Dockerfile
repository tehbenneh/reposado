FROM dtank/core:latest

MAINTAINER benharker@mac.com

RUN wget -O - http://ppa.moosefs.com/moosefs.key | apt-key add - && echo "deb http://ppa.moosefs.com/current/apt/ubuntu/trusty trusty main" >> /etc/apt/sources.list.d/moosefs.list ;
RUN apt-get update ; apt-get install -y moosefs-client moosefs-cli nano wget curl net-tools ; rm -rf /var/lib/apt/lists/* ; mkdir /mnt/MFS ;

COPY ./run-services /usr/local/bin/run-services
RUN chmod -Rv 777 /usr/local/bin/* ;

CMD ["/usr/local/bin/run-services"]