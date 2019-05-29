# Dockerfile to create a machine with 
# - basic linux functions (curl,wget,python, etc)
# - Lastest JDK installed

FROM ubuntu:19.04
RUN apt-get update

# Install OpenJDK-8
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y ant && \
    apt-get clean;

# Fix certificate issues
RUN apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f;
COPY ./ppss-3.60.0.zip /opt/;
# Setup JAVA_HOME -- useful for docker commandline
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME
