#!/bin/bash

jq -s '.[0] * {"channel_group":{"groups":{"Application":{"groups": {"dfarm-coldstorage":.[1]}}}}}' config.json ./channels/dfarm-coldstorage.json > modified_config.json
