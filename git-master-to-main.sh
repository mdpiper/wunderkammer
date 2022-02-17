#! /usr/bin/env bash
# Rename the primary branch in a local repository.

git branch -m master main
git fetch origin
git branch -u origin/main main
git remote set-head origin -a
