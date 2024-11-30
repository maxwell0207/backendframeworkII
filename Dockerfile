# Etapa 1: Usar uma imagem com JDK 21
FROM openjdk:21-jdk-slim AS build

# Definir o diretório de trabalho
WORKDIR /app

# Copiar os arquivos do projeto
COPY . /app

# Rodar o Maven para compilar o projeto
RUN mvn clean install -DskipTests

# Etapa 2: Rodar a aplicação usando OpenJDK
FROM openjdk:21-jdk-slim

WORKDIR /app

# Copiar o JAR compilado da etapa anterior
COPY --from=build /app/target/catalogo-backend-0.0.1-SNAPSHOT.jar /app/catalogo-backend.jar

# Expor a porta onde a aplicação vai rodar
EXPOSE 8080

# Comando para rodar a aplicação
CMD ["java", "-jar", "catalogo-backend.jar"]
