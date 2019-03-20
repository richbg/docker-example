FROM centos

RUN useradd -m jenkins1

USER jenkins

cmd echo 'Hello Kaniko. It's alive.'
