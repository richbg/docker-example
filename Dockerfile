FROM centos

RUN useradd -m jenkins

USER jenkins

cmd echo 'Hello Kaniko. It's alive.'
