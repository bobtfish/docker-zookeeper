FROM jplock/zookeeper:3.4.6
ADD run.sh /run.sh
RUN chmod 755 /run.sh
ENTRYPOINT "/run.sh"
CMD []

