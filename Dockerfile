FROM archlinux:latest
COPY gendb.sh /gendb.sh
ENTRYPOINT ["/gendb.sh"]
