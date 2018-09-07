FROM ubuntu:18.04
MAINTAINER Ian Kao <m94720065@gmail.com>
ARG DEBIAN_FRONTEND=noninteractive
\
RUN apt-get update && \
  apt-get install -y --no-install-recommends \
		libapache2-mod-php7.2 \
    locales \
    vim \
    ssh \
    snmp \
    apache2 \
    php \
    php-mysql \
    php-mbstring \
    php-gd \
    php-snmp \
    php-ldap \
    php-bcmath \
    mysql-client \
    libxml2 \
    curl \
    openssl \
    ca-cacert \
    supervisor && \
  apt-get clean && \
  echo "set number" >> /etc/vimrc && \
  mkdir /var/run/sshd && \
  sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
  sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
  echo 'root:changeme' | chpasswd && \
  mkdir -p /root/.ssh && \
  touch /root/.ssh/authorized_keys && \
  chmod 700 /root/.ssh && \
  rm -rf /var/lib/apt/lists/* && \
  localedef -i zh_TW -c -f UTF-8 -A /usr/share/locale/locale.alias zh_TW.UTF-8
\
ENV LANG zh_TW.utf8
ADD index.php /var/www/html/
ADD supervisord.conf /etc/
\
EXPOSE 22 80
CMD ["supervisord", "-n"]