FROM openjdk:9

RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch \
  | apt-key add -
RUN echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" \
  | tee -a /etc/apt/sources.list.d/elastic-6.x.list

RUN apt-get update && \
  apt-get install -y apt-transport-https elasticsearch logstash kibana

ENV ELDERBERRY_HOME /elderberry
WORKDIR $ELDERBERRY_HOME
ADD . $ELDERBERRY_HOME

CMD ./docker-entrypoint.sh
