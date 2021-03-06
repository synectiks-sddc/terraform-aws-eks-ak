#!/usr/bin/env bash
#
# Script to release a new Terraform module version.

set -e

if [ -z "$GH_TOKEN" ]
then
    echo "A valif GitHub token must be set via the environment variable GH_TOKEN"
    exit 1
fi

docker run -w /app --rm -v $(pwd):/app -e GH_TOKEN=$GH_TOKEN synectiks-code/semantic-release:17.0.2 -r https://github.com/synectiks-sddc/terraform-aws-eks --no-ci