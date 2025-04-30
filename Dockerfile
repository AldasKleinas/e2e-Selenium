FROM jenkins/jenkins:lts-jdk21

USER root

RUN apt-get update && apt-get install -y maven

RUN apt-get install -y firefox-esr && apt-get install -y xvfb
RUN curl -sLo /usr/local/bin/geckodriver \
    https://github.com/mozilla/geckodriver/releases/download/v0.34.0/geckodriver-v0.34.0-linux64.tar.gz \
    && chmod +x /usr/local/bin/geckodriver

USER jenkins

RUN jenkins-plugin-cli --plugins "blueocean workflow-aggregator pipeline-utility-steps"
