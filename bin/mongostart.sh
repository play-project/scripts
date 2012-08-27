#!/bin/bash

# Start the mongodb server in a specific folder for the PLAY project
#
# Notes
# Mongodb will not create any folder, you have to create 
# $PLAY_STABLE/mongodb/data folder and $PLAY_STABLE/mongodb/logs/mongodb.log file
#

echo "[PLAY] Starting the mongodb service..."
mongod --fork --dbpath $PLAY_STABLE/mongodb/data --logpath $PLAY_STABLE/mongodb/logs/mongodb.log --logappend