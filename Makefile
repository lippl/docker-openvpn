NAME = registry.staiger.it/kylemanna/openvpn
VERSION = latest

.PHONY: build build-nocache tag-latest push push-latest release git-tag-version

build:
	docker build --pull -f Dockerfile.duo -t $(NAME):$(VERSION) --rm .

build-nocache:
	docker build --pull -f Dockerfile.duo -t $(NAME):$(VERSION) --no-cache --rm .

tag:
	docker tag $(NAME):$(VERSION) $(NAME):$(VERSION)

tag-latest:
	docker tag $(NAME):$(VERSION) $(NAME):latest

push:
	docker push $(NAME):$(VERSION)

push-latest:
	docker push $(NAME):latest

release: build-nocache push

git-tag-version: release
	git tag -a v$(VERSION) -m "v$(VERSION)"
	git push origin v$(VERSION)
