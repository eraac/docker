TAG=7.2

build:
	docker build . -t eraac/php:${TAG} --force-rm

clean:
	docker rmi eraac/php:${TAG}

push:
	docker push eraac/php:${TAG}

