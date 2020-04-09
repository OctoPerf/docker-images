
%.docker.build:
	docker build -t octoperf/$* $*/

%.docker.push: %.docker.build
	docker push octoperf/$*