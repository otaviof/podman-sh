#!/bin/bash
#
# Automate running the command "dlv" (Delve).
#

set -e

function die() {
    echo $* >&2
    exit 1
}

# delve sub-command must be informed
[[ -n "$1" ]] || die "Delve sub-command is not informed!"
SUB_COMMAND="$1"

# searching for the package name in go.mod
GO_MODULE_NAME=$(grep module go.mod |awk '{print $2}')
[[ -z $GO_MODULE_NAME ]] && die "Can't find Go module name in 'go.mod'!"

# appending the sub-package in main package found in go.mod
SUB_PACKAGE="$2"
[[ -z $SUB_PACKAGE ]] || GO_MODULE_NAME="${GO_MODULE_NAME}/${SUB_PACKAGE}"

set -x
exec dlv $SUB_COMMAND \
    --listen=":40000" \
    --headless="true" \
    --api-version="2" \
    --log \
    $GO_MODULE_NAME