# https://squidfunk.github.io/mkdocs-material/insiders/getting-started/#with-git
# 1. Create classic token at https://github.com/settings/tokens (1 day lifespan)
# 2. Update token at https://github.com/OctoPerf/mkdocs-material-insiders/settings/secrets/actions (Repository secrets)
# 4. Create a new release (https://github.com/OctoPerf/mkdocs-material-insiders/releases)
# 5. Wait for GitHub actions to build the docker image (https://github.com/OctoPerf/mkdocs-material-insiders/actions)
# 6. Remove token when done
GHCR_TOKEN = xxx
GH_USERNAME = geraldpereira
DOCKER_IMAGE = ghcr.io/octoperf/mkdocs-material-insiders
TAG ?= latest

docker.pull:
	docker login -u $(GH_USERNAME) -p $(GHCR_TOKEN) ghcr.io
	docker pull $(DOCKER_IMAGE)

docker.build:
	docker build --build-arg TAG=${TAG} --no-cache --pull -t octoperf/mkdocs-material-insiders:latest -t octoperf/mkdocs-material-insiders:$(TAG) .

docker.push: docker.build
	docker push octoperf/mkdocs-material-insiders:latest
	docker push octoperf/mkdocs-material-insiders:$(TAG)
