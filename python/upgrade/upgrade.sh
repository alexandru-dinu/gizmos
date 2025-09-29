#!/usr/bin/env zsh

set -ex

conda env update --file environment.yaml
conda clean --all
pip cache purge
