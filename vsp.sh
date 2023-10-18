#!/usr/bin/env bash
# vivaldi sync prefs

jq=$(which jq)
# in case you want/need to hard-code path to jq
# jq = "/path/to/jq"

if [ -z "$jq" ]; then
    echo "Could not find jq binary.  Please install jq and/or ensure it's in your \$PATH"
    exit 127
fi



echo $jq
