FROM alpine:3.15.4

RUN apk add --no-cache bind

EXPOSE 53

CMD ["named", "-c", "/etc/bind/named.conf", "-g", "-u", "named"]
