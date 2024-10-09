# Use Alpine Linux as local environment
FROM alpine:3.12

# Set the JMeter version
ARG JMETER_VERSION="5.5"
ENV JMETER_HOME /opt/apache-jmeter-${JMETER_VERSION}
ENV	JMETER_BIN ${JMETER_HOME}/bin
ENV JMETER_DOWNLOAD_URL https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz

# Install necessary packages
RUN apk update && apk upgrade
RUN apk add ca-certificates && update-ca-certificates

# Use the official OpenJDK 8
RUN apk add --update openjdk8-jre tzdata curl unzip bash
RUN apk add --no-cache nss
RUN rm -rf /var/cache/apk/*

# Create necessary directories
RUN mkdir -p /tmp/dependencies

# Download JMeter
RUN curl -L --silent ${JMETER_DOWNLOAD_URL} >  /tmp/dependencies/apache-jmeter-${JMETER_VERSION}.tgz

# Extract JMeter
RUN mkdir -p /opt
RUN tar -xzf /tmp/dependencies/apache-jmeter-${JMETER_VERSION}.tgz -C /opt

# Clean up
RUN rm -rf /tmp/dependencies

# Set global PATH such that "jmeter" command is found
ENV PATH $PATH:$JMETER_BIN

WORKDIR	${JMETER_HOME}

# Default command
#CMD ["tail", "-f", "/dev/null"]
