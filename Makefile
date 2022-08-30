TAG ?= latest

%.docker.build:
	docker build --no-cache --pull -t octoperf/$*:latest octoperf/$*:$(TAG) $*/

%.docker.push: %.docker.build
	docker push octoperf/$*:latest octoperf/$*:$(TAG)
