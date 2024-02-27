HOME = /home/lbusi
USER = lbusi
all:
	mkdir -p $(HOME)/data/volume_nginx
	mkdir -p $(HOME)/data/volume_mariadb
	docker compose -f srcs/docker-compose.yml build
	docker compose -f srcs/docker-compose.yml up -d

install :
	apt update -y
	apt install ca-certificates curl gnupg lsb-release -y
	install -m 0755 -d /etc/apt/keyrings
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
	gpg --batch --yes --dearmor -o /etc/apt/keyrings/docker.gpg
	chmod a+r /etc/apt/keyrings/docker.gpg
	echo "deb [arch=$(shell dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
	https://download.docker.com/linux/ubuntu jammy stable" | \
	tee /etc/apt/sources.list.d/docker.list > /dev/null
	apt update -y
	apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
	sh -c -e "echo '127.0.0.1 lbusi.42.fr' >> /etc/hosts";
	sh -c -e "echo '127.0.0.1 www.lbusi.42.fr' >> /etc/hosts";


stop:
	docker compose -f srcs/docker-compose.yml down

prune: stop
	rm -rf /home/lbusi/data/
	docker system prune -af

re: prune all

.PHONY: all stop prune re
