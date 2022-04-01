docker.build: 
	docker build --tag rafaelszp/tomcat-jtds-keycloak:${TAG} . -f Dockerfile

docker.push: 
	docker push rafaelszp/tomcat-jtds-keycloak:${TAG}

docker.run: 
	docker run --rm --name tomcatbuild -it rafaelszp/tomcat-jtds-keycloak:${TAG} sh


