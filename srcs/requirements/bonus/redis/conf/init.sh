#!/bin/sh

echo "maxmemory 256mb" >> /etc/redis/redis.conf 
echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf
echo "bind 127.0.0.1" >> /etc/redis/redis.conf

# exec redis-cli monitor
exec redis-server --port 6379 --protected-mode no
