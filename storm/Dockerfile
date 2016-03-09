# Copyright 2014-2016 Dictanova
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.
#

FROM java:openjdk-8
MAINTAINER Damien Raude-Morvan "damien@dictanova.com" 

ENV STORM_RELEASE 0.9.6
RUN apt-get -y update && \
    apt-get -y install --no-install-recommends supervisor wget unzip && \
    apt-get -y clean

RUN wget -nv -O /storm.tar.gz \
    http://www.apache.org/dist/storm/apache-storm-${STORM_RELEASE}/apache-storm-${STORM_RELEASE}.tar.gz
RUN mkdir -p /opt/storm && \
    tar xzf /storm.tar.gz --strip=1 -C /opt/storm && \
    rm /storm.tar.gz

ENV STORM_HOME /opt/storm
RUN ln -s $STORM_HOME/bin/storm /usr/bin/storm

ADD storm.yaml $STORM_HOME/conf/storm.yaml
ADD cluster.xml $STORM_HOME/logback/cluster.xml
ADD config-supervisord.sh /usr/bin/config-supervisord.sh
ADD start-supervisor.sh /usr/bin/start-supervisor.sh 

RUN echo [supervisord] | tee -a /etc/supervisor/supervisord.conf && \
    echo nodaemon=true | tee -a /etc/supervisor/supervisord.conf
