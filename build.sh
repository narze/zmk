#!/bin/bash

set -xe

SIDES=(left right)
for side in ${SIDES[@]}
do
	rm -rf /workspaces/zmk-config/build/aurora_lily58_$side.build
	west build -b nice_nano_v2 -s /workspaces/zmk/app -d /workspaces/zmk-config/build/aurora_lily58_$side.build  -- -DSHIELD="splitkb_aurora_lily58_$side nice_view_adapter nice_view" -DZMK_CONFIG="/workspaces/zmk-config/config"
	cp /workspaces/zmk-config/build/aurora_lily58_$side.build/zephyr/zmk.uf2 /workspaces/zmk-config/build/aurora_lily58_$side.uf2
done

echo "Both sides are built for Aurora Lily58"
