IMAGE_REGISTRY=quay.io
USERNAME=agreene
REPOSITORY=hello-go

# Docker

build:
	docker build -t $(IMAGE_REGISTRY)/$(USERNAME)/$(REPOSITORY) .

run-local: build
	docker run --detach --publish 6060:8080 --name $(REPOSITORY) --rm $(IMAGE_REGISTRY)/$(USERNAME)/$(REPOSITORY)

curl-docker:
	curl localhost:6060

push: build
	docker push $(IMAGE_REGISTRY)/$(USERNAME)/$(REPOSITORY)

clean:
	docker kill $(REPOSITORY)

# Kubernetes

kubectl-proxy:
	kubectl proxy --port=9000

curl-k8s:
	curl localhost:9000/api/v1/namespaces/default/services/hello-go:8080/proxy/
