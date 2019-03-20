FROM alpine:3.8

RUN useradd -m jenkins

USER jenkins

cmd echo 'Hello Kaniko. It's alive.'
