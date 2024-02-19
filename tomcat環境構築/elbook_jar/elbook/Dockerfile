FROM openjdk:11-jdk-slim
RUN mkdir -p /opt/src/main/resources/static/images/calligraphy
ENTRYPOINT ["java", "-jar", "/opt/ELBOOK2022-0.0.1-SNAPSHOT.jar", "${OPTS_ARGS}"]