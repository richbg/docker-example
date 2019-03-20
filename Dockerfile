FROM openjdk@sha256:3723419e5e6ce64ad9f5c7c4bfe9c6441540cd58dab37a33880c14cb4f5e3586

ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000

# Jenkins is run with user `jenkins`, uid = 1000
# If you bind mount a volume from the host or a data container,
# ensure you use the same uid
RUN groupadd -g ${gid} ${group} \
    && useradd -d "$JENKINS_HOME" -u ${uid} -g ${gid} -m -s /bin/bash ${user}


USER jenkins

cmd echo 'Hello Kaniko. It's alive.'
