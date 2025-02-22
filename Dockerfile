FROM jenkins/jenkins:jdk21
LABEL authors="simon"

COPY --chown=jenkins:jenkins certificate.pfx /var/lib/jenkins/certificate.pfx
COPY --chown=jenkins:jenkins https.key /var/lib/jenkins/pk
ENV JENKINS_OPTS="--httpPort=-1 --httpsPort=9090 --httpsKeyStore=/var/lib/jenkins/certificate.pfx --httpsKeyStorePassword=superStrongPassword"
ENV JAVA_OPTS="-Dfile.encoding=UTF-8"

# Install necessary packages for running Angular Cypress and Karma tests
USER root
RUN apt-get update && apt-get install -y libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libnss3 libxss1 libasound2 libxtst6 xauth xvfb libxi6 libgconf-2-4 unzip curl wget
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt-get install -y ./google-chrome-stable_current_amd64.deb
USER jenkins

EXPOSE 9090