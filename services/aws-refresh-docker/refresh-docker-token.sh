#!/usr/bin/env bash

set -eu

$(aws ecr get-login --no-include-email)
