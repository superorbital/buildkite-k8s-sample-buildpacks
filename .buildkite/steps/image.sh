#!/bin/bash
set -euxo pipefail

git config --global --add safe.directory "/workspace"
/cnb/lifecycle/creator ghcr.io/superorbital/cnb-sample-go:latest
