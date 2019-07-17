FROM rabbitmq:3.7.16

RUN apt-get update && apt-get -y install iputils-ping

COPY custom-docker-entrypoint.sh /custom-docker-entrypoint.sh

RUN mkdir -p /etc/customrabbitmq
COPY customrabbitmq.conf /etc/customrabbitmq/customrabbitmq.conf
RUN chmod -R 777 /etc/customrabbitmq

ENTRYPOINT ["/custom-docker-entrypoint.sh"]
