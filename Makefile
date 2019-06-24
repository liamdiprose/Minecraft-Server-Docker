all: docker

minecraft_server.1.14.3.jar:
	curl -L https://launcher.mojang.com/v1/objects/d0d0fe2b1dc6ab4c65554cb734270872b72dadd6/server.jar -o $@
	chmod +x $@

docker: Dockerfile minecraft_server.1.14.3.jar
	docker build . -t minecraft_server:1.14.3 

run: docker
	docker run --volume "$(PWD)/minecraft-data:/minecraft_data" -p 25565:25565 minecraft_server:1.14.3

.PHONY = clean distclean
clean:
	rm -f minecraft_server.1.14.3.jar

distclean: clean
	docker rmi minecraft_server:1.14.3
