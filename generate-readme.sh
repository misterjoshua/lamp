#!/bin/bash -e
HERE=$(dirname $0)

VALUES_DOC=$(awk '/# DOC: / { gsub("^.*DOC: ",""); print $0 }' $HERE/values.yaml) \
envsubst <README.t.md >README.md
