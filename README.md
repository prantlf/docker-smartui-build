# prantlf/smartui-build

[Docker] image: Node.js LTS on Alpine Linux with Git, Grunt, Chromium and other tools to build a Smart UI project.

[![nodesource/node](http://dockeri.co/image/prantlf/smartui-build)](https://hub.docker.com/repository/docker/prantlf/smartui-build/)

[This image] is supposed to build and test [Node.js packages (NPM modules)], which include dependencies pulled by [Git], build script for [Grunt], and their tests need [headless Chromium] driven by [Karma] or [Puppeteer]. It is built automatically on the top of the tag `<version>-alpine<version>` of the [Node.js] image from the [node repository], so that it always runs the latest patch of the current [LTS version] on the specific [Alpine Linux].
  
## Tags

A new image will be released for every next quarter with the tag `<year>.<quarter>`. It is intended to be used for the development of a project, that will be released in that quarter.

[`latest`], [`21.4`], [`21.3`], [`21.2`]

## Installation

You will likely choose a tag with the version number of your release target quarter.

    docker pull prantlf/smartui-build
    # or
    docker pull prantlf/smartui-build:21.4

## Usage

Enter the root directory of a Smart UI project, install its dependencies, build and test it:

    docker run --rm -it -v "$(pwd)":/app prantlf/smartui-build:21.4 build

Except for `build`, you can execute `compile` and `test`, which map to the according Grunt tasks. Otherwise you can run an executable by appending its name on the command line:

    docker run --rm -it smartui-build sh
    docker run --rm -it smartui-build node

If you use a custom build script you can access the NPM module cache at `/.npm`.

See also [how to use the base node image].

### Environment Variables

A couple of environment varibales you can rely on in the build scripts:

    CHROME_BIN=/usr/bin/chromium-browser
    CHROME_PATH=$CHROME_BIN
    PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
    KARMA_EARLYERRORREPORT=false
    KARMA_REPORTONCOMPLETE=true
    NPM_INSTALL="npm ci --cache /.npm --prefer-offline --no-audit --progress=false --unsafe-perm"
    NPM_ADD="npm i --no-save --cache /.npm --prefer-offline --no-audit --progress=false --unsafe-perm

## Maintenance

[Git], [Grunt] and [Chromium] have to be updated from time to time by triggering a new build manually.

Update the pre-cached NPM modules:

    make update

Build the image:

    make lint build

Enter an interactive shell inside the created image:

    make run

Push the image to the docker hub:

    make login push

## License

Copyright (c) 2021 Ferdinand Prantl

Licensed under the ISC license.

[Docker]: https://www.docker.com/
[This image]: https://hub.docker.com/repository/docker/prantlf/smartui-build
[`latest`]: https://hub.docker.com/repository/docker/prantlf/smartui-build/tags
[`21.4`]: https://hub.docker.com/repository/docker/prantlf/smartui-build?tab=tags&name=21.4
[`21.3`]: https://hub.docker.com/repository/docker/prantlf/smartui-build?tab=tags&name=21.3
[`21.2`]: https://hub.docker.com/repository/docker/prantlf/smartui-build?tab=tags&name=21.2
[Node.js packages (NPM modules)]: https://docs.npmjs.com/about-packages-and-modules
[Git]: https://git-scm.com/
[Grunt]: https://gruntjs.com/
[headless Chromium]: https://chromium.googlesource.com/chromium/src/+/lkgr/headless/README.md
[Chromium]: https://www.chromium.org/
[Karma]: https://karma-runner.github.io/latest/index.html
[Puppeteer: https://pptr.dev/
[node repository]: https://hub.docker.com/_/node
[LTS version]: https://nodejs.org/en/about/releases/
[Node.js]: https://nodejs.org/
[Alpine Linux]: https://alpinelinux.org/
[how to use the base node image]: https://github.com/nodejs/docker-node/blob/master/README.md#how-to-use-this-image
