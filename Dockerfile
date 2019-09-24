FROM jenkins/jenkins:lts

MAINTAINER Gidraff Kamande

# COPY security.groovy /var/jenkins_home/init.groovy.d/security.groovy
# Disabling setup wizard
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false -Djenkins.CLI.disabled=true" \
  JENKINS_USER=admin \
  JENKINS_PASS=admin \
  JENKINS_EMAIL=admin@localhost \
  JENKINS_URL=http://0.0.0.0:8080/

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# Add groovy script
COPY groovy/* /usr/share/jenkins/ref/init.groovy.d/

EXPOSE 50000-50100
EXPOSE 80
EXPOSE 8080
