TAG ?= latest

%.docker.build:
	docker build --build-arg TAG=${TAG} --no-cache --pull -t octoperf/$*:latest -t octoperf/$*:$(TAG) $*/

%.docker.push: %.docker.build
	docker push octoperf/$*:latest 
	docker push octoperf/$*:$(TAG)
