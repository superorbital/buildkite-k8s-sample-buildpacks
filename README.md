# Buildkite K8s Stack Buildpack Build

This repository demonstrates how to use [Cloud Native Buildpacks](https://buildpacks.io/) to build a simple go application on Kubernetes with the Buildkite agent stack.

While the CNB project comes with a CLI tool `pack`, that tool requires access to a native docker socket to execute and upload the buildpack builds. The cnb `lifecycle` steps can be invoked directly, as we do in [this script](./.buildkite/steps/image.sh) with `/cnb/lifecycle/creator ...`.

The image push is authorized by a [dockerconfigjson type secret](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/#registry-secret-existing-credentials) that is mounted onto the agent pod with a `volumeMount`. In this case, we push to GHCR authorized by a Github personal access token. Authorization for other container registries can be provided natively as well, such as Google, AWS, or Azure native authorization.

The advantages of buildpacks, such as caching, rebasing, and image layer assembly can still be maintained in this direct approach by passing flags to the `/cnb/lifecycle/creator` command. The `pack` CLI is strictly a nicety for spinning up a container with the correct arguments and volumes to build the requested image with the detected buildpacks.