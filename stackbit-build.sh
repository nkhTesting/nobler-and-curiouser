#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5dfbfe2d102ba9001bbe087b/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5dfbfe2d102ba9001bbe087b
curl -s -X POST https://api.stackbit.com/project/5dfbfe2d102ba9001bbe087b/webhook/build/ssgbuild > /dev/null
jekyll build
curl -s -X POST https://api.stackbit.com/project/5dfbfe2d102ba9001bbe087b/webhook/build/publish > /dev/null
