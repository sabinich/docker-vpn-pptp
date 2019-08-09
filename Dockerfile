FROM alpine:latest
MAINTAINER Przemek Szalko <przemek@mobtitude.com>
MAINTAINER vadim s. sabinich <vadim@sabini.ch>

RUN apk add pptpd iptables

ADD ./etc/pptpd.conf /etc/pptpd.conf
ADD ./etc/ppp/pptpd-options /etc/ppp/pptpd-options

ADD entrypoint.sh /entrypoint.sh
RUN chmod 0700 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["pptpd", "--fg"]
