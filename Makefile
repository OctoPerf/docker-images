
%.docker.build:
	docker build --pull -t octoperf/$* $*/

%.docker.push: %.docker.build
	docker push octoperf/$*
