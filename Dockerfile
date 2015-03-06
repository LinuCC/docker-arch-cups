FROM linucc/base-arch-rpi2

MAINTAINER Pascal Ernst "pascal.cc.ernst@gmail.com"

# Install cups. Edit hplip-line for printer-drivers you want to install
RUN pacman --noconfirm --needed -Sy \
  && pacman --noconfirm --needed -S cups ghostscript gsfonts samba expect \
  # Drivers for your printers pleasure
  # && pacman --noconfirm --needed -S hplip \
  && pacman --noconfirm -Sc

# Disable some cups backend that are unusable within a container
RUN mkdir /usr/lib/cups/backend-available \
  && mv /usr/lib/cups/backend/parallel /usr/lib/cups/backend-available \
  && mv /usr/lib/cups/backend/serial /usr/lib/cups/backend-available \
  && mv /usr/lib/cups/backend/usb /usr/lib/cups/backend-available

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
