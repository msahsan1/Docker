
<pre>
<h2> Docker Compose MariaDB" </h2>
mahsan@vmmint:~/Docker$ cd MariaDB/
mahsan@vmmint:~/Docker/MariaDB$ ll
total 16
drwxrwxr-x 2 mahsan mahsan 4096 Nov  5 18:53 ./
drwxrwxr-x 7 mahsan mahsan 4096 Nov  5 18:53 ../
-rw-rw-r-- 1 mahsan mahsan  386 Nov  5 18:51 docker-compose.yml
-rw-rw-r-- 1 mahsan mahsan  195 Nov  5 18:49 Dockerfile
mahsan@vmmint:~/Docker/MariaDB$ cat Dockerfile 
FROM ubuntu
MAINTAINER Ahsan msahsan1@gmail.com

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get -y install apache2

EXPOSE 80
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]

mahsan@vmmint:~/Docker/MariaDB$ cat docker-compose.yml 
version: '3'
services:
  db:
    image: mariadb
    volumes:
      - /var/lib/docker/disk01:/var/lib/mysql
    environment:
      MYSQL_ROOT_PASSWORD: password
      MYSQL_USER: hirsute
      MYSQL_PASSWORD: password
      MYSQL_DATABASE: hirsute_db
    ports:
      - "3306:3306"
  web:
    build: .
    ports:
      - "80:80"
    volumes:
      - /var/lib/docker/disk02:/var/www/html
mahsan@vmmint:~/Docker/MariaDB$ docker-compose up -d
Creating network "mariadb_default" with the default driver
Pulling db (mariadb:)...
latest: Pulling from library/mariadb
43f89b94cd7d: Pull complete
dfb413a01c7e: Pull complete
1d3f76b535d3: Pull complete
f7efd05ec01e: Pull complete
fe2ff83c75df: Pull complete
50ee0c078c93: Pull complete
6975e72928bb: Pull complete
561d1b426cbd: Pull complete
Digest: sha256:2403cc521634162f743b5179ff5b35520daf72df5d9e7e397192af685d9148fd
Status: Downloaded newer image for mariadb:latest
Building web
Step 1/7 : FROM ubuntu
latest: Pulling from library/ubuntu
aece8493d397: Pull complete
Digest: sha256:2b7412e6465c3c7fc5bb21d3e6f1917c167358449fecac8176c6e496e5c1f05f
Status: Downloaded newer image for ubuntu:latest
 ---> e4c58958181a
Step 2/7 : MAINTAINER Ahsan msahsan1@gmail.com
 ---> Running in f37cdb429655
Removing intermediate container f37cdb429655
 ---> 9d5e035946cb
Step 3/7 : ENV DEBIAN_FRONTEND=noninteractive
 ---> Running in ee475199c399
Removing intermediate container ee475199c399
 ---> 755ac97786e6
Step 4/7 : RUN apt-get update
 ---> Running in 56216fa32f25
Get:1 http://archive.ubuntu.com/ubuntu jammy InRelease [270 kB]
Get:2 http://security.ubuntu.com/ubuntu jammy-security InRelease [110 kB]
Get:3 http://security.ubuntu.com/ubuntu jammy-security/universe amd64 Packages [1013 kB]
Get:4 http://archive.ubuntu.com/ubuntu jammy-updates InRelease [119 kB]
Get:5 http://archive.ubuntu.com/ubuntu jammy-backports InRelease [109 kB]
Get:6 http://archive.ubuntu.com/ubuntu jammy/restricted amd64 Packages [164 kB]
Get:7 http://archive.ubuntu.com/ubuntu jammy/universe amd64 Packages [17.5 MB]
Get:8 http://security.ubuntu.com/ubuntu jammy-security/restricted amd64 Packages [1392 kB]
Get:9 http://security.ubuntu.com/ubuntu jammy-security/multiverse amd64 Packages [44.0 kB]
Get:10 http://security.ubuntu.com/ubuntu jammy-security/main amd64 Packages [1186 kB]
Get:11 http://archive.ubuntu.com/ubuntu jammy/main amd64 Packages [1792 kB]
Get:12 http://archive.ubuntu.com/ubuntu jammy/multiverse amd64 Packages [266 kB]
Get:13 http://archive.ubuntu.com/ubuntu jammy-updates/restricted amd64 Packages [1419 kB]
Get:14 http://archive.ubuntu.com/ubuntu jammy-updates/multiverse amd64 Packages [49.8 kB]
Get:15 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 Packages [1455 kB]
Get:16 http://archive.ubuntu.com/ubuntu jammy-updates/universe amd64 Packages [1279 kB]
Get:17 http://archive.ubuntu.com/ubuntu jammy-backports/universe amd64 Packages [32.6 kB]
Get:18 http://archive.ubuntu.com/ubuntu jammy-backports/main amd64 Packages [78.3 kB]
Fetched 28.3 MB in 5s (5359 kB/s)
Reading package lists...
Removing intermediate container 56216fa32f25
 ---> fa3959191ab5
Step 5/7 : RUN apt-get -y install apache2
 ---> Running in 64e264631493
Reading package lists...
Building dependency tree...
Reading state information...
The following additional packages will be installed:
  apache2-bin apache2-data apache2-utils bzip2 ca-certificates file libapr1
  libaprutil1 libaprutil1-dbd-sqlite3 libaprutil1-ldap libbrotli1 libcurl4
  libexpat1 libgdbm-compat4 libgdbm6 libicu70 libjansson4 libldap-2.5-0
  libldap-common liblua5.3-0 libmagic-mgc libmagic1 libnghttp2-14 libperl5.34
  libpsl5 librtmp1 libsasl2-2 libsasl2-modules libsasl2-modules-db
  libsqlite3-0 libssh-4 libxml2 mailcap media-types mime-support netbase
  openssl perl perl-modules-5.34 publicsuffix ssl-cert xz-utils
Suggested packages:
  apache2-doc apache2-suexec-pristine | apache2-suexec-custom www-browser ufw
  bzip2-doc gdbm-l10n libsasl2-modules-gssapi-mit
  | libsasl2-modules-gssapi-heimdal libsasl2-modules-ldap libsasl2-modules-otp
  libsasl2-modules-sql perl-doc libterm-readline-gnu-perl
  | libterm-readline-perl-perl make libtap-harness-archive-perl
The following NEW packages will be installed:
  apache2 apache2-bin apache2-data apache2-utils bzip2 ca-certificates file
  libapr1 libaprutil1 libaprutil1-dbd-sqlite3 libaprutil1-ldap libbrotli1
  libcurl4 libexpat1 libgdbm-compat4 libgdbm6 libicu70 libjansson4
  libldap-2.5-0 libldap-common liblua5.3-0 libmagic-mgc libmagic1
  libnghttp2-14 libperl5.34 libpsl5 librtmp1 libsasl2-2 libsasl2-modules
  libsasl2-modules-db libsqlite3-0 libssh-4 libxml2 mailcap media-types
  mime-support netbase openssl perl perl-modules-5.34 publicsuffix ssl-cert
  xz-utils
0 upgraded, 43 newly installed, 0 to remove and 3 not upgraded.
Need to get 25.6 MB of archives.
After this operation, 111 MB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 perl-modules-5.34 all 5.34.0-3ubuntu1.2 [2977 kB]
Get:2 http://archive.ubuntu.com/ubuntu jammy/main amd64 libgdbm6 amd64 1.23-1 [33.9 kB]
Get:3 http://archive.ubuntu.com/ubuntu jammy/main amd64 libgdbm-compat4 amd64 1.23-1 [6606 B]
Get:4 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libperl5.34 amd64 5.34.0-3ubuntu1.2 [4818 kB]
Get:5 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 perl amd64 5.34.0-3ubuntu1.2 [232 kB]
Get:6 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libapr1 amd64 1.7.0-8ubuntu0.22.04.1 [108 kB]
Get:7 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libexpat1 amd64 2.4.7-1ubuntu0.2 [91.0 kB]
Get:8 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libaprutil1 amd64 1.6.1-5ubuntu4.22.04.2 [92.8 kB]
Get:9 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libsqlite3-0 amd64 3.37.2-2ubuntu0.1 [641 kB]
Get:10 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libaprutil1-dbd-sqlite3 amd64 1.6.1-5ubuntu4.22.04.2 [11.3 kB]
Get:11 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libsasl2-modules-db amd64 2.1.27+dfsg2-3ubuntu1.2 [20.5 kB]
Get:12 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libsasl2-2 amd64 2.1.27+dfsg2-3ubuntu1.2 [53.8 kB]
Get:13 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libldap-2.5-0 amd64 2.5.16+dfsg-0ubuntu0.22.04.1 [183 kB]
Get:14 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libaprutil1-ldap amd64 1.6.1-5ubuntu4.22.04.2 [9170 B]
Get:15 http://archive.ubuntu.com/ubuntu jammy/main amd64 libbrotli1 amd64 1.0.9-2build6 [315 kB]
Get:16 http://archive.ubuntu.com/ubuntu jammy/main amd64 libnghttp2-14 amd64 1.43.0-1build3 [76.3 kB]
Get:17 http://archive.ubuntu.com/ubuntu jammy/main amd64 libpsl5 amd64 0.21.0-1.2build2 [58.4 kB]
Get:18 http://archive.ubuntu.com/ubuntu jammy/main amd64 librtmp1 amd64 2.4+20151223.gitfa8646d.1-2build4 [58.2 kB]
Get:19 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libssh-4 amd64 0.9.6-2ubuntu0.22.04.1 [185 kB]
Get:20 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libcurl4 amd64 7.81.0-1ubuntu1.14 [290 kB]
Get:21 http://archive.ubuntu.com/ubuntu jammy/main amd64 libjansson4 amd64 2.13.1-1.1build3 [32.4 kB]
Get:22 http://archive.ubuntu.com/ubuntu jammy/main amd64 liblua5.3-0 amd64 5.3.6-1build1 [140 kB]
Get:23 http://archive.ubuntu.com/ubuntu jammy/main amd64 libicu70 amd64 70.1-2 [10.6 MB]
Get:24 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libxml2 amd64 2.9.13+dfsg-1ubuntu0.3 [763 kB]
Get:25 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 apache2-bin amd64 2.4.52-1ubuntu4.6 [1345 kB]
Get:26 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 apache2-data all 2.4.52-1ubuntu4.6 [165 kB]
Get:27 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 apache2-utils amd64 2.4.52-1ubuntu4.6 [89.1 kB]
Get:28 http://archive.ubuntu.com/ubuntu jammy/main amd64 media-types all 7.0.0 [25.5 kB]
Get:29 http://archive.ubuntu.com/ubuntu jammy/main amd64 mailcap all 3.70+nmu1ubuntu1 [23.8 kB]
Get:30 http://archive.ubuntu.com/ubuntu jammy/main amd64 mime-support all 3.66 [3696 B]
Get:31 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 apache2 amd64 2.4.52-1ubuntu4.6 [97.8 kB]
Get:32 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 openssl amd64 3.0.2-0ubuntu1.12 [1182 kB]
Get:33 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 ca-certificates all 20230311ubuntu0.22.04.1 [155 kB]
Get:34 http://archive.ubuntu.com/ubuntu jammy/main amd64 netbase all 6.3 [12.9 kB]
Get:35 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libmagic-mgc amd64 1:5.41-3ubuntu0.1 [257 kB]
Get:36 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libmagic1 amd64 1:5.41-3ubuntu0.1 [87.2 kB]
Get:37 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 file amd64 1:5.41-3ubuntu0.1 [21.5 kB]
Get:38 http://archive.ubuntu.com/ubuntu jammy/main amd64 publicsuffix all 20211207.1025-1 [129 kB]
Get:39 http://archive.ubuntu.com/ubuntu jammy/main amd64 xz-utils amd64 5.2.5-2ubuntu1 [84.8 kB]
Get:40 http://archive.ubuntu.com/ubuntu jammy/main amd64 bzip2 amd64 1.0.8-5build1 [34.8 kB]
Get:41 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libldap-common all 2.5.16+dfsg-0ubuntu0.22.04.1 [15.8 kB]
Get:42 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libsasl2-modules amd64 2.1.27+dfsg2-3ubuntu1.2 [68.8 kB]
Get:43 http://archive.ubuntu.com/ubuntu jammy/main amd64 ssl-cert all 1.1.2 [17.4 kB]
debconf: delaying package configuration, since apt-utils is not installed
Fetched 25.6 MB in 4s (7215 kB/s)
Selecting previously unselected package perl-modules-5.34.
(Reading database ... 4395 files and directories currently installed.)
Preparing to unpack .../00-perl-modules-5.34_5.34.0-3ubuntu1.2_all.deb ...
Unpacking perl-modules-5.34 (5.34.0-3ubuntu1.2) ...
Selecting previously unselected package libgdbm6:amd64.
Preparing to unpack .../01-libgdbm6_1.23-1_amd64.deb ...
Unpacking libgdbm6:amd64 (1.23-1) ...
Selecting previously unselected package libgdbm-compat4:amd64.
Preparing to unpack .../02-libgdbm-compat4_1.23-1_amd64.deb ...
Unpacking libgdbm-compat4:amd64 (1.23-1) ...
Selecting previously unselected package libperl5.34:amd64.
Preparing to unpack .../03-libperl5.34_5.34.0-3ubuntu1.2_amd64.deb ...
Unpacking libperl5.34:amd64 (5.34.0-3ubuntu1.2) ...
Selecting previously unselected package perl.
Preparing to unpack .../04-perl_5.34.0-3ubuntu1.2_amd64.deb ...
Unpacking perl (5.34.0-3ubuntu1.2) ...
Selecting previously unselected package libapr1:amd64.
Preparing to unpack .../05-libapr1_1.7.0-8ubuntu0.22.04.1_amd64.deb ...
Unpacking libapr1:amd64 (1.7.0-8ubuntu0.22.04.1) ...
Selecting previously unselected package libexpat1:amd64.
Preparing to unpack .../06-libexpat1_2.4.7-1ubuntu0.2_amd64.deb ...
Unpacking libexpat1:amd64 (2.4.7-1ubuntu0.2) ...
Selecting previously unselected package libaprutil1:amd64.
Preparing to unpack .../07-libaprutil1_1.6.1-5ubuntu4.22.04.2_amd64.deb ...
Unpacking libaprutil1:amd64 (1.6.1-5ubuntu4.22.04.2) ...
Selecting previously unselected package libsqlite3-0:amd64.
Preparing to unpack .../08-libsqlite3-0_3.37.2-2ubuntu0.1_amd64.deb ...
Unpacking libsqlite3-0:amd64 (3.37.2-2ubuntu0.1) ...
Selecting previously unselected package libaprutil1-dbd-sqlite3:amd64.
Preparing to unpack .../09-libaprutil1-dbd-sqlite3_1.6.1-5ubuntu4.22.04.2_amd64.deb ...
Unpacking libaprutil1-dbd-sqlite3:amd64 (1.6.1-5ubuntu4.22.04.2) ...
Selecting previously unselected package libsasl2-modules-db:amd64.
Preparing to unpack .../10-libsasl2-modules-db_2.1.27+dfsg2-3ubuntu1.2_amd64.deb ...
Unpacking libsasl2-modules-db:amd64 (2.1.27+dfsg2-3ubuntu1.2) ...
Selecting previously unselected package libsasl2-2:amd64.
Preparing to unpack .../11-libsasl2-2_2.1.27+dfsg2-3ubuntu1.2_amd64.deb ...
Unpacking libsasl2-2:amd64 (2.1.27+dfsg2-3ubuntu1.2) ...
Selecting previously unselected package libldap-2.5-0:amd64.
Preparing to unpack .../12-libldap-2.5-0_2.5.16+dfsg-0ubuntu0.22.04.1_amd64.deb ...
Unpacking libldap-2.5-0:amd64 (2.5.16+dfsg-0ubuntu0.22.04.1) ...
Selecting previously unselected package libaprutil1-ldap:amd64.
Preparing to unpack .../13-libaprutil1-ldap_1.6.1-5ubuntu4.22.04.2_amd64.deb ...
Unpacking libaprutil1-ldap:amd64 (1.6.1-5ubuntu4.22.04.2) ...
Selecting previously unselected package libbrotli1:amd64.
Preparing to unpack .../14-libbrotli1_1.0.9-2build6_amd64.deb ...
Unpacking libbrotli1:amd64 (1.0.9-2build6) ...
Selecting previously unselected package libnghttp2-14:amd64.
Preparing to unpack .../15-libnghttp2-14_1.43.0-1build3_amd64.deb ...
Unpacking libnghttp2-14:amd64 (1.43.0-1build3) ...
Selecting previously unselected package libpsl5:amd64.
Preparing to unpack .../16-libpsl5_0.21.0-1.2build2_amd64.deb ...
Unpacking libpsl5:amd64 (0.21.0-1.2build2) ...
Selecting previously unselected package librtmp1:amd64.
Preparing to unpack .../17-librtmp1_2.4+20151223.gitfa8646d.1-2build4_amd64.deb ...
Unpacking librtmp1:amd64 (2.4+20151223.gitfa8646d.1-2build4) ...
Selecting previously unselected package libssh-4:amd64.
Preparing to unpack .../18-libssh-4_0.9.6-2ubuntu0.22.04.1_amd64.deb ...
Unpacking libssh-4:amd64 (0.9.6-2ubuntu0.22.04.1) ...
Selecting previously unselected package libcurl4:amd64.
Preparing to unpack .../19-libcurl4_7.81.0-1ubuntu1.14_amd64.deb ...
Unpacking libcurl4:amd64 (7.81.0-1ubuntu1.14) ...
Selecting previously unselected package libjansson4:amd64.
Preparing to unpack .../20-libjansson4_2.13.1-1.1build3_amd64.deb ...
Unpacking libjansson4:amd64 (2.13.1-1.1build3) ...
Selecting previously unselected package liblua5.3-0:amd64.
Preparing to unpack .../21-liblua5.3-0_5.3.6-1build1_amd64.deb ...
Unpacking liblua5.3-0:amd64 (5.3.6-1build1) ...
Selecting previously unselected package libicu70:amd64.
Preparing to unpack .../22-libicu70_70.1-2_amd64.deb ...
Unpacking libicu70:amd64 (70.1-2) ...
Selecting previously unselected package libxml2:amd64.
Preparing to unpack .../23-libxml2_2.9.13+dfsg-1ubuntu0.3_amd64.deb ...
Unpacking libxml2:amd64 (2.9.13+dfsg-1ubuntu0.3) ...
Selecting previously unselected package apache2-bin.
Preparing to unpack .../24-apache2-bin_2.4.52-1ubuntu4.6_amd64.deb ...
Unpacking apache2-bin (2.4.52-1ubuntu4.6) ...
Selecting previously unselected package apache2-data.
Preparing to unpack .../25-apache2-data_2.4.52-1ubuntu4.6_all.deb ...
Unpacking apache2-data (2.4.52-1ubuntu4.6) ...
Selecting previously unselected package apache2-utils.
Preparing to unpack .../26-apache2-utils_2.4.52-1ubuntu4.6_amd64.deb ...
Unpacking apache2-utils (2.4.52-1ubuntu4.6) ...
Selecting previously unselected package media-types.
Preparing to unpack .../27-media-types_7.0.0_all.deb ...
Unpacking media-types (7.0.0) ...
Selecting previously unselected package mailcap.
Preparing to unpack .../28-mailcap_3.70+nmu1ubuntu1_all.deb ...
Unpacking mailcap (3.70+nmu1ubuntu1) ...
Selecting previously unselected package mime-support.
Preparing to unpack .../29-mime-support_3.66_all.deb ...
Unpacking mime-support (3.66) ...
Selecting previously unselected package apache2.
Preparing to unpack .../30-apache2_2.4.52-1ubuntu4.6_amd64.deb ...
Unpacking apache2 (2.4.52-1ubuntu4.6) ...
Selecting previously unselected package openssl.
Preparing to unpack .../31-openssl_3.0.2-0ubuntu1.12_amd64.deb ...
Unpacking openssl (3.0.2-0ubuntu1.12) ...
Selecting previously unselected package ca-certificates.
Preparing to unpack .../32-ca-certificates_20230311ubuntu0.22.04.1_all.deb ...
Unpacking ca-certificates (20230311ubuntu0.22.04.1) ...
Selecting previously unselected package netbase.
Preparing to unpack .../33-netbase_6.3_all.deb ...
Unpacking netbase (6.3) ...
Selecting previously unselected package libmagic-mgc.
Preparing to unpack .../34-libmagic-mgc_1%3a5.41-3ubuntu0.1_amd64.deb ...
Unpacking libmagic-mgc (1:5.41-3ubuntu0.1) ...
Selecting previously unselected package libmagic1:amd64.
Preparing to unpack .../35-libmagic1_1%3a5.41-3ubuntu0.1_amd64.deb ...
Unpacking libmagic1:amd64 (1:5.41-3ubuntu0.1) ...
Selecting previously unselected package file.
Preparing to unpack .../36-file_1%3a5.41-3ubuntu0.1_amd64.deb ...
Unpacking file (1:5.41-3ubuntu0.1) ...
Selecting previously unselected package publicsuffix.
Preparing to unpack .../37-publicsuffix_20211207.1025-1_all.deb ...
Unpacking publicsuffix (20211207.1025-1) ...
Selecting previously unselected package xz-utils.
Preparing to unpack .../38-xz-utils_5.2.5-2ubuntu1_amd64.deb ...
Unpacking xz-utils (5.2.5-2ubuntu1) ...
Selecting previously unselected package bzip2.
Preparing to unpack .../39-bzip2_1.0.8-5build1_amd64.deb ...
Unpacking bzip2 (1.0.8-5build1) ...
Selecting previously unselected package libldap-common.
Preparing to unpack .../40-libldap-common_2.5.16+dfsg-0ubuntu0.22.04.1_all.deb ...
Unpacking libldap-common (2.5.16+dfsg-0ubuntu0.22.04.1) ...
Selecting previously unselected package libsasl2-modules:amd64.
Preparing to unpack .../41-libsasl2-modules_2.1.27+dfsg2-3ubuntu1.2_amd64.deb ...
Unpacking libsasl2-modules:amd64 (2.1.27+dfsg2-3ubuntu1.2) ...
Selecting previously unselected package ssl-cert.
Preparing to unpack .../42-ssl-cert_1.1.2_all.deb ...
Unpacking ssl-cert (1.1.2) ...
Setting up libexpat1:amd64 (2.4.7-1ubuntu0.2) ...
Setting up media-types (7.0.0) ...
Setting up libpsl5:amd64 (0.21.0-1.2build2) ...
Setting up libmagic-mgc (1:5.41-3ubuntu0.1) ...
Setting up libbrotli1:amd64 (1.0.9-2build6) ...
Setting up libsqlite3-0:amd64 (3.37.2-2ubuntu0.1) ...
Setting up libsasl2-modules:amd64 (2.1.27+dfsg2-3ubuntu1.2) ...
Setting up libnghttp2-14:amd64 (1.43.0-1build3) ...
Setting up libmagic1:amd64 (1:5.41-3ubuntu0.1) ...
Setting up libapr1:amd64 (1.7.0-8ubuntu0.22.04.1) ...
Setting up file (1:5.41-3ubuntu0.1) ...
Setting up perl-modules-5.34 (5.34.0-3ubuntu1.2) ...
Setting up bzip2 (1.0.8-5build1) ...
Setting up libldap-common (2.5.16+dfsg-0ubuntu0.22.04.1) ...
Setting up libjansson4:amd64 (2.13.1-1.1build3) ...
Setting up libsasl2-modules-db:amd64 (2.1.27+dfsg2-3ubuntu1.2) ...
Setting up librtmp1:amd64 (2.4+20151223.gitfa8646d.1-2build4) ...
Setting up xz-utils (5.2.5-2ubuntu1) ...
update-alternatives: using /usr/bin/xz to provide /usr/bin/lzma (lzma) in auto mode
update-alternatives: warning: skip creation of /usr/share/man/man1/lzma.1.gz because associated file /usr/share/man/man1/xz.1.gz (of link group lzma) doesn't exist
update-alternatives: warning: skip creation of /usr/share/man/man1/unlzma.1.gz because associated file /usr/share/man/man1/unxz.1.gz (of link group lzma) doesn't exist
update-alternatives: warning: skip creation of /usr/share/man/man1/lzcat.1.gz because associated file /usr/share/man/man1/xzcat.1.gz (of link group lzma) doesn't exist
update-alternatives: warning: skip creation of /usr/share/man/man1/lzmore.1.gz because associated file /usr/share/man/man1/xzmore.1.gz (of link group lzma) doesn't exist
update-alternatives: warning: skip creation of /usr/share/man/man1/lzless.1.gz because associated file /usr/share/man/man1/xzless.1.gz (of link group lzma) doesn't exist
update-alternatives: warning: skip creation of /usr/share/man/man1/lzdiff.1.gz because associated file /usr/share/man/man1/xzdiff.1.gz (of link group lzma) doesn't exist
update-alternatives: warning: skip creation of /usr/share/man/man1/lzcmp.1.gz because associated file /usr/share/man/man1/xzcmp.1.gz (of link group lzma) doesn't exist
update-alternatives: warning: skip creation of /usr/share/man/man1/lzgrep.1.gz because associated file /usr/share/man/man1/xzgrep.1.gz (of link group lzma) doesn't exist
update-alternatives: warning: skip creation of /usr/share/man/man1/lzegrep.1.gz because associated file /usr/share/man/man1/xzegrep.1.gz (of link group lzma) doesn't exist
update-alternatives: warning: skip creation of /usr/share/man/man1/lzfgrep.1.gz because associated file /usr/share/man/man1/xzfgrep.1.gz (of link group lzma) doesn't exist
Setting up libsasl2-2:amd64 (2.1.27+dfsg2-3ubuntu1.2) ...
Setting up libssh-4:amd64 (0.9.6-2ubuntu0.22.04.1) ...
Setting up liblua5.3-0:amd64 (5.3.6-1build1) ...
Setting up netbase (6.3) ...
Setting up apache2-data (2.4.52-1ubuntu4.6) ...
Setting up openssl (3.0.2-0ubuntu1.12) ...
Setting up publicsuffix (20211207.1025-1) ...
Setting up libgdbm6:amd64 (1.23-1) ...
Setting up libicu70:amd64 (70.1-2) ...
Setting up libaprutil1:amd64 (1.6.1-5ubuntu4.22.04.2) ...
Setting up libaprutil1-dbd-sqlite3:amd64 (1.6.1-5ubuntu4.22.04.2) ...
Setting up libldap-2.5-0:amd64 (2.5.16+dfsg-0ubuntu0.22.04.1) ...
Setting up ca-certificates (20230311ubuntu0.22.04.1) ...
Updating certificates in /etc/ssl/certs...
137 added, 0 removed; done.
Setting up ssl-cert (1.1.2) ...
Setting up libgdbm-compat4:amd64 (1.23-1) ...
Setting up libcurl4:amd64 (7.81.0-1ubuntu1.14) ...
Setting up libxml2:amd64 (2.9.13+dfsg-1ubuntu0.3) ...
Setting up apache2-utils (2.4.52-1ubuntu4.6) ...
Setting up libperl5.34:amd64 (5.34.0-3ubuntu1.2) ...
Setting up libaprutil1-ldap:amd64 (1.6.1-5ubuntu4.22.04.2) ...
Setting up perl (5.34.0-3ubuntu1.2) ...
Setting up mailcap (3.70+nmu1ubuntu1) ...
Setting up mime-support (3.66) ...
Setting up apache2-bin (2.4.52-1ubuntu4.6) ...
Setting up apache2 (2.4.52-1ubuntu4.6) ...
Enabling module mpm_event.
Enabling module authz_core.
Enabling module authz_host.
Enabling module authn_core.
Enabling module auth_basic.
Enabling module access_compat.
Enabling module authn_file.
Enabling module authz_user.
Enabling module alias.
Enabling module dir.
Enabling module autoindex.
Enabling module env.
Enabling module mime.
Enabling module negotiation.
Enabling module setenvif.
Enabling module filter.
Enabling module deflate.
Enabling module status.
Enabling module reqtimeout.
Enabling conf charset.
Enabling conf localized-error-pages.
Enabling conf other-vhosts-access-log.
Enabling conf security.
Enabling conf serve-cgi-bin.
Enabling site 000-default.
invoke-rc.d: could not determine current runlevel
invoke-rc.d: policy-rc.d denied execution of start.
Processing triggers for libc-bin (2.35-0ubuntu3.4) ...
Processing triggers for ca-certificates (20230311ubuntu0.22.04.1) ...
Updating certificates in /etc/ssl/certs...
0 added, 0 removed; done.
Running hooks in /etc/ca-certificates/update.d...
done.
Removing intermediate container 64e264631493
 ---> 5f9a8fa43994
Step 6/7 : EXPOSE 80
 ---> Running in 44008c497e4e
Removing intermediate container 44008c497e4e
 ---> b357b8f1fc47
Step 7/7 : CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
 ---> Running in 2fa058cd8243
Removing intermediate container 2fa058cd8243
 ---> 56d543d35dd0
Successfully built 56d543d35dd0
Successfully tagged mariadb_web:latest
WARNING: Image for service web was built because it did not already exist. To rebuild this image you must use `docker-compose build` or `docker-compose up --build`.
Creating mariadb_web_1 ... done
Creating mariadb_db_1  ... done
mahsan@vmmint:~/Docker/MariaDB$ 

mahsan@vmmint:~/Docker/MariaDB$ docker ps
CONTAINER ID   IMAGE                 COMMAND                  CREATED             STATUS             PORTS                                                                                      NAMES
edd82e21bb69   mariadb               "docker-entrypoint.s…"   2 minutes ago       Up 2 minutes       0.0.0.0:3306->3306/tcp, :::3306->3306/tcp                                                  mariadb_db_1
825b4a3a3fe2   mariadb_web           "/usr/sbin/apachectl…"   2 minutes ago       Up 2 minutes       0.0.0.0:80->80/tcp, :::80->80/tcp                                                          mariadb_web_1
e561db37971f   jenkins/jenkins:lts   "/usr/bin/tini -- /u…"   About an hour ago   Up About an hour   0.0.0.0:8080->8080/tcp, :::8080->8080/tcp, 0.0.0.0:50000->50000/tcp, :::50000->50000/tcp   jenkins
mahsan@vmmint:~/Docker/MariaDB$ docker-compose ps 
    Name                   Command               State                    Ports                  
-------------------------------------------------------------------------------------------------
mariadb_db_1    docker-entrypoint.sh mariadbd    Up      0.0.0.0:3306->3306/tcp,:::3306->3306/tcp
mariadb_web_1   /usr/sbin/apachectl -D FOR ...   Up      0.0.0.0:80->80/tcp,:::80->80/tcp        
mahsan@vmmint:~/Docker/MariaDB$ 

mahsan@vmmint:~/Docker/MariaDB$ mysql -h 127.0.0.1 -u root -p -e "show variables like 'hostname';" 
Enter password: 
+---------------+--------------+
| Variable_name | Value        |
+---------------+--------------+
| hostname      | edd82e21bb69 |
+---------------+--------------+
mahsan@vmmint:~/Docker/MariaDB$ 

root@vmmint:~# id
uid=0(root) gid=0(root) groups=0(root)
root@vmmint:~# echo "Hello Docker Compose World" > /var/lib/docker/disk02/index.html 
root@vmmint:~# 

root@vmmint:~# curl 127.0.0.1 
Hello Docker Compose World

ahsan@vmmint:~/Docker/MariaDB$ docker-compose logs 
Attaching to mariadb_db_1, mariadb_web_1
db_1   | 2023-11-06 02:55:19+00:00 [Note] [Entrypoint]: Entrypoint script for MariaDB Server 1:11.1.2+maria~ubu2204 started.
db_1   | 2023-11-06 02:55:19+00:00 [Note] [Entrypoint]: Switching to dedicated user 'mysql'
db_1   | 2023-11-06 02:55:19+00:00 [Note] [Entrypoint]: Entrypoint script for MariaDB Server 1:11.1.2+maria~ubu2204 started.
db_1   | 2023-11-06 02:55:20+00:00 [Note] [Entrypoint]: Initializing database files
db_1   | 
db_1   | 
db_1   | PLEASE REMEMBER TO SET A PASSWORD FOR THE MariaDB root USER !
db_1   | To do so, start the server, then issue the following command:
db_1   | 
db_1   | '/usr/bin/mariadb-secure-installation'
db_1   | 
db_1   | which will also give you the option of removing the test
db_1   | databases and anonymous user created by default.  This is
db_1   | strongly recommended for production servers.
db_1   | 
db_1   | See the MariaDB Knowledgebase at https://mariadb.com/kb
db_1   | 
db_1   | Please report any problems at https://mariadb.org/jira
db_1   | 
db_1   | The latest information about MariaDB is available at https://mariadb.org/.
db_1   | 
db_1   | Consider joining MariaDB's strong and vibrant community:
db_1   | https://mariadb.org/get-involved/
db_1   | 
db_1   | 2023-11-06 02:55:21+00:00 [Note] [Entrypoint]: Database files initialized
db_1   | 2023-11-06 02:55:21+00:00 [Note] [Entrypoint]: Starting temporary server
db_1   | 2023-11-06 02:55:21+00:00 [Note] [Entrypoint]: Waiting for server startup
db_1   | 2023-11-06  2:55:21 0 [Note] Starting MariaDB 11.1.2-MariaDB-1:11.1.2+maria~ubu2204 source revision 9bc25d98209df6810f7a7d5e7dd3ae677a313ab5 as process 100
db_1   | 2023-11-06  2:55:21 0 [Note] InnoDB: Compressed tables use zlib 1.2.11
db_1   | 2023-11-06  2:55:21 0 [Note] InnoDB: Number of transaction pools: 1
db_1   | 2023-11-06  2:55:21 0 [Note] InnoDB: Using crc32 + pclmulqdq instructions
db_1   | 2023-11-06  2:55:21 0 [Note] mariadbd: O_TMPFILE is not supported on /tmp (disabling future attempts)
db_1   | 2023-11-06  2:55:21 0 [Note] InnoDB: Initializing buffer pool, total size = 128.000MiB, chunk size = 2.000MiB
db_1   | 2023-11-06  2:55:21 0 [Note] InnoDB: Completed initialization of buffer pool
db_1   | 2023-11-06  2:55:21 0 [Note] InnoDB: File system buffers for log disabled (block size=512 bytes)
db_1   | 2023-11-06  2:55:21 0 [Note] InnoDB: End of log at LSN=46125
db_1   | 2023-11-06  2:55:21 0 [Note] InnoDB: Opened 3 undo tablespaces
db_1   | 2023-11-06  2:55:21 0 [Note] InnoDB: 128 rollback segments in 3 undo tablespaces are active.
db_1   | 2023-11-06  2:55:21 0 [Note] InnoDB: Setting file './ibtmp1' size to 12.000MiB. Physically writing the file full; Please wait ...
db_1   | 2023-11-06  2:55:21 0 [Note] InnoDB: File './ibtmp1' size is now 12.000MiB.
db_1   | 2023-11-06  2:55:21 0 [Note] InnoDB: log sequence number 46125; transaction id 14
db_1   | 2023-11-06  2:55:21 0 [Note] Plugin 'FEEDBACK' is disabled.
db_1   | 2023-11-06  2:55:21 0 [Note] Plugin 'wsrep-provider' is disabled.
db_1   | 2023-11-06  2:55:21 0 [Warning] 'user' entry 'root@edd82e21bb69' ignored in --skip-name-resolve mode.
db_1   | 2023-11-06  2:55:21 0 [Warning] 'proxies_priv' entry '@% root@edd82e21bb69' ignored in --skip-name-resolve mode.
db_1   | 2023-11-06  2:55:21 0 [Note] mariadbd: Event Scheduler: Loaded 0 events
db_1   | 2023-11-06  2:55:21 0 [Note] mariadbd: ready for connections.
db_1   | Version: '11.1.2-MariaDB-1:11.1.2+maria~ubu2204'  socket: '/run/mysqld/mysqld.sock'  port: 0  mariadb.org binary distribution
db_1   | 2023-11-06 02:55:22+00:00 [Note] [Entrypoint]: Temporary server started.
db_1   | 2023-11-06 02:55:23+00:00 [Note] [Entrypoint]: Creating database hirsute_db
db_1   | 2023-11-06 02:55:23+00:00 [Note] [Entrypoint]: Creating user hirsute
db_1   | 2023-11-06 02:55:23+00:00 [Note] [Entrypoint]: Giving user hirsute access to schema hirsute_db
db_1   | 2023-11-06 02:55:23+00:00 [Note] [Entrypoint]: Securing system users (equivalent to running mysql_secure_installation)
db_1   | 
db_1   | 2023-11-06 02:55:23+00:00 [Note] [Entrypoint]: Stopping temporary server
db_1   | 2023-11-06  2:55:23 0 [Note] mariadbd (initiated by: unknown): Normal shutdown
db_1   | 2023-11-06  2:55:23 0 [Note] InnoDB: FTS optimize thread exiting.
db_1   | 2023-11-06  2:55:23 0 [Note] InnoDB: Starting shutdown...
db_1   | 2023-11-06  2:55:23 0 [Note] InnoDB: Dumping buffer pool(s) to /var/lib/mysql/ib_buffer_pool
db_1   | 2023-11-06  2:55:23 0 [Note] InnoDB: Buffer pool(s) dump completed at 231106  2:55:23
db_1   | 2023-11-06  2:55:23 0 [Note] InnoDB: Removed temporary tablespace data file: "./ibtmp1"
db_1   | 2023-11-06  2:55:23 0 [Note] InnoDB: Shutdown completed; log sequence number 47375; transaction id 15
db_1   | 2023-11-06  2:55:23 0 [Note] mariadbd: Shutdown complete
db_1   | 
db_1   | 2023-11-06 02:55:23+00:00 [Note] [Entrypoint]: Temporary server stopped
db_1   | 
db_1   | 2023-11-06 02:55:23+00:00 [Note] [Entrypoint]: MariaDB init process done. Ready for start up.
db_1   | 
db_1   | 2023-11-06  2:55:24 0 [Note] Starting MariaDB 11.1.2-MariaDB-1:11.1.2+maria~ubu2204 source revision 9bc25d98209df6810f7a7d5e7dd3ae677a313ab5 as process 1
db_1   | 2023-11-06  2:55:24 0 [Note] InnoDB: Compressed tables use zlib 1.2.11
db_1   | 2023-11-06  2:55:24 0 [Note] InnoDB: Number of transaction pools: 1
db_1   | 2023-11-06  2:55:24 0 [Note] InnoDB: Using crc32 + pclmulqdq instructions
db_1   | 2023-11-06  2:55:24 0 [Note] mariadbd: O_TMPFILE is not supported on /tmp (disabling future attempts)
db_1   | 2023-11-06  2:55:24 0 [Note] InnoDB: Initializing buffer pool, total size = 128.000MiB, chunk size = 2.000MiB
db_1   | 2023-11-06  2:55:24 0 [Note] InnoDB: Completed initialization of buffer pool
db_1   | 2023-11-06  2:55:24 0 [Note] InnoDB: File system buffers for log disabled (block size=512 bytes)
db_1   | 2023-11-06  2:55:24 0 [Note] InnoDB: End of log at LSN=47375
db_1   | 2023-11-06  2:55:24 0 [Note] InnoDB: Opened 3 undo tablespaces
db_1   | 2023-11-06  2:55:24 0 [Note] InnoDB: 128 rollback segments in 3 undo tablespaces are active.
db_1   | 2023-11-06  2:55:24 0 [Note] InnoDB: Setting file './ibtmp1' size to 12.000MiB. Physically writing the file full; Please wait ...
db_1   | 2023-11-06  2:55:24 0 [Note] InnoDB: File './ibtmp1' size is now 12.000MiB.
db_1   | 2023-11-06  2:55:24 0 [Note] InnoDB: log sequence number 47375; transaction id 14
db_1   | 2023-11-06  2:55:24 0 [Note] InnoDB: Loading buffer pool(s) from /var/lib/mysql/ib_buffer_pool
db_1   | 2023-11-06  2:55:24 0 [Note] Plugin 'FEEDBACK' is disabled.
db_1   | 2023-11-06  2:55:24 0 [Note] Plugin 'wsrep-provider' is disabled.
db_1   | 2023-11-06  2:55:24 0 [Note] InnoDB: Buffer pool(s) load completed at 231106  2:55:24
db_1   | 2023-11-06  2:55:24 0 [Note] Server socket created on IP: '0.0.0.0'.
db_1   | 2023-11-06  2:55:24 0 [Note] Server socket created on IP: '::'.
db_1   | 2023-11-06  2:55:24 0 [Note] mariadbd: Event Scheduler: Loaded 0 events
db_1   | 2023-11-06  2:55:24 0 [Note] mariadbd: ready for connections.
db_1   | Version: '11.1.2-MariaDB-1:11.1.2+maria~ubu2204'  socket: '/run/mysqld/mysqld.sock'  port: 3306  mariadb.org binary distribution
web_1  | AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.19.0.2. Set the 'ServerName' directive globally to suppress this message
mahsan@vmmint:~/Docker/MariaDB$ 


ahsan@vmmint:~/Docker/MariaDB$ docker-compose exec db /bin/bash 
root@edd82e21bb69:/# ls
bin  boot  dev  docker-entrypoint-initdb.d  etc  home  lib  lib32  lib64  libx32  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
root@edd82e21bb69:/# pwd

mahsan@vmmint:~/Docker/MariaDB$ docker-compose stop
Stopping mariadb_db_1  ... done
Stopping mariadb_web_1 ... done
mahsan@vmmint:~/Docker/MariaDB$ docker-compose ps -a
    Name                   Command                State     Ports
-----------------------------------------------------------------
mariadb_db_1    docker-entrypoint.sh mariadbd    Exit 0          
mariadb_web_1   /usr/sbin/apachectl -D FOR ...   Exit 137        
mahsan@vmmint:~/Docker/MariaDB$ docker-compose rm
Going to remove mariadb_db_1, mariadb_web_1
Are you sure? [yN] y
Removing mariadb_db_1  ... done
Removing mariadb_web_1 ... done
mahsan@vmmint:~/Docker/MariaDB$ 


</pre>


