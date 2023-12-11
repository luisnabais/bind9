FROM alpine:3.19.0

RUN apk add --no-cache bind

EXPOSE 53

CMD ["named", "-c", "/etc/bind/named.conf", "-g", "-u", "named"]
