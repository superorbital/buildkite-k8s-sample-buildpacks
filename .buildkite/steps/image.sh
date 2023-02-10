#!/bin/bash
set -euxo pipefail

git config --global --add safe.directory "$(pwd)"
/cnb/lifecycle/creator -app "$(pwd)" -report /tmp/report.toml ghcr.io/superorbital/cnb-sample-go:latest

DIGEST=$(cat /tmp/report.toml  | grep digest | awk '{print $3}' | tr -d '"')

buildkite-agent meta-data set "image" "ghcr.io/superorbital/cnb-sample-go@${DIGEST}"