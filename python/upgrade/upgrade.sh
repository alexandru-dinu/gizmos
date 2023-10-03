#!/usr/bin/env zsh

set -ex

# also remove any dependencies that are no longer required
conda env update --file environment.yaml --prune

# remove index cache, lock files, unused cache packages, tarballs, and logfiles
conda clean --all

# remove all items from the cache
pip cache purge
