#!/bin/bash -e
HERE=$(dirname $0)

VERSION_V_SPECIAL=$(git describe --tags)
VERSION_SPECIAL=${VERSION_V_SPECIAL#v}
VERSION=${VERSION_SPECIAL%%-*}

VERSION=$VERSION \
VALUES_DOC=$(awk '/# DOC: / { gsub("^.*DOC: ",""); print $0 }' $HERE/values.yaml) \
envsubst <README.t.md >README.md
