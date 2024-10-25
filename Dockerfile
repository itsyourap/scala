ARG JDK_VERSION=eclipse-temurin-alpine-22_36
ARG SBT_VERSION=1.10.3
ARG SCALA_VERSION=3.5.2

# Use the official sbt image as a base image
FROM sbtscala/scala-sbt:${JDK_VERSION}_${SBT_VERSION}_${SCALA_VERSION}

# Run a dummy project to fetch all runtime dependencies
RUN mkdir -p /tmp/dummy-project
RUN echo 'object Main { def main(args: Array[String]) = println("Dummy") }' > /tmp/dummy-project/Main.scala
RUN cd /tmp/dummy-project && scala Main.scala
RUN rm -rf /tmp/*

# Run scala as default command
CMD ["scala"]