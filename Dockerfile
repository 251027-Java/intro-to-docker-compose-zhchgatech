# TODO: Select Base Image
# FROM ...


# TODO: Copy JAR file
# COPY ...

# TODO: Set Entrypoint
# ENTRYPOINT ...

FROM eclipse-temurin:25-noble AS build
WORKDIR /app
COPY ./demo ./ 
RUN ./mvnw dependency:go-offline
RUN ./mvnw package -DskipTests 

# Second Stage - Run the packaged app
FROM eclipse-temurin:25-jre-alpine AS run
WORKDIR /app
COPY --from=build /app/target/demo-0.0.1-SNAPSHOT.jar /app/
ENTRYPOINT [ "java", "-jar", "./demo-0.0.1-SNAPSHOT.jar"]

EXPOSE 8080