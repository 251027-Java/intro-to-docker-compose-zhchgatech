FROM eclipse-temurin:17-jdk-alpine AS build
WORKDIR /app
COPY target/*.jar app.jar
RUN ./mvnw dependency:go-offline
RUN ./mvnw package -DskipTests

ENTRYPOINT [ "java", "-jar", "app.jar"]

EXPOSE 8080