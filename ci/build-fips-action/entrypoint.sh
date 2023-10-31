#!/usr/bin/env sh

PLATFORM=$1

git config --global --add safe.directory /github/workspace

# Install builder
cd otelcolbuilder || exit 1
mkdir "${HOME}/bin"
export PATH="${HOME}/bin:${PATH}"
make install-builder

# Build otelcol-sumo
make otelcol-sumo-"${PLATFORM}" FIPS_SUFFIX="-fips" CGO_ENABLED="1"
