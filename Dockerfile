FROM openjdk:13-ea-alpine3.9

CMD mkdir /minecaft
WORKDIR /minecraft

COPY minecraft_server.1.14.3.jar /minecraft

ENTRYPOINT ["java". "-Xms1024M", "-jar", "./minecraft_server.1.14.3.jar", "nogui"]
