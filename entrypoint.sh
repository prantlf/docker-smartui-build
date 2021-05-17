#!/bin/sh

set -e

case "$1" in
  install)
    $NPM_INSTALL
  ;;
  build)
    grunt
  ;;
  compile)
    grunt compile
  ;;
  test)
    grunt test
  ;;
  *)
    exec "$@"
  ;;
esac
