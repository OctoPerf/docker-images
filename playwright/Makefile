TAG ?= latest
PLAYWRIGHT_VERSION ?= 1.33.0

%.docker.build:
	docker build --build-arg PLAYWRIGHT_VERSION=${PLAYWRIGHT_VERSION} --no-cache --pull -t octoperf/$*:latest -t octoperf/$*:$(TAG) .

%.docker.push: %.docker.build
	docker push octoperf/$*:latest 
	docker push octoperf/$*:$(TAG)
