FROM maven:3-openjdk-21 as builder
LABEL authors="fernandoR457"

WORKDIR /build

COPY . .

RUN mvn clean package -DskipTests -Dcheckstyle.skip=true

FROM openjdk:21-ea-21-jdk-slim

WORKDIR /app

COPY --from=builder /build/target/*.jar /app/app.jar

CMD ["java", "-jar", "app.jar"]
