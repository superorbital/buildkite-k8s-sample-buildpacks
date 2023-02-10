#!/bin/bash
set -euxo pipefail

git config --global --add safe.directory "$(pwd)"
/cnb/lifecycle/creator -app "$(pwd)" -report /tmp/report.toml ghcr.io/superorbital/cnb-sample-go:latest
