FROM panubo/vsftpd


RUN apt-get update && apt-get upgrade -y openssl

RUN openssl req -x509 -nodes -days 365 -subj "/C=US/ST=Denial/L=Prague/O=Dis/CN=keboola.com" -newkey rsa:1024 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem

COPY vsftpd_ssl.conf /etc/vsftpd_ssl.conf

CMD ["vsftpd", "/etc/vsftpd_ssl.conf"]
