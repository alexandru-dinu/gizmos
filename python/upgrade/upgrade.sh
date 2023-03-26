#!/usr/bin/env zsh

set -ex

conda update --all -c conda-forge

pip install --upgrade -r requirements.txt

conda clean --all

rm -rf ~/.cache/pip
