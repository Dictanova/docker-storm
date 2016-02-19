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

FROM dictanova/storm:0.9.6
MAINTAINER Damien Raude-Morvan "damien@dictanova.com"

ADD start-supervisor.sh /usr/bin/start-supervisor.sh

RUN /usr/bin/config-supervisord.sh nimbus
RUN /usr/bin/config-supervisord.sh drpc

# port the Thrift interface of Nimbus should run on.
EXPOSE 6627
# DRPC Port
EXPOSE 3772
# DRPC Invocation
EXPOSE 3773
# DRPC HTTP
EXPOSE 3774

CMD /usr/bin/start-supervisor.sh
