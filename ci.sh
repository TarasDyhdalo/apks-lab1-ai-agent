#!/usr/bin/env sh
set -eu

if [ ! -x ".venv/bin/python" ]; then
    python3 -m venv .venv
fi
.venv/bin/python -m pip install -r requirements-dev.txt
.venv/bin/python -m pytest
mkdir -p build
.venv/bin/python -m zipapp src/hello -o build/hello.pyz
.venv/bin/python build/hello.pyz
