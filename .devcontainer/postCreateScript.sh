#!/usr/bin/bash

set -euo pipefail

npm install --global --ignore-scripts @earendil-works/pi-coding-agent
npm install --global markdownlint-cli2

pip3 install --break-system-packages pre-commit
pre-commit install
