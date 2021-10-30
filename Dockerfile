FROM openjdk:8u242-jdk-stretch

RUN apt-get update && wget -qO- https://deb.nodesource.com/setup_8.x | bash - && apt-get install -y nodejs libpq-dev g++ make

# Copy the current directory into the Docker image
COPY . /migrator
# Set working directory for future use
WORKDIR /migrator

ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/lib/jvm/java-8-openjdk-amd64/jre/lib/amd64/server

# you can run below tasks after run docker-compose run migrator
#RUN npm install
#RUN npm run lint
#RUN npm test
CMD ["/bin/bash"]
