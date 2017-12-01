FROM huggla/ubuntu-debootstrap-varnish:20171108

RUN mkdir /varnishcache

VOLUME /overlay/lowerdir /mnt:/overlay/hostdir

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["mkdir -p /overlay/hostdir/`hostname`-upperdir /overlay/hostdir/`hostname`-workdir && mount -t overlay overlay -o lowerdir=/overlay/lowerdir,upperdir=/overlay/hostdir/`hostname`-upperdir,workdir=/overlay/hostdir/`hostname`-workdir /varnishcache && entry.sh"]
