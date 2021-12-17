FROM archlinux:latest
RUN pacman -Sy wget python-pip python-wheel --needed --noconfirm --overwrite '*' 
COPY gendb.sh /gendb.sh
ENTRYPOINT ["/gendb.sh"]
