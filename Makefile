# 支持 multi-arch
VERSION ?= dev  # 本地开发版
SHELL := bash

.PHONY: build
build:
	docker build -t yourname/runlike:$(VERSION) .

.PHONY: rebuild
rebuild:
	docker build --no-cache -t yourname/runlike:$(VERSION) .

.PHONY: push
push: rebuild
	docker push yourname/runlike:$(VERSION)

# 支持多架构构建
.PHONY: buildx
buildx:
	docker buildx build \
	--platform linux/amd64,linux/arm64 \
	-t yourname/runlike:$(VERSION) \
	--push .

# 测试安装成功
.PHONY: test
test:
	docker run --rm yourname/runlike --help