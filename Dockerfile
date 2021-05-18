FROM node:14-alpine3.13
LABEL maintainer="Ferdinand Prantl <prantlf@gmail.com>"

# tools for inspection, installing dependencies from git and running tests in the browser
RUN apk --no-cache add curl zip unzip gawk git chromium

# install a new stable npm with package log fixed and the global node build tools
RUN npm i -g grunt-cli@1

# prepare the build directory
RUN mkdir -p /app
WORKDIR /app

# preset the environment for the best performance
ENV CHROME_BIN=/usr/bin/chromium-browser
ENV CHROME_PATH=$CHROME_BIN
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV KARMA_EARLYERRORREPORT=false
ENV KARMA_REPORTONCOMPLETE=true
ENV NPM_INSTALL="npm ci --cache /.npm --prefer-offline --no-audit --progress=false --unsafe-perm"
ENV NPM_ADD="npm i --no-save --cache /.npm --prefer-offline --no-audit --progress=false --unsafe-perm"

# include a script for a default build
COPY entrypoint.sh /
RUN chmod a+x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
