FROM alpine:latest
LABEL maintainer=przemek@mobtitude.com> \
      maintainer=vadim@sabini.ch
      
RUN apk add pptpd ppp iptables

ADD ./etc/pptpd.conf /etc/pptpd.conf
ADD ./etc/ppp/pptpd-options /etc/ppp/pptpd-options

ADD entrypoint.sh /entrypoint.sh
RUN chmod 0700 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["pptpd", "--fg"]
