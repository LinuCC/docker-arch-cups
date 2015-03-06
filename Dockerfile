FROM linucc/base-arch-rpi2

MAINTAINER Pascal Ernst "pascal.cc.ernst@gmail.com"

# Install cups
RUN pacman --noconfirm --needed -Sy \
  && pacman --noconfirm --needed -S cups ghostscript gsfonts samba expect \
  && pacman --noconfirm -Sc

ADD etc-cups /etc/cups
RUN mkdir -p /etc/cups/ssl
VOLUME /etc/cups
VOLUME /var/log/cups
VOLUME /var/spool/cups
VOLUME /var/cache/cups

ADD etc-pam.d-cups /etc/pam.d/cups

EXPOSE 631

ADD start_cups.sh /root/start_cups.sh
RUN chmod +x /root/start_cups.sh
CMD ["/root/start_cups.sh"]
