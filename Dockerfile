FROM node:12-alpine3.12
LABEL maintainer="Ferdinand Prantl <prantlf@gmail.com>"

# tools for inspection, installing dependencies from git and running tests in the browser
RUN apk --no-cache add gawk git chromium

# global node build tools
RUN npm i -g grunt-cli@1

# populate the npm cache with core modules to speed up the build
COPY app /app/
WORKDIR /app
RUN PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true npm i --cache /.npm --no-audit --progress=false && \
  rm -r node_modules package* .ncurc.yml

# include a script for a default build
COPY entrypoint.sh /
RUN chmod a+x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
