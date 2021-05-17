clean ::
	docker image rm smartui-build

lint ::
	docker run --rm -i \
		-v ${PWD}/.hadolint.yaml:/bin/hadolint.yaml \
		-e XDG_CONFIG_HOME=/bin hadolint/hadolint \
		< Dockerfile

build ::
	docker build -t smartui-build .
	docker tag smartui-build prantlf/smartui-build:21.4
	docker tag smartui-build prantlf/smartui-build:latest

run ::
	docker run --rm -it smartui-build sh

login ::
	docker login --username=prantlf

push ::
	docker push prantlf/smartui-build:21.4
	docker push prantlf/smartui-build:latest
