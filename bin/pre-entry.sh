#!/bin/sh -e

mkdir -p /var/lib/varnish/`hostname` \
         /overlay/hostdir/`hostname`-upperdir \
         /overlay/hostdir/`hostname`-workdir
         
chown varnish:varnish /var/lib/varnish/`hostname` \
                      /overlay/hostdir/`hostname`-upperdir \
                      /overlay/hostdir/`hostname`-workdir
                      
mount -t overlay overlay -o lowerdir=/overlay/lowerdir,upperdir=/overlay/hostdir/`hostname`-upperdir,workdir=/overlay/hostdir/`hostname`-workdir /varnishcache
