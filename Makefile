IMAGE ?= christopherhein/workshopper:latest

.PHONY: build
build:
	docker build -t ${IMAGE} .

.PHONY: release
release: build
	docker push ${IMAGE}
