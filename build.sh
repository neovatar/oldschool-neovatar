#!/usr/bin/env bash
set -euox pipefail

mkdir -p build
rm -rf build/*

./tools/dungeondraft-pack -O src build
cp LICENSE.md build
cp README.md build
cp CHANGELOG.md build

pushd build
zip oldschool-neovatar.zip *
popd
