FROM jenkins/jenkins:jdk21
LABEL authors="simon"

COPY --chown=jenkins:jenkins certificate.pfx /var/lib/jenkins/certificate.pfx
COPY --chown=jenkins:jenkins https.key /var/lib/jenkins/pk
ENV JENKINS_OPTS="--httpPort=-1 --httpsPort=9090 --httpsKeyStore=/var/lib/jenkins/certificate.pfx --httpsKeyStorePassword=superStrongPassword"
EXPOSE 9090