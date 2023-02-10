#!/bin/bash
set -euxo pipefail

git config --global --add safe.directory "$(pwd)"
/cnb/lifecycle/creator -app "$(pwd)" ghcr.io/superorbital/cnb-sample-go:latest
