#!/bin/bash
# REST call to init the pub/sub links between DSB and EC

echo "[PLAY] Initializing the DSB/EC subscriptions..."
curl $PLAY_PUBSUB
echo "[PLAY] Done!"