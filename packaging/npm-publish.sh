#!/bin/bash

NIMIQ_VERSION=`grep -m 1 version ../package.json`

cat > npm/package.json <<_EOF_
{
  "name": "@nimiq/core-web",
$NIMIQ_VERSION
  "browser": "nimiq.js",
  "homepage": "https://nimiq.com/",
  "description": "",
  "author": {
    "name": "The Nimiq Core Development Team",
    "url": "https://nimiq.com/"
  },
  "license": "Apache-2.0",
  "bugs": {
    "url": "https://github.com/nimiq-network/core/issues"
  },
  "repository": {
    "type": "git",
    "url": "https://github.com/nimiq-network/core.git"
  },
  "files": [
    "nimiq.js",
    "nimiq.js.map",
    "package.json",
    "VERSION",
    "web-babel.js",
    "web-babel.js.map",
    "web.js",
    "web.js.map",
    "web-offline.js",
    "web-offline.js.map",
    "worker.js",
    "worker-js.js",
    "worker.js.map",
    "worker-wasm.js",
    "worker-wasm.wasm"
  ]
}
_EOF_

cp ../dist/{nimiq.js,nimiq.js.map,VERSION,web-babel.js,web-babel.js.map,web.js,web.js.map,web-offline.js,web-offline.js.map,worker.js,worker-js.js,worker.js.map,worker-wasm.js,worker-wasm.wasm} npm/
cd npm
npm publish --dry-run
