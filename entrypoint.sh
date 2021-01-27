#!/bin/sh

set -e

export CHROME_BIN=/usr/bin/chromium-browser
export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export KARMA_EARLYERRORREPORT=false
export KARMA_REPORTONCOMPLETE=true

INSTALL="ci --cache /.npm --prefer-offline --no-audit --progress=false"

case "$1" in
  install)
    npm $INSTALL
  ;;
  build)
    npm $INSTALL
    grunt
  ;;
  compile)
    grubnt compile
  ;;
  test)
    grunt test
  ;;
  *)
    exec "$@"
  ;;
esac
