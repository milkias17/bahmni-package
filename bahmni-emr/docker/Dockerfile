FROM openmrs/openmrs-distro-platform:2.1.4

COPY build/openmrs-modules/*.omod /usr/local/tomcat/.OpenMRS/modules/
COPY docker/templates/bahmnicore.properties.template /etc/bahmni-emr/templates/
COPY resources/atomfeed-client-*.jar /etc/bahmni-lab-connect/atomfeed-client.jar
COPY resources/liquibase-core-*.jar /etc/bahmni-lab-connect/liquibase-core.jar
COPY build/default_config /etc/bahmni_config/

# Creating Upload Directories
RUN mkdir -p /home/bahmni/patient_images
RUN mkdir -p /home/bahmni/document_images
COPY resources/blank-user.png /etc/bahmni/

# Used by envsubst command for replacing environment values at runtime
RUN apt-get update && apt-get install gettext-base

COPY docker/scripts/bahmni_startup.sh /usr/local/tomcat/
RUN chmod +x /usr/local/tomcat/bahmni_startup.sh

# Removing FHIR OMOD that comes bundled with OMRS base image
RUN unzip -o /usr/local/tomcat/webapps/openmrs.war -d /usr/local/tomcat/webapps/openmrs/
RUN rm /usr/local/tomcat/webapps/openmrs/WEB-INF/bundledModules/fhir-*.omod

CMD ["./bahmni_startup.sh"]
