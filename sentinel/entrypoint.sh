#!/bin/sh

sed -i "s/\$REDIS_PORT/${REDIS_PORT:-6379}/g" /etc/redis/sentinel.conf
sed -i "s/\$SENTINEL_PORT/${SENTINEL_PORT:-26379}/g" /etc/redis/sentinel.conf
sed -i "s/\$SENTINEL_QUORUM/${SENTINEL_QUORUM:-2}/g" /etc/redis/sentinel.conf
sed -i "s/\$SENTINEL_DOWN_AFTER/${SENTINEL_DOWN_AFTER:-30000}/g" /etc/redis/sentinel.conf
sed -i "s/\$SENTINEL_FAILOVER/${SENTINEL_FAILOVER:-30000}/g" /etc/redis/sentinel.conf
sed -i "s/\$REDIS_MASTER_NODE/${REDIS_MASTER_NODE:-redis-master}/g" /etc/redis/sentinel.conf
sed -i "s/\$SENTINEL_MASTER_KEY/${SENTINEL_MASTER_KEY:-mymaster}/g" /etc/redis/sentinel.conf

exec docker-entrypoint.sh redis-server /etc/redis/sentinel.conf --sentinel
