#!/bin/bash
set -eu

#manually called to start reading twitter, not turned off by airflow

. ~/address.sh
#TODO: read hostname from address.sh
ssh -i ~/.ssh/insight-andy.pem ubuntu@spark1 -t 'tmux new-session -d -s twitter_stream ". ~/address.sh; . ~/.profile ; spark-submit --master spark://ip-172-31-11-143:7077 --driver-memory 1G --executor-memory 1G --packages org.apache.spark:spark-streaming-kafka_2.10:1.5.1 ~/insightproject/realtime_processing/twitter_stream.py"'