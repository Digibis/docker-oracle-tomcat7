
TAG=digibis/oracle-tomcat7

DOCKER:=docker

HOST=localhost

CONTAINER_NAME=nueva_instancia

EXT_PORT_SHH=2222
EXT_PORT_TOMCAT=80
EXT_PORT_ORACLE=1521


PORT_MAP=-p ${EXT_PORT_SHH}:22 -p ${EXT_PORT_ORACLE}:1521 -p ${EXT_PORT_TOMCAT}:80
NAME_MAP=--name ${CONTAINER_NAME}


build:
	${DOCKER} build -t=${TAG} .

start:
	docker run -d ${PORT_MAP} ${NAME_MAP} ${TAG}

ssh:
	sshpass -padmin ssh -o StrictHostKeyChecking=no -t root@${HOST} -p ${EXT_PORT_SHH}

shell:
	${DOCKER} run -t --entrypoint /bin/bash -i ${PORT_MAP} ${NAME_MAP} --rm ${TAG}

stopcontainer:
	${DOCKER} stop ${CONTAINER_NAME}

rmcontainer:
	${DOCKER} rm ${CONTAINER_NAME}

rmimage:
	${DOCKER} rmi $$(docker images | grep '${TAG}' | awk '{print $$3}')

startcontainer:
	${DOCKER} start ${CONTAINER_NAME}

rmall: stopcontainer rmcontainer rmimage

init: build start

