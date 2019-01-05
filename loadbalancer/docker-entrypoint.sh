#!/bin/bash

set -x

test $POOL
test $URL
test $IP_POOL

/bin/confd -onetime -backend env
supervisorctl restart haproxy
