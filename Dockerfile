FROM huggla/varnish-alpine:20171212

RUN mkdir /varnishcache \
 && chown -R varnish:varnish /varnishcache

VOLUME /overlay/lowerdir /mnt:/overlay/hostdir

ENV JAIL="unix,user=varnish"

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["mkdir -p /overlay/hostdir/`hostname`-upperdir /overlay/hostdir/`hostname`-workdir && mount -t overlay overlay -o lowerdir=/overlay/lowerdir,upperdir=/overlay/hostdir/`hostname`-upperdir,workdir=/overlay/hostdir/`hostname`-workdir /varnishcache && entry.sh"]
