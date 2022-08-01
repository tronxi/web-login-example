FROM maven as builder
COPY . .
RUN mvn package spring-boot:repackage

FROM openjdk:11.0.8-slim-buster
COPY --from="builder" /target/web-login-core-0.0.1-SNAPSHOT.jar .
CMD java -jar -Dspring.profiles.active=${profile} web-login-core-0.0.1-SNAPSHOT.jar --secretToken=${secretToken} --dbHost=${dbHost} --dbPort=${dbPort} --dbUser=${dbUser} --dbPassword=${dbPassword} --dbDdlAuto=${dbDdlAuto}
