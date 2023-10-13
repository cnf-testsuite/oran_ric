#!/bin/bash

cat << EOF > /flexric.conf
[NEAR-RIC]
NEAR_RIC_IP = $POD_IP

[XAPP]
DB_DIR = /tmp/
EOF

/ric/build/examples/ric/nearRT-RIC -c /flexric.conf
