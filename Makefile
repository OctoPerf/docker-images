
%.docker.build:
	docker build --no-cache --pull -t octoperf/$* $*/

%.docker.push: %.docker.build
	docker push octoperf/$*
