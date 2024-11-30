# Etapa 1: Build da aplicação usando o Maven
FROM maven:3.8.4-openjdk-11-slim AS build
WORKDIR /app
COPY . /app
RUN mvn clean install -DskipTests

# Etapa 2: Rodar a aplicação usando OpenJDK
FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build /app/target/catalogo-backend-0.0.1-SNAPSHOT.jar /app/catalogo-backend.jar
CMD ["java", "-jar", "catalogo-backend.jar"]
