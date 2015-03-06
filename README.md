docker-arch-cups
================

Based on ticosax/cups-in-docker.

Changed to allow cups to run in Arch Linux (tested with version updated in 2015-03).
Uses a base-image compiled for the Raspberry Pi 2, but it should just work if
you switch to a x86 base-image of Arch.

```bash
docker run -e CUPS_USER_ADMIN=admin -e CUPS_USER_PASSWORD=secr3t -p 6631:631/tcp linucc/docker-arch-cups
```
