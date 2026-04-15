FROM maven:latest AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn package -DskipTests

FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app1
COPY --from=build /app/target/*.jar output.jar
EXPOSE 8080
CMD ["java","-jar","output.jar"]
