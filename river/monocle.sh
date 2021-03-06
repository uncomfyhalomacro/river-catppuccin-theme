#!/usr/bin/env bash

# Monocle Layout
riverctl send-layout-cmd stacktile "all_primary true"
riverctl send-layout-cmd stacktile "primary_sublayout full"
riverctl send-layout-cmd stacktile "primary_position left"
riverctl send-layout-cmd stacktile "primary_count 2"
riverctl send-layout-cmd stacktile "primary_ratio 0.5"
riverctl send-layout-cmd stacktile "outer_padding 4"
riverctl send-layout-cmd stacktile "inner_padding 2"
riverctl send-layout-cmd stacktile "secondary_sublayout rows"
riverctl send-layout-cmd stacktile "secondary_count 0"
riverctl send-layout-cmd stacktile "secondary_ratio 0.5"
riverctl send-layout-cmd stacktile "remainder_sublayout stack"

