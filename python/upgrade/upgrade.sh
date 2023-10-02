#!/usr/bin/env zsh

set -ex

conda env update -f environment.yaml

conda clean --all

rm -rf ~/.cache/pip
