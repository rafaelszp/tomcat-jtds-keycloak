docker.build: 
	docker build --tag rafaelszp/tomcat-jtds-keycloak:${TAG} . -f Dockerfile

docker.push: 
	docker push rafaelszp/tomcat-jtds-keycloak:${TAG}


