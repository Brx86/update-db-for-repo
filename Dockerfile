FROM archlinux:latest
RUN pacman -Syu git --needed --noconfirm --overwrite '*' && sed -i '/E_ROOT/d' /usr/bin/makepkg
COPY gendb.sh /gendb.sh
ENTRYPOINT ["/gendb.sh"]
