#!/bin/bash

set -e

LAX_ENV=development
LAX_MAINTENANCE=0
PLACK_ENV=production

RUN_COMMAND="
env
LAX_ENV=$LAX_ENV
LAX_MAINTENANCE=$LAX_MAINTENANCE
perl script/lax-server
"
echo $RUN_COMMAND
exec $RUN_COMMAND
