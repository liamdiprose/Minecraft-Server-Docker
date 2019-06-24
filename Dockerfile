FROM openjdk:13-ea-alpine3.9

CMD mkdir /minecaft
COPY minecraft_server.1.14.3.jar /minecraft/

VOLUME /minecraft_data
WORKDIR /minecraft_data
EXPOSE 25565

CMD java -Xms1024M -jar /minecraft/minecraft_server.1.14.3.jar nogui
