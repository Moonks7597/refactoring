FROM maven:3-jdk-11 AS build-env

# Set the working directory to /app
WORKDIR /app

# copy the pom.xml file to download dependencies
COPY pom.xml ./

# download dependencies as specified in pom.xml
# building dependency layer early will speed up compile time when pom is unchanged
RUN mvn verify --fail-never

# Copy the rest of the working directory contents into the container
COPY . ./

# Compile the application.
RUN mvn -Dmaven.test.skip=true package

# Build runtime image.
FROM openjdk:11-jdk
RUN apt-get update && apt-get -y install \
    vim

COPY --from=build-env /app/target /app/

EXPOSE 80
EXPOSE 443
#ENTRYPOINT ["java","-Xms128M", "-Xmx1024M", "-XX:+UseParNewGC", "-XX:ParallelGCThreads=4", "-XX:+UseConcMarkSweepGC", "-XX:CMSInitiatingOccupancyFraction=50", "-XX:+PrintGCDetails", "-XX:+PrintGCTimeStamps", "-XX:+PrintHeapAtGC", "-XX:+AggressiveOpts", "-Djava.net.preferIPv4Stack=true" ,"-jar", "/app/drms-0.0.1-SNAPSHOT.jar"]
ENTRYPOINT ["java","-Xms128M", "-Xmx1024M", "-jar", "/app/test.jar"]