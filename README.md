# varnish-overlay
This image can be used to scale up varnish, sharing a pre-seeded cache.

1. Mount a volume, containing the seeded cache, on /overlay/lowerdir.
2. Mount /mnt from the host on /overlay/hostdir.

### Capabilities
Needs SYS_ADMIN, CHOWN, DAC_OVERRIDE, FOWNER, SETGID, SETUID. Other capabilities can be dropped.
