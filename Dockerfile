FROM huggla/varnish-alpine:20171212

USER root

RUN mkdir /varnishcache

USER varnish

VOLUME /overlay/lowerdir /mnt:/overlay/hostdir

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["mkdir -p /overlay/hostdir/`hostname`-upperdir /overlay/hostdir/`hostname`-workdir && mount -t overlay overlay -o lowerdir=/overlay/lowerdir,upperdir=/overlay/hostdir/`hostname`-upperdir,workdir=/overlay/hostdir/`hostname`-workdir /varnishcache && entry.sh"]
