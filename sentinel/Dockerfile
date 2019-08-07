FROM redis:5.0.5-alpine


ADD sentinel.conf /etc/redis/sentinel.conf
RUN chown redis:redis /etc/redis/sentinel.conf
ENV SENTINEL_QUORUM 2
ENV SENTINEL_DOWN_AFTER 3000
ENV SENTINEL_FAILOVER 3000
ENV SENTINEL_PORT 26379
ENV REDIS_MASTER_NODE redis-master
ADD entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
