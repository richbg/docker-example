FROM openjdk@sha256:3723419e5e6ce64ad9f5c7c4bfe9c6441540cd58dab37a33880c14cb4f5e3586

# ENV JENKINS_HOME /home/jenkins

# ARG user=jenkins
# ARG group=jenkins
# ARG uid=1000
# ARG gid=1000

# RUN groupadd -g ${gid} ${group} \
#     && useradd -d "$JENKINS_HOME" -u ${uid} -g ${gid} -m -s /bin/bash ${user}

RUN useradd -m bob

USER bob

cmd echo 'Hello Kaniko. It's alive.'
