# SPRING BOOT con DOCKER - Tutorial Completo Fácil
# https://www.youtube.com/watch?v=qcE4A81OAI0

# Spring Boot en Render.com: ¡Despliega tu app en minutos!
# https://www.youtube.com/watch?v=2rkoryDkf6o
# --------------------------------------------------
#Versión con multi-stage build (eclipse-temurin:21-jdk AS builder y eclipse-temurin:21-jre)
#Pros:
#    Crea una imagen final más pequeña, ya que solo incluye el JRE (Java Runtime Environment) necesario para ejecutar la aplicación.
#    Aprovecha la caché de Docker para la construcción de la aplicación, lo que acelera las construcciones posteriores.
#    Separa la construcción de la aplicación de la ejecución, lo que mejora la seguridad y la organización.
#    It is considered a best practice.
#
#Cons:
#    Un poco más compleja de entender al principio.

#For production, the multistage dockerfile is highly recommended.
#La versión con multi-stage build es la mejor práctica y ofrece ventajas significativas en términos de tamaño de imagen, eficiencia y seguridad.
# --------------------------------------------------
# https://docs.docker.com/get-started/docker-concepts/building-images/multi-stage-builds/#create-the-dockerfile
# 1. Create a Dockerfile

# Stage 1: Build the application
#FROM <image>
FROM eclipse-temurin:21-jdk AS builder

## Set the working directory
## WORKDIR <directory>
WORKDIR /app

## Copy the application code
## COPY <src> <dest>
COPY . .

## Build the application (requires Maven or Gradle)
## RUN <command>
RUN ./mvnw clean package -DskipTests


# https://docs.docker.com/get-started/docker-concepts/building-images/multi-stage-builds/#use-multi-stage-builds
# Stage 2: Run the application
# FROM <image>
FROM eclipse-temurin:21-jre

## Set the working directory
## WORKDIR <directory>
WORKDIR /app

## Copy the JAR file from the builder stage
## COPY <src> <dest>
COPY --from=builder  /app/target/*.jar app.jar

## Expose the port the app will run on
## EXPOSE <port> [<port>/<protocol>...]
EXPOSE 8081

## Add the ENTRYPOINT to run the application
## Command to run the application when the container starts
# The exec form, which is the preferred form:
#   ENTRYPOINT ["executable", "param1", "param2"]
ENTRYPOINT ["java", "-jar", "app.jar"]
# --------------------------------------------------
# pwd
# ~/IdeaProjects/helloWorld

# 2. Build the Docker Image
# docker build -t spring-boot-docker .

# 3. Run the Docker Image Locally (Optional) (run the container)
    # -d  -- Run container in background and print container ID
    # -p  -- Publish a container's port(s) to the host
    # --name containerName
# docker run -d -p 8081:8081 --name helloWorld-container spring-boot-docker
# docker run -d -p 8081:8081 --name helloWorld-container -e TZ="America/Argentina/Buenos_Aires" spring-boot-docker
# docker run -d -p 8081:8081 --name helloWorld-container -e TZ="Etc/GMT+3" spring-boot-docker

# docker exec helloWorld-container date
#   Fri Feb 28 12:58:00 AM -03 2025
# docker exec helloWorld-container date -Iseconds;
#   2025-02-28T01:01:06-03:00
# --------------------------------------------------
