#!/bin/bash
echo $MAIL_NAME > /etc/mailname
postconf -e myhostname=$MAIL_NAME
postconf -e "mynetworks=127.0.0.0/8 $DOCKER_IP/8"
postconf -e relayhost=[$MAIL_HOST]:$MAIL_PORT
postconf -e smtp_use_tls=yes
postconf -e smtp_sasl_auth_enable=yes
postconf -e smtp_sasl_security_options=
postconf -e smtp_sasl_password_maps=hash:/etc/postfix/sasl_passwd
postconf -e smtp_tls_CAfile=/etc/ssl/certs/ca-certificates.crt
echo "[$MAIL_HOST]:$MAIL_PORT $MAIL_USERNAME:$MAIL_PASSWORD" > /etc/postfix/sasl_passwd
postmap /etc/postfix/sasl_passwd
service rsyslog start
service postfix restart
postfix start
postfix reload
tail -f /dev/null